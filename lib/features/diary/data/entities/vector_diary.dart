import 'dart:typed_data';
import 'package:objectbox/objectbox.dart';

@Entity()
class VectorDiary {
  @Id()
  int id;

  int accountId;

  String rawText;

  String? aiSummary;

  String? aiTags;

  @HnswIndex(dimensions: 384)
  Float32List? embedding;

  int createdAt;

  int updatedAt;

  bool isDeleted;

  VectorDiary({
    this.id = 0,
    required this.accountId,
    required this.rawText,
    this.aiSummary,
    this.aiTags,
    this.embedding,
    required this.createdAt,
    required this.updatedAt,
    this.isDeleted = false,
  });
}
