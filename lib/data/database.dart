import 'package:hive/hive.dart';

class ToDoDataBase {

  List toDoList = [];

  final _mybox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [
      ["Press the 'Plus' button to add task", false],
      ["Click the checkbox to mark it done", false],
      ["Swipe from Right to Left to delete", false],
    ];
  }

  void loadData() {
    toDoList = _mybox.get('TODOLIST');
  }

  void updateData() {
    _mybox.put('TODOLIST', toDoList);
  }

}