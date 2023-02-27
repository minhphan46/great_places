import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/app/widgets/image_input.dart';
import 'package:great_places/app/widgets/location_input.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:provider/provider.dart';

class AddPlayScreen extends StatefulWidget {
  const AddPlayScreen({super.key});

  @override
  State<AddPlayScreen> createState() => _AddPlayScreenState();
}

class _AddPlayScreenState extends State<AddPlayScreen> {
  final _titleController = TextEditingController();
  File? _pickerImage;

  void _seleteImage(File pickerImage) {
    _pickerImage = pickerImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickerImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickerImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    SizedBox(height: 10),
                    ImageInput(_seleteImage),
                    SizedBox(height: 10),
                    LocationInput(),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _savePlace,
            icon: Icon(Icons.add),
            label: Text('Add Place'),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
          )
        ],
      ),
    );
  }
}
