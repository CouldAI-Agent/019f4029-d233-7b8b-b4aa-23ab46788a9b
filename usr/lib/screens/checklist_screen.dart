import 'package:flutter/material.dart';
import '../models/checklist.dart';

class ChecklistScreen extends StatefulWidget {
  final Checklist checklist;

  const ChecklistScreen({super.key, required this.checklist});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.checklist.title),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Прогресс',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: widget.checklist.progress,
                          minHeight: 8,
                          borderRadius: BorderRadius.circular(4),
                          backgroundColor: Colors.grey[300],
                          color: widget.checklist.progress == 1.0 ? Colors.green : Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '${(widget.checklist.progress * 100).toInt()}%',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: widget.checklist.progress == 1.0 ? Colors.green : null,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.checklist.items.length,
                itemBuilder: (context, index) {
                  final item = widget.checklist.items[index];
                  return CheckboxListTile(
                    title: Text(
                      item.title,
                      style: TextStyle(
                        decoration: item.isCompleted ? TextDecoration.lineThrough : null,
                        color: item.isCompleted ? Colors.grey : null,
                      ),
                    ),
                    value: item.isCompleted,
                    onChanged: (bool? value) {
                      setState(() {
                        item.isCompleted = value ?? false;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
