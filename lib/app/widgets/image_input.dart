import 'dart:io';

import 'package:flutter/material.dart';

class ImageIput extends StatefulWidget {
  const ImageIput({super.key});

  @override
  State<ImageIput> createState() => _ImageIputState();
}

class _ImageIputState extends State<ImageIput> {
  File? _storeImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: _storeImage == null
              ? const Text(
                  "No Image Taken",
                  textAlign: TextAlign.center,
                )
              : Image.file(
                  _storeImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.camera),
            label: const Text('Take Picture'),
            style: TextButton.styleFrom(
              iconColor: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
