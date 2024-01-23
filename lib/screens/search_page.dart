import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenter/screens/forYou_page.dart';
import 'package:lenter/screens/genre_page.dart';
import 'package:lenter/widgets/const.dart';

import '../models/book.dart';
import '../api/book-api.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<Widget> pageViewList;
  late List<Book> _bookList = [];
  
  bool _isLoading = true;

  int current = 0;
  late PageController _pageController;
  List<String> genres = ['For You','Mystery', 'Horror', 'Historical', 'Thriller', 'Fiction', 'Drama', 'Classic', 'Biography'];

  void futureBook(){
    FetchBook.fetchBook().then((List<Book> fetchedBooks) {
      setState(() {
        _bookList = fetchedBooks;
        // After _booklist fully generated, then call this method. How if i have a tons of data?
        //This one is not best practice but now i dont know lol. But the logic still works HAHAHA
        generatePageViewlist();
        _isLoading = false;
      });
    });
  }

  void generatePageViewlist(){
    pageViewList = [
      ForYou(bookList: _bookList),
      GenrePage(bookList: _bookList, filterArgument: "Mystery"),
      GenrePage(bookList: _bookList, filterArgument: "Horror"),
      GenrePage(bookList: _bookList, filterArgument: "Historical"),
      GenrePage(bookList: _bookList, filterArgument: "Thriller"),
      GenrePage(bookList: _bookList, filterArgument: "Fiction"),
      GenrePage(bookList: _bookList, filterArgument: "Drama"),
      GenrePage(bookList: _bookList, filterArgument: "Classic"),
      GenrePage(bookList: _bookList, filterArgument: "Biography"),
    ];
  }

  @override
  void initState(){
    _pageController = PageController();
    futureBook();
    super.initState();
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Constant.blackPrimary,

      appBar: AppBar(
        backgroundColor: Constant.blackPrimary,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            print("Masuk ke halaman search");
          },
          child: Container(
            margin: EdgeInsets.only(top: 14, bottom: 14),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Constant.blackSecondary,
              borderRadius: BorderRadius.all(Radius.circular(26))
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(15, 8, 15,8),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.search, color: Colors.white,),
                        SizedBox(width: 10,),
                        Text("Search Books",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Color.fromRGBO(255, 255, 255, 0.4),
                            fontWeight: FontWeight.w300,
                          )
                        ),
                      ],
                    ),
                    Icon(Icons.mic, color: Colors.white,), 
                  ]
                ),
              )
            ),
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
      
      body: _isLoading
      ? Center(
          child: CircularProgressIndicator(), // Tampilkan indikator loading jika sedang loading
        )
      :Container(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(right: 15, left: 15),
                // color: Colors.amber,
                height: 34,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: genres.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageController.jumpToPage(index);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: 70,
                        child: Center(
                          child: Stack(
                            children:[ 
                              Column(
                              children: [
                                Text(genres[index], style: TextStyle(color: Colors.white),),
                                SizedBox(height: 9,),
                                if (index == current)
                                  Container(
                                    height: 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: Constant.gradientColor
                                    ),
                                  )
                                ],
                              ),
                              if (index == current)
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    // borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(
                                      colors: [Color.fromRGBO(168, 17, 218, 0.5), Color.fromRGBO(255, 255, 255, 0)],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,)
                                  ),
                                )
                            ]
                          )
                        )
                      )
                    );
                  }
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index){
                    setState(() {
                      current = index;
                    });
                  },
                  children: pageViewList
                )
              )
            ],
          ),
        )
      
    );
  }
}