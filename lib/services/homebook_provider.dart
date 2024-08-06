import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:read_books_online/models/search_responce_model.dart';

import 'package:http/http.dart' as http;
import 'package:online_book_reading_app/confidential/apikey.dart';
import 'package:online_book_reading_app/core/constants.dart';
import 'package:online_book_reading_app/model/home_books_model/home_books_model.dart';

class HomeBookProvider extends ChangeNotifier {
  List<String> catgList = ["fiction", "nonfiction", "science", "history"];
  int categoryIndex = 0;

  void refreshHome(int index) {
    fetchBooks(catgList[index]);
    log(fetchBooks(catgList[index]).toString());
    log(catgList[index]);
    notifyListeners();
  }

  HomeBooksModel? _homeBooks;
  HomeBooksModel? get homeBooks => _homeBooks;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _error = '';
  String get error => _error;
  Future<void> fetchBooks(category) async {
    _isLoading = true;
    _error = "";
    try {
      final searchUrl =
          "$baseUrl/volumes?q=e+subject:$category&orderBy=newest&key=$apiKey";
      log(searchUrl);
      final responce = await http.get(Uri.parse(searchUrl));

      if (responce.statusCode == 200 || responce.statusCode == 201) {
        _homeBooks = HomeBooksModel.fromJson(jsonDecode(responce.body));
        log(_homeBooks.toString());
        notifyListeners();
      } else {
        _error = "Server side Error...!";
      }
    } catch (e) {
      log(e.toString(), name: "client");
      _error = "Client side Error..!";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
