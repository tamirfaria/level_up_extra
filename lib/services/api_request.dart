import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:level_up_extra/model/posts_model.dart';

class ApiRequest {
  Future fetchData(posts) async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body) as List;
      posts = decodedJson.map((post) => PostsModel.fromJson(post)).toList();
      return posts;
    }
  }
}
