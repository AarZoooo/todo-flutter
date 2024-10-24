import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TodoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20
      ),

      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ]
        ),

        child: Container(
          padding: const EdgeInsets.all(10),
        
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
        
                activeColor: const Color.fromARGB(255, 130, 211, 236),
              ),
        
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}