import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenter/models/book.dart';
import 'package:lenter/widgets/const.dart';

import 'package:expandable_page_view/expandable_page_view.dart';

class BookDescription extends StatefulWidget {
  final Book bookData;
  
  BookDescription({Key? key,
  required this.bookData}) : super(key: key);

  @override
  State<BookDescription> createState() => _BookDescriptionState();
}

class _BookDescriptionState extends State<BookDescription> {
  int current = 0;
  late PageController _pageController;
  bool _showFab = true;

  @override
  void initState(){
    _pageController = PageController();
    super.initState();
    
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final Book book = widget.bookData;
    List<String> genres = book.fields.genre.substring(1, book.fields.genre.length - 1).split("', '");
    const duration = Duration(milliseconds: 300);

    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
      floatingActionButton: AnimatedSlide(
        duration: duration,
        offset: _showFab ? Offset.zero : Offset(0, 2),
        child: AnimatedOpacity(
          duration: duration,
          opacity: _showFab ? 1 : 0,
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      ),

      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          setState(() {
            if (direction == ScrollDirection.reverse) {
              _showFab = false;
            } else if (direction == ScrollDirection.forward) {
              _showFab = true;
            }
          });
          return true;
        },
        child: Container(
          color: Constant.blackPrimary,
          child: ListView(
            children: [
              Container(
                height: 300,
                child: Stack(
                  children: [
                    ShaderMask(
                      shaderCallback: (rectangle) {
                        return LinearGradient(
                          colors: [Colors.white, Colors.transparent],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          tileMode: TileMode.clamp,
                        ).createShader(Rect.fromLTRB(0, 0, rectangle.width, rectangle.height));
                      },
                      child: 
                        ClipRRect(
                          child: Image.network(
                            book.fields.coverLink,
                            scale: 0.5,
                            fit: BoxFit.cover, // Optional: set fit property to cover
                            height: 300, width: media.size.width, 
                          ),
                        )
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppBar(
                          forceMaterialTransparency: true,
                          automaticallyImplyLeading: false,
                          backgroundColor: Constant.blackPrimary,
                          centerTitle: true,
                          
                          leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,), onPressed: () { Navigator.pop(context);},),
                          title: Text("Detail Book",
                            style: GoogleFonts.poppins(
                              shadows: [
                                Shadow(
                                    blurRadius: 2.0,
                                    color: Colors.black,
                                    offset: Offset(2.0, 2.0),
                                    ),
                                ],
                              letterSpacing: 1.2,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          actions: [
                            GestureDetector(
                              onTap: () {
                                print("SideBar Menu Pressed");
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 18),
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(35)
                                ),
                                child: Icon(Icons.more_vert, color: Colors.white,),
                              )
                            )
                          ],
                        ),
                        Container(
                          height: 158,
                          width: 116,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: Image.network(
                              book.fields.coverLink,
                              scale: 0.5,
                              fit: BoxFit.cover, // Optional: set fit property to cover
                              height: 158, width: 116, 
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  // color: Colors.amber,
                  // height: 210,
                  // width: media.size.height-48,
                  child: Column(
                    children: [
                      SizedBox(height: 25,),
                      Text(book.fields.title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("by ${book.fields.author}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.grey[600],
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: 15),
                      Wrap(
                        spacing: 15,
                        runSpacing: 10,
                        direction: Axis.horizontal,
                        // runAlignment: WrapAlignment.center,
                        alignment: WrapAlignment.center,
                        children: List.generate(genres.length, (index) {
                          return Container(
                            height: 30,
                            // margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 121, 120, 120),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                              child: Text("${genres[index].replaceAll(RegExp(r'[^\w\s]'), '')}",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300
                                ),
                              ),
                            )
                          );
                        }),
                      )
                    ],
                  ),
                
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Gunakan constraints untuk membuat widget yang responsif
                    double _width = constraints.maxWidth;
                    double _height = constraints.maxHeight;
                    
                    return Container(
                      height: 75,
                      decoration: BoxDecoration(
                        color: Constant.blackSecondary,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _pageController.jumpToPage(0);
                                _showFab = true;
                              });
                            },
                            child: Container(
                              width: _width/3 - 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: current == 0 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                                children: [
                                  if (current == 0)
                                    Container(
                                      width: _width/3-30,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: Constant.gradientColor
                                      ),
                                    ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:[
                                      Text("ISBN", style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300
                                      ),),
                                      Text("${book.fields.isbn}", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300
                                      ),)
                                    ]
                                  ),
                                  if (current == 0)
                                    Container(
                                      width: _width/3-30,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: Constant.gradientColor
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 2,
                            color: const Color.fromARGB(80, 189, 189, 189),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _pageController.jumpToPage(1);
                                _showFab = true;
                              });
                            },
                            child: Container(
                              width: _width/3 - 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: current == 1 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                                children: [
                                  if (current == 1)
                                    Container(
                                      width: _width/3-30,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: Constant.gradientColor
                                      ),
                                    ),
                                  Column(
                                    children: [ 
                                      Text("Rating", style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300
                                      ),),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("${book.fields.averageRating}", style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300
                                          ),),
                                          Text("/5.0", style: TextStyle(
                                            color: const Color.fromARGB(255, 202, 202, 202),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300
                                          ),)
                                        ],
                                      )
                                    ],
                                  ),
                                  if (current == 1)
                                    Container(
                                      width: _width/3-30,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: Constant.gradientColor
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 2,
                            color: const Color.fromARGB(80, 189, 189, 189),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _pageController.jumpToPage(2);
                                _showFab = true;
                              });
                            },
                            child: Container(
                              width: _width/3 - 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: current == 2 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                                children: [
                                  if (current == 2)
                                    Container(
                                      width: _width/3-30,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: Constant.gradientColor
                                      ),
                                    ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Reviews", style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300
                                      ),),
                                      Text("${book.fields.reviewCount}", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300
                                      ),)
                                    ]
                                  ),
                                  if (current == 2)
                                    Container(
                                      width: _width/3-30,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: Constant.gradientColor
                                      ),
                                    ),
                                ],
                              ),
                            )
                          )
                        ],
                      ),
                    );
                  }
                )
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ExpandablePageView(
                    controller: _pageController,
                    onPageChanged: (index){
                      setState(() {
                        current = index;
                      });
                    },
                    children: [
                      Container(
                        child: Text(book.fields.description,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                          ),
                        )
                    ),
                    Container(
                      child: Text("Rating is empty",
                      textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 202, 202, 202),
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    Container(
                      child: Text("Review is empty",
                      textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 202, 202, 202),
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    )
                  ],
                ),
              )
              
            ],
          ),
        ),
      )
    );
  }
}
