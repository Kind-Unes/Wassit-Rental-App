// import 'package:path/path.dart' as p;

// import 'package:path_provider/path_provider.dart';
// import 'package:wassit_cars_rental_app/objectbox.g.dart';
// import 'package:wassit_cars_rental_app/src/models/data-models/reminder_taks_model.dart';

// class ObjectBox {
//   late final Store store;

//   // databases (stores)
//   late final Box<ReminderTaskModel> reminderTaskModelBox;

//   ObjectBox._init(this.store) {
//     reminderTaskModelBox = Box<ReminderTaskModel>(store);
//   }

//   static Future<ObjectBox> init() async {
//     // final store = await openStore();
//     final docsDir = await getApplicationDocumentsDirectory();
//     final store =
//         await openStore(directory: p.join(docsDir.path, "obx-example"));
//     return ObjectBox._init(store);
//   }

//   ReminderTaskModel? getTask(int id) {
//     return reminderTaskModelBox.get(id);
//   }

//   Stream<List<ReminderTaskModel>> getAllTasks() {
//     return reminderTaskModelBox
//         .query()
//         .watch(triggerImmediately: true)
//         .map((query) {
//       return query.find();
//     });
//   }

//   Future writeTask(ReminderTaskModel task) async {
//     return reminderTaskModelBox.put(task);
//   }

//   bool deleteTask(int id) {
//     return reminderTaskModelBox.remove(id);
//   }

// //
// }
