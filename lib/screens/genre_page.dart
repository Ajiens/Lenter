import 'package:flutter/material.dart';
import 'package:lenter/models/book.dart';
import 'package:lenter/widgets/book_card.dart';

class GenrePage extends StatelessWidget {
  List<Book> bookList;
  String filterArgument;

  GenrePage({Key? key,
    required this.bookList,
    required this.filterArgument,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Book> filteredBooks = [];
    // print(searchTerm);
    for (var book in bookList) {
      List<String> genres = book.fields.genre.split(',').map((genre) => genre.trim()).toList();
      if (genres[0].contains(filterArgument)) {
        filteredBooks.add(book);
      }
    }
    print("${filterArgument} == ${filteredBooks.length}");

    return LayoutBuilder(
      builder: (context, constraints) {
        // Gunakan constraints untuk membuat widget yang responsif
        double _width = constraints.maxWidth;
        double _height = constraints.maxHeight;
        
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 22),
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 15,
              runSpacing: 15,
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              direction: Axis.horizontal,
              children: [
                for (var book in filteredBooks)
                  BookCard(bookData: book),
              ],
            ),
          )
        );
      }
    );
  }
}