import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';
import '../models/place.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:5000';

  // 포스트 가져오기
  static Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((post) => Post.fromJson(post)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      print('Error fetching posts: $e');
      return [];
    }
  }

  // 오늘의 놀거리 가져오기
  static Future<List<Place>> fetchTodayPlaces() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/today'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((place) => Place.fromJson(place)).toList();
      } else {
        throw Exception('Failed to load today places');
      }
    } catch (e) {
      print('Error fetching today places: $e');
      return [];
    }
  }

  // MBTI 기반 추천 장소 가져오기
  static Future<List<Place>> fetchMbtiPlaces(String mbti) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/mbti?type=$mbti'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((place) => Place.fromJson(place)).toList();
      } else {
        throw Exception('Failed to load mbti places');
      }
    } catch (e) {
      print('Error fetching mbti places: $e');
      return [];
    }
  }

  // 코스 상세 장소 가져오기
  static Future<List<Place>> fetchCourseDetail(String courseId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/course/$courseId'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((place) => Place.fromJson(place)).toList();
      } else {
        throw Exception('Failed to load course detail');
      }
    } catch (e) {
      print('Error fetching course detail: $e');
      return [];
    }
  }

  static Future<List<Map<String, dynamic>>> fetchCourseList() async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/courses'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load courses');
    }
  } catch (e) {
    print('Error fetching courses: $e');
    return [];
    }
  }
}