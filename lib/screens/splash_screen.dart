import 'package:flutter/material.dart';
import 'package:lenter/widgets/const.dart';

class SpalashScreen extends StatelessWidget {
  const SpalashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Constant.blackPrimary,
        body: Center(
          child: Container(
            width: media.size.width * 0.5,
            height: media.size.width * 0.5,
            child: Image.asset('assets/logo.png'),
          ),
        )
      ),
    );
  }
}