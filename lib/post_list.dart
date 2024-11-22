import 'package:final_project/new_post.dart';
import 'package:flutter/material.dart';

import 'auth_screen.dart';

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
      body: ListView(),
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
