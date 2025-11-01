import 'package:flutter/material.dart';
import 'package:to_do_list/models/todo.dart';

class Animatedtitle extends StatelessWidget {
  final Todo todo;
  const Animatedtitle({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.centerLeft,
          clipBehavior: Clip.none,
          children: [
            // Base text
            Text(
              todo.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color:
                todo.isDone ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.onSurface,
              ),
            ),

            //Animated strikethrough line 
            Positioned(
              top: (Theme.of(context).textTheme.bodyMedium?.fontSize ?? 16) * 0.78,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeOutCubic,
                height: 1.5,
                width: todo.isDone ? constraints.maxWidth : 0,
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            )
          ],
        );
      }
    );
  }
}