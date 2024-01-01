import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenter/models/book.dart';

class BookCard extends StatelessWidget {
  Book bookData;

  BookCard({Key? key,
  required this.bookData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.red,
      child: SizedBox(
        height: 190,
        width: 90,
          child: Column(
            children: [
              Container(
                color: Colors.amber,
                height: 132,
                width: 90,

              )
            ]
          ),
      )
    );
  }
}