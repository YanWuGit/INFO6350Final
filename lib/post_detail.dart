import 'dart:io';

import 'package:flutter/material.dart';


class PostDetail extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final String imagePath;

  const PostDetail({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.imagePath,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Detail'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Title: $title',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'Price: \$$price',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              if (imagePath.isNotEmpty)
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              else
                const Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: 150,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
