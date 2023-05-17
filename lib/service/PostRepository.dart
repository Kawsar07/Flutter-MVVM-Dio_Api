import 'package:dio/dio.dart';

import '../Model/Post_model.dart';

class PostRepository {
  final Dio dio;

  PostRepository(this.dio);

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/posts');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        return responseData.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch posts');
      }
    } catch (e) {
      throw Exception('Failed to fetch posts: $e');
    }
  }
}
