import '../Model/Post_model.dart';
import '../service/PostRepository.dart';

class PostViewModel {
  final PostRepository repository;

  PostViewModel(this.repository);

  Future<List<Post>> fetchPosts() async {
    try {
      return await repository.fetchPosts();
    } catch (e) {
      // Handle error or show error message
      rethrow;
    }
  }
}
