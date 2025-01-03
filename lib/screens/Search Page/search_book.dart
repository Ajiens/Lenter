import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenter/widgets/book_card.dart';

import '../../models/book.dart';
import '../../widgets/const.dart';

class SearchBook extends StatefulWidget {
  List<Book> bookList;

  SearchBook({Key? key,
  required this.bookList}) : super(key: key);

  @override
  State<SearchBook> createState() => _SearchBookState();
}
// https://www.kindacode.com/article/how-to-create-a-filter-search-listview-in-flutter/
class _SearchBookState extends State<SearchBook> {
  List<Book> _foundBook = [];

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Book> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = [];
    } else {
      results = widget.bookList
          .where((book) =>
              book.fields.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundBook = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.blackPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), 
          color: Color.fromARGB(125, 255, 255, 255),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Constant.blackPrimary,
        title: Padding(
          padding: EdgeInsets.only(right: 15),
          child: TextField(
            onChanged: (value) => _runFilter(value),

            autofocus: true,
            cursorColor: Colors.white,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Color.fromRGBO(255, 255, 255, 0.8),
              fontWeight: FontWeight.w300,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Constant.blackSecondary,
              hintText: 'Search Book', 
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              hintStyle: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color.fromRGBO(255, 255, 255, 0.4),
                          fontWeight: FontWeight.w300,
                        ),
              suffixIcon: Icon(Icons.mic, color:Color.fromRGBO(255, 255, 255, 0.4),),
              
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(26)), 
                borderSide: BorderSide(color: Colors.transparent)
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(26)), 
                borderSide: BorderSide(color: Colors.transparent)
              )  
            ),
          )
        ),
        actions: [
          GestureDetector(
            onTap: () {
              print("SideBar Menu Pressed");
            },
            child: Container(
              margin: EdgeInsets.only(right: 18),
              width: 38,
              height: 35,
              decoration: BoxDecoration(
                gradient: Constant.gradientColor,
                borderRadius: BorderRadius.circular(14)
              ),
              child: Icon(Icons.format_list_bulleted_rounded, color: Colors.white,),
            )
          )
        ],
      ),
      body: (_foundBook.isNotEmpty)
        ? Padding(
            padding: EdgeInsets.only(right: 20, left: 20, top: 10),
            child:SingleChildScrollView(
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.spaceBetween,
                direction: Axis.horizontal,
                children: [
                  for (var book in _foundBook) BookCard(bookData: book),
                ],
              )
            )
          )
        : Container(
            color: Constant.blackPrimary,
            alignment: Alignment.center,
            child: Text("No result found",
            style:  GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
    );
      
  }
}