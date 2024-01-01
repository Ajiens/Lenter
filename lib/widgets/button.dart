import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenter/widgets/const.dart';

class PrimaryButtonActive extends StatelessWidget {
  double width;
  double height;
  bool isText=true;
  bool isIcon=false;
  String? text;
  IconData? icon;
  VoidCallback? tapFunction;

  PrimaryButtonActive({Key? key,
  required this.width,
  required this.height,
  required this.isText,
  required this.isIcon,
  this.icon,
  this.text,
  this.tapFunction}) : super(key: key);

  Widget _getWidget(){
    Widget theWidget;
    
    if (isText && !isIcon){
      theWidget = Center(
        child: Text(text!,
          style: GoogleFonts.poppins(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          )
        ),
      );
    }else if (isIcon && !isText){
      theWidget = Center(
        child: Icon(icon, color: Colors.white,),
      );
    }else{
      theWidget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: width/20),
          Text(text!, 
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            )
          ),
        ],
      );
    }

    return theWidget;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapFunction,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: Constant.gradientColor,
        ),
        child: _getWidget(),
      ),
    );
  }
}
class SecondaryButtonActive extends StatelessWidget {
  double width;
  double height;
  bool isText=true;
  bool isIcon=false;
  String? text;
  IconData? icon;
  VoidCallback? tapFunction;

  SecondaryButtonActive({Key? key,
  required this.width,
  required this.height,
  required this.isText,
  required this.isIcon,
  this.icon,
  this.text,
  this.tapFunction}) : super(key: key);

  Widget _getWidget(){
    Widget theWidget;
    
    if (isText && !isIcon){
      theWidget = Center(
        child: Text(text!,
          style: GoogleFonts.poppins(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          )
        ),
      );
    }else if (isIcon && !isText){
      theWidget = Center(
        child: Icon(icon, color: Colors.white,),
      );
    }else{
      theWidget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: width/20),
          Text(text!, 
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            )
          ),
        ],
      );
    }

    return theWidget;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapFunction,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Constant.blackSecondary,
        ),
        child: _getWidget(),
      ),
    );
  }
}