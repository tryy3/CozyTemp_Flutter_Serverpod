import 'package:flutter/material.dart';
import 'package:flutter_server_flutter/widgets/edit_dialog.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: EditDialog)
Widget buildEditDialogUseCase(BuildContext context) {
  final title = context.knobs.string(label: 'title', initialValue: 'Edit Item');

  final nameLabel = context.knobs.string(
    label: 'nameLabel',
    initialValue: 'Name',
  );

  final descriptionLabel = context.knobs.string(
    label: 'descriptionLabel',
    initialValue: 'Description',
  );

  final initialName = context.knobs.stringOrNull(
    label: 'initialName',
    initialValue: null,
  );

  final initialDescription = context.knobs.stringOrNull(
    label: 'initialDescription',
    initialValue: null,
  );

  return Center(
    child: Material(
      child: EditDialog(
        title: title,
        nameLabel: nameLabel,
        descriptionLabel: descriptionLabel,
        initialName: initialName,
        initialDescription: initialDescription,
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'edit node empty', type: EditDialog)
Widget buildEditDialogNodeEmptyUseCase(BuildContext context) {
  return const Center(
    child: Material(
      child: EditDialog(
        title: 'Edit Node',
        nameLabel: 'Node Name',
        descriptionLabel: 'Node Description',
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'edit node with data', type: EditDialog)
Widget buildEditDialogNodeWithDataUseCase(BuildContext context) {
  return const Center(
    child: Material(
      child: EditDialog(
        title: 'Edit Node',
        initialName: 'Living Room Node',
        initialDescription: 'Monitors temperature in the living room area',
        nameLabel: 'Node Name',
        descriptionLabel: 'Node Description',
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'edit sensor empty', type: EditDialog)
Widget buildEditDialogSensorEmptyUseCase(BuildContext context) {
  return const Center(
    child: Material(
      child: EditDialog(
        title: 'Edit Sensor',
        nameLabel: 'Sensor Name',
        descriptionLabel: 'Sensor Description',
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'edit sensor with data', type: EditDialog)
Widget buildEditDialogSensorWithDataUseCase(BuildContext context) {
  return const Center(
    child: Material(
      child: EditDialog(
        title: 'Edit Sensor',
        initialName: 'Main Temperature Sensor',
        initialDescription:
            'Located near the window, measures ambient temperature',
        nameLabel: 'Sensor Name',
        descriptionLabel: 'Sensor Description',
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'long values', type: EditDialog)
Widget buildEditDialogLongValuesUseCase(BuildContext context) {
  return const Center(
    child: Material(
      child: EditDialog(
        title: 'Edit Item with Long Text',
        initialName:
            'This is a very long name that might need to wrap to multiple lines in the text field',
        initialDescription:
            'This is an extremely long description that demonstrates how the dialog handles large amounts of text. It should wrap properly and be fully editable. The description field supports multiple lines and should display this content correctly.',
        nameLabel: 'Name',
        descriptionLabel: 'Description',
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'only name filled', type: EditDialog)
Widget buildEditDialogOnlyNameUseCase(BuildContext context) {
  return const Center(
    child: Material(
      child: EditDialog(
        title: 'Edit Item',
        initialName: 'Item Name',
        nameLabel: 'Name',
        descriptionLabel: 'Description',
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'only description filled', type: EditDialog)
Widget buildEditDialogOnlyDescriptionUseCase(BuildContext context) {
  return const Center(
    child: Material(
      child: EditDialog(
        title: 'Edit Item',
        initialDescription: 'This item has a description but no name',
        nameLabel: 'Name',
        descriptionLabel: 'Description',
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'custom labels', type: EditDialog)
Widget buildEditDialogCustomLabelsUseCase(BuildContext context) {
  return const Center(
    child: Material(
      child: EditDialog(
        title: 'Update Location',
        initialName: 'Main Hall',
        initialDescription: 'Building A, Floor 2',
        nameLabel: 'Location Name',
        descriptionLabel: 'Additional Details',
      ),
    ),
  );
}
