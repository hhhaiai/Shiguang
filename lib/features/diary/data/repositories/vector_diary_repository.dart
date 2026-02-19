import 'dart:typed_data';
import '../../../../core/objectbox/objectbox_service.dart';
import '../../../../objectbox.g.dart';
import '../entities/vector_diary.dart';

class VectorDiaryRepository {
  final ObjectBoxService _objectBoxService;

  VectorDiaryRepository(this._objectBoxService);

  Box<VectorDiary> get _box => _objectBoxService.vectorDiaryBox;

  /// Create a new diary entry
  VectorDiary create({
    required int accountId,
    required String rawText,
    String? aiSummary,
    String? aiTags,
    Float32List? embedding,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch;
    final diary = VectorDiary(
      accountId: accountId,
      rawText: rawText,
      aiSummary: aiSummary,
      aiTags: aiTags,
      embedding: embedding,
      createdAt: now,
      updatedAt: now,
    );
    _box.put(diary);
    return diary;
  }

  /// Get diary by ID
  VectorDiary? getById(int id) {
    return _box.get(id);
  }

  /// Get diary by ID scoped to an account
  VectorDiary? getByIdForAccount({
    required int accountId,
    required int diaryId,
    bool includeDeleted = false,
  }) {
    final conditions = includeDeleted
        ? (VectorDiary_.id.equals(diaryId) &
              VectorDiary_.accountId.equals(accountId))
        : (VectorDiary_.id.equals(diaryId) &
              VectorDiary_.accountId.equals(accountId) &
              VectorDiary_.isDeleted.equals(false));
    final query = _box.query(conditions).build();
    final result = query.findFirst();
    query.close();
    return result;
  }

  /// Get all diaries for an account
  List<VectorDiary> getByAccountId(
    int accountId, {
    int limit = 100,
    int offset = 0,
  }) {
    final query = _box
        .query(
          VectorDiary_.accountId.equals(accountId) &
              VectorDiary_.isDeleted.equals(false),
        )
        .order(VectorDiary_.createdAt, flags: Order.descending)
        .build();
    final results = query.find();
    query.close();
    // Apply offset and limit manually as ObjectBox query doesn't support these parameters directly
    final filtered = results.skip(offset).take(limit).toList();
    return filtered;
  }

  /// Search by vector similarity
  List<VectorDiary> searchByVector({
    required int accountId,
    required Float32List queryVector,
    int limit = 10,
  }) {
    if (queryVector.isEmpty || limit <= 0) {
      return [];
    }

    // Fetch more candidates than final limit to improve ANN quality.
    final candidateCount = limit < 20 ? 20 : limit * 2;
    final query = _box
        .query(
          VectorDiary_.accountId.equals(accountId) &
              VectorDiary_.isDeleted.equals(false) &
              VectorDiary_.embedding.nearestNeighborsF32(
                queryVector,
                candidateCount,
              ),
        )
        .build();

    query.limit = limit;
    final results = query.find();
    query.close();
    return results;
  }

  /// Update diary
  VectorDiary update(VectorDiary diary) {
    diary.updatedAt = DateTime.now().millisecondsSinceEpoch;
    _box.put(diary);
    return diary;
  }

  /// Soft delete diary
  void softDelete(int id) {
    final diary = _box.get(id);
    if (diary != null) {
      diary.isDeleted = true;
      diary.updatedAt = DateTime.now().millisecondsSinceEpoch;
      _box.put(diary);
    }
  }

  /// Soft delete diary scoped to an account
  bool softDeleteForAccount({required int accountId, required int diaryId}) {
    final diary = getByIdForAccount(accountId: accountId, diaryId: diaryId);
    if (diary == null) {
      return false;
    }

    diary.isDeleted = true;
    diary.updatedAt = DateTime.now().millisecondsSinceEpoch;
    _box.put(diary);
    return true;
  }

  /// Hard delete diary
  bool delete(int id) {
    return _box.remove(id);
  }

  /// Get diary count for account
  int getCount(int accountId) {
    final query = _box
        .query(
          VectorDiary_.accountId.equals(accountId) &
              VectorDiary_.isDeleted.equals(false),
        )
        .build();
    final count = query.count();
    query.close();
    return count;
  }

  /// Close query resources
  void closeQuery(Query query) {
    query.close();
  }
}
