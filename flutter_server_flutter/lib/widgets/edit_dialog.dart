import 'package:flutter/material.dart';

/// Result of an edit dialog
class EditDialogResult {
  final String? name;
  final String? description;

  EditDialogResult({this.name, this.description});
}

/// A reusable dialog for editing name and description fields
class EditDialog extends StatefulWidget {
  final String title;
  final String? initialName;
  final String? initialDescription;
  final String nameLabel;
  final String descriptionLabel;

  const EditDialog({
    super.key,
    required this.title,
    this.initialName,
    this.initialDescription,
    this.nameLabel = 'Name',
    this.descriptionLabel = 'Description',
  });

  @override
  State<EditDialog> createState() => _EditDialogState();

  /// Shows the edit dialog and returns the result
  static Future<EditDialogResult?> show({
    required BuildContext context,
    required String title,
    String? initialName,
    String? initialDescription,
    String nameLabel = 'Name',
    String descriptionLabel = 'Description',
  }) {
    return showDialog<EditDialogResult>(
      context: context,
      builder: (context) => EditDialog(
        title: title,
        initialName: initialName,
        initialDescription: initialDescription,
        nameLabel: nameLabel,
        descriptionLabel: descriptionLabel,
      ),
    );
  }
}

class _EditDialogState extends State<EditDialog> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName ?? '');
    _descriptionController =
        TextEditingController(text: widget.initialDescription ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final description = _descriptionController.text.trim();

      Navigator.of(context).pop(
        EditDialogResult(
          name: name.isEmpty ? null : name,
          description: description.isEmpty ? null : description,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: widget.nameLabel,
                hintText: 'Enter ${widget.nameLabel.toLowerCase()}',
                border: const OutlineInputBorder(),
              ),
              autofocus: true,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: widget.descriptionLabel,
                hintText: 'Enter ${widget.descriptionLabel.toLowerCase()}',
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _save,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
