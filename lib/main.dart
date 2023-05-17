import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_mvvm_pattern/service/PostRepository.dart';
import 'package:flutter_mvvm_pattern/controller/PostViewModel.dart';
import 'Model/Post_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PostViewModel postViewModel = PostViewModel(PostRepository(Dio()));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: MyWidget(postViewModel: postViewModel),
    );
  }
}

class MyWidget extends StatefulWidget {
  final PostViewModel postViewModel;

  MyWidget({required this.postViewModel});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final fetchedPosts = await widget.postViewModel.fetchPosts();
      setState(() {
        posts = fetchedPosts;
      });
    } catch (e) {
      // Handle error or show error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MVVM'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
            child: ListTile(
              title: Text(post.title),
              subtitle: Text(post.body),
            ),
          );
        },
      ),
    );
  }
}
