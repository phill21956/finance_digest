import 'package:finance_digest/models/news_model.dart';
import 'package:finance_digest/utils/constants.dart';
import 'package:finance_digest/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCalls {
  Future<List<NewsModel>> httpGetProducts() async {
    try {
      final res = await http
          .get(Uri.parse("$baseUrl?category=general&token=$token"))
          .timeout(const Duration(seconds: 60));
      print('stats - ${res.statusCode}:${res.body}');
      if (res.statusCode == 200) {
        final response = newsModelFromJson(res.body);
        return response;
      }
      toast(
          title: 'Attention!!!',
          'Failed to load products: ${res.statusCode}',
          color: Colors.red);
      throw 'Failed to load products: ${res.statusCode}';
    } catch (e) {
      print('error-$e');
      toast(title: 'Attention!!!', '$e', color: Colors.red);
      throw 'Failed to load products';
    }
  }
}
