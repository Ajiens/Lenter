import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenter/models/book.dart';
import 'package:lenter/widgets/book_card.dart';
import 'package:lenter/widgets/const.dart';

class ForYou extends StatelessWidget {
  List<Book> bookList;

  ForYou({Key? key,
  required this.bookList,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> adsList = [
      Container(color: Colors.blueGrey,),
      Container(color: Colors.amber,),
      Container(color: Colors.indigo,)
      
    ];
    PageController _pageController = PageController(viewportFraction: 1);

    
    return LayoutBuilder(
      builder: (context, constraints) {
        // Gunakan constraints untuk membuat widget yang responsif
        double _width = constraints.maxWidth;
        double _height = constraints.maxHeight;
        // print(_width);
        return ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: 12,),
            Container(
              height: 105,
              
              child: 
            
            PageView.builder(
              itemCount: adsList.length,
              pageSnapping: true,
              controller: _pageController,
              itemBuilder: (context, pagePosition) {
                return Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child:adsList[pagePosition],
                );
              }
            )
            ),
            BestSection(
              bookList: bookList, 
              header: "Best Drama 2022", 
              filterArgument: "Drama"
            ),
            BestSection(
              bookList: bookList, 
              header: "Most Horror This Week", 
              filterArgument: "Horror"
            ),
            BestSection(
              bookList: bookList, 
              header: "The best Mystery in this years", 
              filterArgument: "Mystery"
            ),
            BestSection(
              bookList: bookList, 
              header: "The best Biography in this years", 
              filterArgument: "Biography"
            ),
          ]
        );
        
      }
    );
  }
}

class BestSection extends StatelessWidget {
  List<Book> bookList;
  String header;
  String filterArgument;

  BestSection({Key? key,
    required this.bookList,
    required this.header,
    required this.filterArgument,}) : super(key: key);

  Future<List<Book>> filterBooks(List<Book> books, String searchTerm) async{
    List<Book> filteredBooks = [];
    int maxNumber=0;
    // print(searchTerm);
    for (var book in books) {
      List<String> genres = book.fields.genre.split(',').map((genre) => genre.trim()).toList();
      if (genres[0].contains(searchTerm)) {
        filteredBooks.add(book);
        maxNumber++;
      }
      if (maxNumber == 10){
        return filteredBooks;
      }
    }
    // print(filteredBooks);
    return filteredBooks;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5,),
        Container(
          margin: EdgeInsets.only(right: 24, left: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${header}",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward, color: Colors.white,))
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 5,),
        Stack(
          children: [
            Container(
              height: 190,
              // color: Colors.teal,
            ),
            FutureBuilder<List<Book>>(
              future: filterBooks(bookList, "${filterArgument}"),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // print("Kesini juga?");
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Container(
                    margin: EdgeInsets.only(left: 20),
                    color: Constant.blackPrimary,
                    height: 190,
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10), 
                          child: BookCard(bookData: snapshot.data![index])
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        )
      ],
    );
  }
}