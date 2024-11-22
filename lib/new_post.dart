import 'dart:io';

import 'package:camera/camera.dart';
import 'package:final_project/utils/camera_utils.dart';
import 'package:flutter/material.dart';
import 'package:final_project/utils/input_field.dart';
import 'package:final_project/post_list.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  XFile? itemPhoto;

  Future<void> _navToTakePicture() async {
    XFile? image = await navToTakePicture(context);
    if (image != null) {
      setState(() {
        itemPhoto = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hyper Garage Sale'),
      ),
      body: ListView(
        children: [
          InputField(
              title: 'Enter title of the item',
              isSecured: false,
              controller: _titleController),
          InputField(
            title: 'Enter price',
            isSecured: false,
            controller: _priceController,
          ),
          InputField(
            title: 'Enter description of the item',
            isSecured: false,
            controller: _descriptionController,
            maxLine: 10,
          ),
          const SizedBox(
            height: 20,
          ),
          if (itemPhoto == null)
            Container(
              padding: const EdgeInsets.all(60),
              child: IconButton(
                onPressed: _navToTakePicture,
                icon: const Icon(
                  Icons.camera_alt,
                  size: 40,
                ),
              ),
            )
          else
            Container(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(itemPhoto!.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Text('Post'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PostList()),
            );
          }),
    );
  }
}
