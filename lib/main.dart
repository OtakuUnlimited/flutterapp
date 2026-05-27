import 'package:flutter/material.dart';
import 'constants.dart';
import 'frontend/pages/home_screen.dart';

void main() {
  runApp(const MeroGuruApp());
}

class MeroGuruApp extends StatelessWidget {
  const MeroGuruApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mero Guru',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.orangeMain,
        scaffoldBackgroundColor: AppColors.bg,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}