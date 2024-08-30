import 'package:flutter/material.dart';
import '../database/notesModel.dart';

class EditNotesScreen extends StatefulWidget {
  final NotesModel notes;

  const EditNotesScreen({super.key, required this.notes});

  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {
  late TextEditingController titleController;
  late TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing note data
    titleController = TextEditingController(text: widget.notes.title);
    messageController = TextEditingController(text: widget.notes.description);
  }

  @override
  void dispose() {
    // Dispose controllers to free up resources
    titleController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update Notes",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              minLines: 1,
              maxLines: 2,
              autofocus: true,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                hintText: "Write Title",
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TextField(
                controller: messageController,
                minLines: 1,
                maxLines: 10,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Write Notes",
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close screen on cancel
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(width: 2, color: Colors.red),
                    ),
                  ),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add logic to update the note here
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Colors.greenAccent,
                  ),
                  child: const Text("Update"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}