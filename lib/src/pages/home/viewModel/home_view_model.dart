import 'package:flutter/material.dart';
import 'package:todo_app/src/core/services/local/local_caching.dart';
import 'package:todo_app/src/core/services/navigation/navigation_service.dart';
import 'package:todo_app/src/pages/home/model/tag_model.dart';
import 'package:todo_app/src/pages/home/model/todo_model.dart';
import '../../../core/base/viewModel/base_view_model.dart';
import '../../../core/mixins/show_bar.dart';

class HomeViewModel extends ChangeNotifier with BaseViewModel, ShowBar {
  HomeViewModel() {
    _todos = LocalCaching.instance.getTodos();
    _allTags = LocalCaching.instance.getTags();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController tagController = TextEditingController();

  List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;

  set todos(List<TodoModel> value) {
    _todos = value;
    notifyListeners();
  }

  bool _showTags = false;

  bool get showTags => _showTags;

  set showTags(bool value) {
    _showTags = value;
    notifyListeners();
  }

  void addTodoModel(BuildContext context) {
    if (titleController.text.isEmpty) {
      showErrorBar('Title cannot be empty', context: context);
      return;
    }
    TodoModel todoModel = TodoModel(
      id: _generateRandomId(),
      title: titleController.text,
      createdDate: DateTime.now(),
      isCompleted: false,
      tag: _currentTag,
      progress: 0,
    );

    _todos.add(todoModel);
    _currentTag = null;
    clearController();
    notifyListeners();
    NavigationService.instance.pop();
    LocalCaching.instance.addTodoModel(todoModel);
    showSuccessBar("Task added successfully");
  }

  void clearController() {
    titleController.clear();
    tagController.clear();
  }

  void removeTask(TodoModel todoModel) {
    _todos.remove(todoModel);
    notifyListeners();
    LocalCaching.instance.removeTask(todoModel);
  }

  String _generateRandomId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  TagModel? _currentTag;

  TagModel? get currentTag => _currentTag;

  void addOrRemoveTag(TagModel tag) {
    if (tagController.text.contains(tag.name)) {
      tagController.clear();
      _currentTag = null;
    } else {
      tagController.text = tag.name;
      _currentTag = tag;
    }
    notifyListeners();
  }

  void addColorToTag(Color color) {
    if (_currentTag == null) {
      _currentTag = TagModel(name: tagController.text, color: color.value);
    } else {
      _currentTag = _currentTag?.copyWith(color: color);
    }
    notifyListeners();
  }

  bool isSelectedColor(Color color) {
    return _currentTag?.color == color.value;
  }

  List<TagModel> _allTags = [];

  List<TagModel> get allTags => _allTags;

  void saveTagModel() {
    _currentTag = TagModel(
      name: tagController.text,
      color: Color(_currentTag?.color ?? Colors.primaries.first.value).value,
    );

    NavigationService.instance.pop();
    if (_allTags.map((e) => e.name).contains(_currentTag?.name)) {
      return;
    }
    LocalCaching.instance.addTagModel(_currentTag!);
    _allTags.insert(0, _currentTag!);

    notifyListeners();
  }

  void clearTag() {
    tagController.clear();
    _currentTag = null;
  }

  void updateTask(TodoModel todo) {
    _todos[_todos.indexWhere((element) => element.id == todo.id)] = todo;
    LocalCaching.instance.updateTask(todo);
    notifyListeners();
  }
}
