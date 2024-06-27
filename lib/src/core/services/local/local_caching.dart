import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/src/pages/home/model/tag_model.dart';
import 'package:todo_app/src/pages/home/model/todo_model.dart';

// Uygulamanın local veri tabanını kullandığımız kısım
class LocalCaching {
  static final LocalCaching _instance = LocalCaching._internal();

  String todoBoxName = "todoBox";
  String tagBoxName = "tagBox";
  static LocalCaching get instance => _instance;

  LocalCaching._internal();

  late Box todoBox;
  late Box tagBox;

  static cacheInit() async {
    Hive.registerAdapter(TodoModelAdapter());
    Hive.registerAdapter(TagModelAdapter());
    await Hive.initFlutter();
    instance.todoBox = await Hive.openBox(instance.todoBoxName);
    instance.tagBox = await Hive.openBox(instance.tagBoxName);
  }

  List<TodoModel> getTodos() {
    List<TodoModel> todos = [];
    for (var i = 0; i < instance.todoBox.length; i++) {
      final todo = instance.todoBox.getAt(i);
      if (todo is TodoModel) {
        todos.add(todo);
      }
    }
    return todos;
  }

  void addTodoModel(TodoModel todoModel) {
    instance.todoBox.add(todoModel);
  }

  void removeTask(TodoModel todoModel) {
    for (int i = 0; i < instance.todoBox.length; i++) {
      final todo = instance.todoBox.getAt(i);
      if (todo is TodoModel) {
        if (todo.id == todoModel.id) {
          instance.todoBox.deleteAt(i);

          break;
        }
      }
    }
  }

  void addTagModel(TagModel tagModel) {
    instance.tagBox.add(tagModel);
  }

  List<TagModel> getTags() {
    List<TagModel> tags = [];
    for (var i = 0; i < instance.tagBox.length; i++) {
      final tag = instance.tagBox.getAt(i);

      if (tag is TagModel) {
        tags.add(tag);
      }
    }
    return tags;
  }

  void updateTask(TodoModel todo) {
    for (int i = 0; i < instance.todoBox.length; i++) {
      final todoModel = instance.todoBox.getAt(i);
      if (todoModel is TodoModel) {
        if (todoModel.id == todo.id) {
          instance.todoBox.putAt(i, todo);
          break;
        }
      }
    }
  }
}
