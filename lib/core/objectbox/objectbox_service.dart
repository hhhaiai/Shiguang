import 'package:path_provider/path_provider.dart';
import '../../features/auth/data/entities/local_account.dart';
import '../../features/diary/data/entities/vector_diary.dart';
import '../../features/reminder/data/entities/local_reminder.dart';
import '../../objectbox.g.dart';

class ObjectBoxService {
  late final Store store;
  late final Box<LocalAccount> localAccountBox;
  late final Box<VectorDiary> vectorDiaryBox;
  late final Box<LocalReminder> localReminderBox;

  ObjectBoxService._create(this.store) {
    localAccountBox = Box<LocalAccount>(store);
    vectorDiaryBox = Box<VectorDiary>(store);
    localReminderBox = Box<LocalReminder>(store);
  }

  static Future<ObjectBoxService> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: '${docsDir.path}/objectbox');
    return ObjectBoxService._create(store);
  }

  static Future<ObjectBoxService> createInDirectory(String directory) async {
    final store = await openStore(directory: directory);
    return ObjectBoxService._create(store);
  }

  void close() {
    store.close();
  }
}
