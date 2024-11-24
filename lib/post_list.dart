import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/new_post.dart';
import 'package:final_project/post_detail.dart';
import 'package:flutter/material.dart';

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sale Posts'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('sale_posts').orderBy('timestamp', descending: true).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('An error has occurred'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No posts available'));
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;

              return ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: Text(data['title'] ?? 'No Title'),
                subtitle: Text(data['description'] ?? 'No Description'),
                trailing: Text(data['price'] != null ? "\$${data['price']}" : 'No Price'),
                // Assuming you want to display the image
                leading: data['imagePath'] != null
                    ? Image.file(File(data['imagePath']), width: 50, fit: BoxFit.cover)
                    : const Icon(Icons.image_not_supported),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostDetail(
                        title: data['title'] ?? 'No Title',
                        price: data['price'] ?? 'No Price',
                        description: data['description'] ?? 'No Description',
                        imagePath: data['imagePath'] ?? '',
                      ),
                    ),
                  );                },
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Text('Post'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewPost()),
            );
          }),
    );
  }
}
