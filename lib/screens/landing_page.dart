import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenter/widgets/button.dart';
import 'package:lenter/widgets/const.dart';
import 'package:flutter/rendering.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Widget> cards =[];
  late final PageController pageController;
  int pageNo = 0;

  Timer? carasouelTimer;

  Timer getTimer(){
    return Timer.periodic(const Duration(seconds: 3), (timer) { 
      if (pageNo == 3){
        pageNo = 0;
      }
      pageController.animateToPage(pageNo, 
        duration: const Duration(seconds: 1), 
        curve: Curves.easeInOutCirc
      );
      pageNo++;
    });
  }

  @override
  initState(){
    pageController = PageController(initialPage: 0, viewportFraction: 1);
    carasouelTimer = getTimer();
    super.initState();
    initCard();
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }

  static fungsi(BuildContext context){
    print("here");
    print(context);
    // ScaffoldMessenger.of(context)
    //   .showSnackBar(const SnackBar(
    //   content: Text("Ulasan Anda berhasil disimpan!"),
    // ));
  }

  List<Widget> initCard(){
    cards = [
      LayoutBuilder(
        builder: (context, constraints) {
          // Gunakan constraints untuk membuat widget yang responsif
          double _width = constraints.maxWidth;
          double _height = constraints.maxHeight;
          return Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      height: _height-50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: Constant.gradientColor
                      ),
                    ),
                    Container(
                      height: _height,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                            child: Center(child: Image.asset(scale: 2.4,'assets/headphone.png')),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              // color: Colors.amber,
                              height: _height/2-30,
                              width: _width,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(30, 0, 25, 0),
                                child: Container(
                                  // color: Colors.blue,
                                  child: 
                                Column(
                                  children: [
                                    Text(
                                      "Anywhere,\n Anytime.",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.poppins(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                    ),
                                    SizedBox(height: 18,),
                                    Text(
                                      "You can read a book anywhere anytime with your favorite music",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                )
                                
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          );
        },
      ),
      LayoutBuilder(
        builder: (context, constraints) {
          // Gunakan constraints untuk membuat widget yang responsif
          double _width = constraints.maxWidth;
          double _height = constraints.maxHeight;

          return  Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      height: _height -50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient:const LinearGradient(
                            colors: [Color(0xFFE0BA5A), Color(0xFFDA7E11)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          )
                      ),
                    ),
                    Container(
                      height: _height,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                            child: Center(child: Image.asset('assets/laptop.png')),
                          ),
                          Container(

                              height: _height/2-34,
                              width: _width,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                child: Column(
                                  children: [
                                    Text(
                                      "“Think before you speak. Read before you think.” ",
                                      textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                          fontSize: 28,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      "• Fran Lebowitz",
                                      textAlign: TextAlign.right,
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          );
        },
      ),
      LayoutBuilder(
      builder: (context, constraints) {
        // Gunakan constraints untuk membuat widget yang responsif
        double _width = constraints.maxWidth;
        double _height = constraints.maxHeight;

        return Padding(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    height: _height-50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: Constant.gradientColor
                    ),
                  ),
                  Container(
                    height: _height,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          child: Center(child: Image.asset('assets/businessman.png')),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height:_height/2-30,
                            width: _width,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30, 0, 25, 0),
                              child: Column(
                                children: [
                                  Text(
                                    "“The more that you read, the more things you will know. The more that you learn, the more places you’ll go.“ ",
                                    textAlign: TextAlign.left,
                                      style: GoogleFonts.poppins(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                  ),
                                  SizedBox(height: 8,),
                                  Text(
                                    "• Dr Seuss",
                                    textAlign: TextAlign.left,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        );
      },
    ),
    ];
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Container(
      color: Constant.blackPrimary,
      child: Column(
        children: [
          SizedBox(height: 40),
          Container(
            child: Image.asset(scale: 2,'assets/logo.png'),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: media.size.height/2+30,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index){
                pageNo = index;
                setState(() { });
              },
              itemBuilder: (_, index){
                Widget cardContain;

                if (index == 0){
                  cardContain = initCard()[0];
                } else if (index == 1){
                  cardContain = initCard()[1];
                } else if (index == 2){
                  cardContain = initCard()[2];
                } else{
                  cardContain = initCard()[0];
                }

                return AnimatedBuilder(
                  animation: pageController,
                  builder: (ctx, child){
                    return child!;
                  },
                  child: GestureDetector(
                    onPanDown: (d) {
                      carasouelTimer?.cancel();
                      carasouelTimer = null;
                    },
                    onPanCancel: () {
                      carasouelTimer = getTimer();
                    },
                    child: cardContain
                  ),
                );
              },
            itemCount: 3,
            ),
          ),
          SizedBox(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => GestureDetector(
                onTap: () {
                  pageNo = index;
                  setState(() { });
                },
                child: Container(
                  margin: const EdgeInsets.all(7.0),
                  child: pageNo == index
                  ? SizedBox(
                    width: 56.0,
                    height: 5.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(36.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: Constant.gradientColor,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, offset: Offset(3.0, 6.0), blurRadius: 10.0),
                          ],
                        ),
                      ),
                    ),
                  )
                  : SizedBox(
                      width: 26.0,
                      height: 5.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(36.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, offset: Offset(3.0, 6.0), blurRadius: 10.0),
                            ],
                          ),
                        ),
                      ),
                  )
                )
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),  // Adjust the vertical spacing
            child: PrimaryButtonActive(
              width: media.size.width/2,  // Adjust width based on your layout
              height: 40,  // Adjust height based on your layout
              isText: true,
              isIcon: false,
              text: "Login",
              tapFunction: () => fungsi(context),
            ),
          ),
          SecondaryButtonActive(
              width: media.size.width/2,  // Adjust width based on your layout
              height: 40,  // Adjust height based on your layout
              isText: true,
              isIcon: false,
              text: "Register",
              tapFunction: () => fungsi(context),
            ),
        ]
      )
    );
  }
}