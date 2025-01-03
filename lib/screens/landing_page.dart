import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenter/screens/Search Page/search_page.dart';
import 'package:lenter/screens/main_initial.dart';
import 'package:lenter/widgets/button.dart';
import 'package:lenter/widgets/const.dart';
import 'package:flutter/rendering.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool boolCheckBox = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();
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
                                          fontSize: 22,
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
                              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                              child: Column(
                                children: [
                                  Text(
                                    "“The more that you read, the more things you will know. The more that you learn, the more places you’ll go.“ ",
                                    textAlign: TextAlign.left,
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
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

    return Scaffold(
      body: Container(
        color: Constant.blackPrimary,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 25),
              height: 120,
              child: Image.asset(scale: 2,'assets/logo.png'),
            ),
            SizedBox(
              height: 768/2+30,
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
              padding: EdgeInsets.fromLTRB(100,16,100,0),  // Adjust the vertical spacing
              child: PrimaryButtonActive(
                width: media.size.width/2,  // Adjust width based on your layout
                height: 40,  // Adjust height based on your layout
                isText: true,
                isIcon: false,
                text: "Login",
                tapFunction: () {
                  showModalBottomSheet<void>(
                    // enableDrag: false,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return GestureDetector(
                        // onPanDown: (details){
                        //   Navigator.pop(context);
                        // },
                        child: Container(
                          height: media.size.height/1.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
                          ),
                          child:Padding(
                            padding: EdgeInsets.fromLTRB(20, 30, 20, 7),
                            child:ListView(
                              children: [
                                Center(
                                  child: Text("Login",
                                    style: GoogleFonts.poppins(
                                      fontSize: 32,
                                      color: Constant.accentPrimary,
                                      fontWeight: FontWeight.w700,
                                    )
                                  ),
                                ),
                                SizedBox(height: 50,),
                                TextFormField(
                                  controller: _usernameController,
                                  decoration: InputDecoration(
                                    labelText: "Username",
                                    prefixIcon: const Padding(padding: EdgeInsets.only(left:20, right: 10), child: Icon(Icons.person)),
                                    
                                    focusColor: Constant.accentPrimary,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      
                                    )
                                  ),
                                ),
                                SizedBox(height: 30,),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    prefixIcon: const Padding(padding: EdgeInsets.only(left:20, right: 10), child: Icon(Icons.lock)),
                                    
                                    focusColor: Constant.accentPrimary,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      
                                    )
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                      Row(
                                        children: [
                                          CheckboxExample(),
                                          Text("Remember me",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: Constant.blackPrimary,
                                              fontWeight: FontWeight.w400,
                                            )
                                          ),
                                        ],
                                      ),
                                    
                                    RichText(
                                      text: TextSpan(
                                        recognizer: TapGestureRecognizer()..onTap=(){print("User press forget password");},
                                        text: "Forget Password",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Constant.accentPrimary,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.underline
                                        )
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 25,),
                                PrimaryButtonActive(
                                  width: media.size.width,  // Adjust width based on your layout
                                  height: 40,  // Adjust height based on your layout
                                  isText: true,
                                  isIcon: false,
                                  text: "Login",
                                  tapFunction: () => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MainInitial()),
                                    )
                                ),
                                SizedBox(height: 25,),
                                Center(
                                  child: Text("or continue with",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color:Colors.grey[600],
                                      fontWeight: FontWeight.w300,
                                    )
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 40),
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.facebook,
                                        size: 50,
                                        color: Colors.blue[800],
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20), // Optional: add border radius
                                        child: Image.asset(
                                          "assets/google.png",
                                          fit: BoxFit.cover, // Optional: set fit property to cover
                                          height: 40, width: 40, 
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20), // Optional: add border radius
                                        child: Image.asset(
                                          "assets/twitter.png",
                                          fit: BoxFit.cover, // Optional: set fit property to cover
                                          height: 40, width: 40, 
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20), // Optional: add border radius
                                        child: Image.asset(
                                          "assets/github.png",
                                          fit: BoxFit.cover, // Optional: set fit property to cover
                                          height: 40, width: 40, 
                                        ),
                                      ),
                                    ],
                                  )
                                )
                              ],
                            ),
                          )
                        )
                      );
                    }
                  );
                }
              )
            ),
            Padding( 
            padding: EdgeInsets.fromLTRB(100,16,100,20),
              child: SecondaryButtonActive(
                width: media.size.width/2,  // Adjust width based on your layout
                height: 40,  // Adjust height based on your layout
                isText: true,
                isIcon: false,
                text: "Register",
                tapFunction: () => fungsi(context),
              ),
            )
          ]
        )
      )
    );
  }
}


class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      activeColor: Constant.accentPrimary,
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
