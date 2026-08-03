import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:navigation_flutter/api_practice/models/post.dart';

Future<List<Post>> fetchPosts() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  );
  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Post.fromJson(json)).toList();
  } else {
    throw Exception('failed to load posts');
  }
}
