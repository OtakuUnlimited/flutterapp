import 'package:flutter/material.dart';
import 'constants.dart';
import 'pages/home_screen.dart';
import 'pages/find_gurus_screen.dart';
//import 'pages/guru_profile_screen.dart';

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
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        fontFamily: 'Roboto',
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Center(child: Text("Patro")),
    const Center(child: Text("Shop")),
    const Center(child: Text("Services")),
    const FindGurusScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.orangeMain,
        unselectedItemColor: Colors.black54,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5),
            label: 'Patro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Shop',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: 'Services'),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'Find Gurus',
          ),
        ],
      ),
    );
  }
}
