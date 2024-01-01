import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lenter/models/book.dart';

class FetchBook{
  static Future<List<Book>> fetchBook() async {
    // print("masuk ke sini");
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse(
        'http://localhost:8000/api/books/');
        
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    // print(data);
    List<Book> bookList = [];

    bookList.clear(); // Menghapus elemen-elemen sebelum menambahkan yang baru


    for (var d in data) {
      if (d != null) {
        bookList.add(Book.fromJson(d));
      }
    }
    return bookList;
  }
}