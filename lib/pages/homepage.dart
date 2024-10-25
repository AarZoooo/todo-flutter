import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/data/database.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  // --- Hive storage container ---

  final _mybox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();


  // --- Setup data ---

  @override
  void initState() {
    if (_mybox.get('TODOLIST') == null) {
      db.createInitialData();

    } else {
      db.loadData();
    }

    super.initState();
  }


  // --- Text Controller ---

  final _controller = TextEditingController();


  // --- Checkbox tapped function ---

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }


  // --- Create new task ---

  void createNewTask() {
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          textController: _controller,
          onSave: saveNewTask,
          onCancel: () { Navigator.of(context).pop(); _controller.clear();},
        );
      }
    );
  }


  // --- Save new task ---

  void saveNewTask() {
    setState(() {
      db.toDoList.add([ _controller.text, false ]);
      _controller.clear();
    });

    Navigator.of(context).pop();
    db.updateData();
  }


  // --- Delete a task ---

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color.fromARGB(255, 228, 238, 241),

      appBar: AppBar(
        title: const Text(
          'To Do',
          style: TextStyle(
            fontWeight: FontWeight.w500
          ),
        ),

        backgroundColor: const Color.fromARGB(255, 130, 211, 236),
        elevation: 0,
      ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged:(value) => checkboxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:() {
          createNewTask();
        },

        backgroundColor: const Color.fromARGB(255, 130, 211, 236),

        child: const Icon(Icons.add),
      ),

    );
  }
}