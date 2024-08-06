import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:online_book_reading_app/confidential/apikey.dart';
import 'package:online_book_reading_app/core/constants.dart';
import 'package:online_book_reading_app/model/search_books_model/searching_books_model.dart';

class SearchProvider extends ChangeNotifier {
  void SearchAccess(String searchvalue) {
    fetchSearchBooks(searchvalue);
    notifyListeners();
  }

  String searchString = '';
  SearchingBooksModel? _searchingBooks;
  SearchingBooksModel? get searchingBooks => _searchingBooks;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _error = '';
  String get error => _error;
  Future<void> fetchSearchBooks(searchQuery) async {
    _isLoading = true;
    _error = "";
    try {
      final searchUrl = "$baseUrl/volumes?q=$searchQuery:keyes&key=$apiKey";

      final responce = await http.get(Uri.parse(searchUrl));

      if (responce.statusCode == 200 || responce.statusCode == 201) {
        _searchingBooks =
            SearchingBooksModel.fromJson(jsonDecode(responce.body));

        notifyListeners();
      } else {
        _error = "Server  Error...!!!";
      }
    } catch (e) {
      _error = "Client  Error..!!!";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
