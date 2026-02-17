import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/notes_provider.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Note')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: titleController),
            TextField(controller: descController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await context.read<NotesProvider>().addNote(
                      titleController.text,
                      descController.text,
                    );
                Navigator.pop(context);
              },
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
