import 'package:flutter/material.dart';
import 'package:lenter/widgets/button.dart';
import 'package:lenter/widgets/const.dart';

class Trial2Page extends StatefulWidget {
  const Trial2Page({super.key});

  @override
  State<Trial2Page> createState() => _Trial2PageState();
}

class _Trial2PageState extends State<Trial2Page> {
  static fungsi(BuildContext context){
    print("here");
    ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(
      content: Text("Ulasan Anda berhasil disimpan!"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        color: Constant.blackPrimary,
        child: Column(children: [
          PrimaryButtonActive(
            width: media.size.width/3, 
            height: 20, 
            isText: true, 
            isIcon: false,
            text : "Strerew",
            tapFunction: () => fungsi(context),
          ),
          PrimaryButtonActive(
            width: media.size.width/3, 
            height: 20, 
            isText: false, 
            isIcon: true,
            icon: Icons.star,
            tapFunction: () => fungsi(context),
          ),
          PrimaryButtonActive(
            width: media.size.width/3, 
            height: 20, 
            isText: true, 
            isIcon: true,
            text: "Hihihiw",
            icon: Icons.star,
            tapFunction: () => fungsi(context),
          ),
          ]
        ),
      )
    );
  }
}