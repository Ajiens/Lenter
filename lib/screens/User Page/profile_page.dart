import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenter/widgets/const.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    print(media.size.width);
    print(media.size.height);

    return Container(
      height: media.size.height,
      color: Constant.blackPrimary,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              height: 58,
              child: Image.asset("assets/logo.png"),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                alignment: Alignment.center,
                width: media.size.width,
                height: media.size.height+10,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 70,),
                        Container(
                          height: media.size.height-149,
                          decoration: BoxDecoration(
                            color: Constant.blackSecondary,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        ProfilePicture(),
                        SizedBox(height: 12,),
                        Text("Jacko",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(height: 8,),
                        PremiumUserButton(),
                        SizedBox(height:24),
                        UserBookData(),
                        SizedBox(height: 15,),
                        UserMenu(
                          onTap:() => {},
                          iconLeading: Icons.person, 
                          text: "Personal Data", 
                        ),
                        UserMenu(
                          onTap:() => {},
                          iconLeading: Icons.settings_suggest_rounded, 
                          text: "Settings", 
                        ),
                        UserMenu(
                          onTap:() => {},
                          iconLeading: Icons.library_books_rounded, 
                          text: "My Library", 
                        ),
                        UserMenu(
                          onTap:() => {},
                          iconLeading: Icons.info_rounded, 
                          text: "Info", 
                        ),
                        UserMenu(
                          onTap:() => {
                            Navigator.pop(context)
                          },
                          iconLeading: Icons.logout, 
                          text: "Log out", 
                        ),
                      ],
                    )
                  ],
                )
              )
            )
          ],
        )
      ),
    );
  }
}

class UserMenu extends StatelessWidget {
  final IconData iconLeading;
  final String text;
  final VoidCallback onTap;

  UserMenu({Key? key,
  required this.iconLeading,
  required this.text,
  required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Container(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(iconLeading, size: 32,color: Colors.grey[400],),
                  SizedBox(width: 12,),
                  Text(text,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight:FontWeight.w400
                    ),
                  )
                ],
              ),
              Icon(Icons.navigate_next_sharp, size: 24, color: Colors.grey[400],)
            ],
          ),
        )
      )
    );
  }
}

class UserBookData extends StatelessWidget {
  const UserBookData({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: media.size.width-60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("44",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 5,),
                Text("Books",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
            Container(
              height: 45,
              width: 2,
              color: const Color.fromARGB(80, 189, 189, 189),
            ),
            Column(
              children: [
                Text("343",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 5,),
                Text("Books Shared",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
            Container(
              height: 45,
              width: 2,
              color: const Color.fromARGB(80, 189, 189, 189),
            ),
            Column(
              children: [
                Text("122",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 5,),
                Text("Friends",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),

          ],
        ),
      )
    );
  }
}

class PremiumUserButton extends StatefulWidget {
  const PremiumUserButton({super.key});

  @override
  State<PremiumUserButton> createState() => _PremiumUserButtonState();
}

class _PremiumUserButtonState extends State<PremiumUserButton> {
  bool isPremium = false;

  LinearGradient getGradient(){
    if (isPremium){
      return Constant.gradientColor;
    }
    else{
      LinearGradient gradientColor = LinearGradient(
              colors: [Color(0XFFE5E5E5), Color.fromRGBO(149, 151, 170, 1)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,);
      return gradientColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPremium = !isPremium;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 20,
        width: (isPremium)?110:100,
        child: Text((isPremium)?"Premium User":"Reguler User",
          style: GoogleFonts.poppins(
            color: (isPremium)?Colors.white:Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w400
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: getGradient()
        ),
      )
    );
  }
}

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key});

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  int indexPicture = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          indexPicture++;
          if (indexPicture == 7){
            indexPicture = 1;
          }
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50), // Optional: add border radius
        child: Image.asset(
          "assets/profile/profile_pict${indexPicture}.jpg",
          fit: BoxFit.cover, // Optional: set fit property to cover
          height: 145, width: 152, 
        ),
      )
    );
  }
}