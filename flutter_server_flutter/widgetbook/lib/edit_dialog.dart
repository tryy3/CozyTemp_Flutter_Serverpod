import 'package:flutter/material.dart';
import 'package:flutter_server_flutter/widgets/edit_dialog.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Helper widget to trigger the dialog
class DialogTrigger extends StatelessWidget {
  final String title;
  final String? initialName;
  final String? initialDescription;
  final String nameLabel;
  final String descriptionLabel;

  const DialogTrigger({
    super.key,
    required this.title,
    this.initialName,
    this.initialDescription,
    this.nameLabel = 'Name',
    this.descriptionLabel = 'Description',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Click the button to open the dialog',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () async {
                final result = await EditDialog.show(
                  context: context,
                  title: title,
                  initialName: initialName,
                  initialDescription: initialDescription,
                  nameLabel: nameLabel,
                  descriptionLabel: descriptionLabel,
                );

                if (result != null && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Saved:\nName: ${result.name ?? "(empty)"}\nDescription: ${result.description ?? "(empty)"}',
                      ),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.edit),
              label: const Text('Open Edit Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}

@widgetbook.UseCase(name: 'Edit Node - Empty', type: EditDialog)
Widget editNodeEmptyUseCase(BuildContext context) {
  return const DialogTrigger(
    title: 'Edit Node',
    nameLabel: 'Node Name',
    descriptionLabel: 'Node Description',
  );
}

@widgetbook.UseCase(name: 'Edit Node - With Data', type: EditDialog)
Widget editNodeWithDataUseCase(BuildContext context) {
  return const DialogTrigger(
    title: 'Edit Node',
    initialName: 'Living Room Node',
    initialDescription: 'Monitors temperature in the living room area',
    nameLabel: 'Node Name',
    descriptionLabel: 'Node Description',
  );
}

@widgetbook.UseCase(name: 'Edit Sensor - Empty', type: EditDialog)
Widget editSensorEmptyUseCase(BuildContext context) {
  return const DialogTrigger(
    title: 'Edit Sensor',
    nameLabel: 'Sensor Name',
    descriptionLabel: 'Sensor Description',
  );
}

@widgetbook.UseCase(name: 'Edit Sensor - With Data', type: EditDialog)
Widget editSensorWithDataUseCase(BuildContext context) {
  return const DialogTrigger(
    title: 'Edit Sensor',
    initialName: 'Main Temperature Sensor',
    initialDescription: 'Located near the window, measures ambient temperature',
    nameLabel: 'Sensor Name',
    descriptionLabel: 'Sensor Description',
  );
}

@widgetbook.UseCase(name: 'Long Initial Values', type: EditDialog)
Widget editLongValuesUseCase(BuildContext context) {
  return const DialogTrigger(
    title: 'Edit Item with Long Text',
    initialName:
        'This is a very long name that might need to wrap to multiple lines in the text field',
    initialDescription:
        'This is an extremely long description that demonstrates how the dialog handles large amounts of text. It should wrap properly and be fully editable. The description field supports multiple lines and should display this content correctly.',
    nameLabel: 'Name',
    descriptionLabel: 'Description',
  );
}

@widgetbook.UseCase(name: 'Only Name Filled', type: EditDialog)
Widget editOnlyNameUseCase(BuildContext context) {
  return const DialogTrigger(
    title: 'Edit Item',
    initialName: 'Item Name',
    nameLabel: 'Name',
    descriptionLabel: 'Description',
  );
}

@widgetbook.UseCase(name: 'Only Description Filled', type: EditDialog)
Widget editOnlyDescriptionUseCase(BuildContext context) {
  return const DialogTrigger(
    title: 'Edit Item',
    initialDescription: 'This item has a description but no name',
    nameLabel: 'Name',
    descriptionLabel: 'Description',
  );
}

@widgetbook.UseCase(name: 'Custom Labels', type: EditDialog)
Widget editCustomLabelsUseCase(BuildContext context) {
  return const DialogTrigger(
    title: 'Update Location',
    initialName: 'Main Hall',
    initialDescription: 'Building A, Floor 2',
    nameLabel: 'Location Name',
    descriptionLabel: 'Additional Details',
  );
}
