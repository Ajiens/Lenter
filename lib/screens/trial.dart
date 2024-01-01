import 'package:flutter/material.dart';
import 'package:lenter/screens/trialSearch.dart';
import 'package:lenter/widgets/book_card.dart';
import 'package:lenter/widgets/const.dart';

import '../models/book.dart';
import '../api/book-api.dart';

class Trial extends StatefulWidget {
  const Trial({super.key});

  @override
  State<Trial> createState() => _TrialState();
}

class _TrialState extends State<Trial> {
  late List<Book> _bookList = [];
  var searchState;

  void updateSearchQuery(String value){
    String searchTerm = value.trim().toLowerCase();
    setState(() {
      if(searchState != ""){
        searchState = searchTerm;
      }
      else{
        searchState = null;
      }
    });
  }

  void futureBook(){
    FetchBook.fetchBook().then((List<Book> fetchedBooks) {
      setState(() {
        _bookList = fetchedBooks;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    futureBook();
  }

  @override
  Widget build(BuildContext context) {
    // _bookList.fetchBook();
    return
          FutureBuilder<List<Book>>(
            future: Future.value(_bookList),
            builder: (context, snapshot){
              // print("dimana");
              if (snapshot.data == null){
                // print(snapshot.data);
                return const Center(child: CircularProgressIndicator());
              } 
              else if (snapshot.hasError) {
                // print("A");
                return Center(child: Text('Error: ${snapshot.error}'));
              } 
              else if (!snapshot.hasData || snapshot.data!.length == 0) {
                // print(snapshot.data);
                // print(_bookList.getBookList());
                return const Column(
                  children: [
                    Text(
                      "Book is empty.",
                      style: TextStyle(
                          color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(height: 1000),
                  ],
                );
              }
              else{
                print("aowkdaoa");
                print(_bookList[498].fields.author);
                return GridView.builder(
                  padding: EdgeInsets.all(16), // Increased padding around the GridView
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Book book = snapshot.data![index];
                    return BookCard(bookData: book);
                  }
                );
              }
            },
          );
  }
}