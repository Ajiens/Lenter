import 'package:flutter/material.dart';

import '../models/book.dart';

class TrialSearch extends StatelessWidget {
  List<Book> bookList = [];

  TrialSearch({Key? key,
  required this.bookList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Masuk kehalaman search");
    print(bookList[0]);
    return Container();
  }
}