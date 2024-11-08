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
          extentRatio: 0.2,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              foregroundColor: Colors.red.shade300,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ]
        ),

        child: Container(
          padding: const EdgeInsets.all(10),

          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withAlpha(20),
                spreadRadius: 2,                     // How far the shadow spreads
                blurRadius: 6,                      // Softness of the shadow
                offset: const Offset(3, 3),                // Shadow position (x, y)
              )
            ]
          ),
        
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
        
                activeColor: Theme.of(context).primaryColor,
              ),
        
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,

                  color: taskCompleted
                    ? Theme.of(context).disabledColor
                    : Theme.of(context).textTheme.bodySmall?.color,

                  decorationColor: Theme.of(context).disabledColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}