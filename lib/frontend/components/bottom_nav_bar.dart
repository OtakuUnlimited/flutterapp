import 'package:flutter/material.dart';
import '../../constants.dart';
import '../pages/home_screen.dart';
import '../pages/find_gurus_screen.dart';
import 'services_drawer_page.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int activeIndex;

  const CustomBottomNavBar({
    Key? key,
    required this.activeIndex,
  }) : super(key: key);

  void _navigateToPage(BuildContext context, int index) {
    if (index == 3) {
      // Index 3 represents the Services tab. 
      // Open the Drawer panel sheet that automatically closes when tapping outside.
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.black.withOpacity(0.5), // Semi-transparent overlay backdrop
        builder: (context) => const FractionallySizedBox(
          heightFactor: 0.5, // Adjusts sheet display height
          child: ServicesDrawerPage(),
        ),
      );
      return;
    }

    if (index == activeIndex) return;

    Widget targetedScreen;
    switch (index) {
      case 0:
        targetedScreen = const HomeScreen();
        break;
      case 4:
        targetedScreen = const FindGurusScreen();
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Tab $index selected (Coming Soon!)")),
        );
        return;
    }

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => targetedScreen,
        transitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.borderGray, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(context, 0, Icons.home, 'Home'),
            _buildNavItem(context, 1, Icons.brightness_5, 'Patro'),
            _buildNavItem(context, 2, Icons.shopping_bag, 'Shop'),
            _buildNavItem(context, 3, Icons.layers, 'Services'),
            _buildNavItem(context, 4, Icons.people_outline, 'Gurus'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, IconData iconData, String label) {
    final bool isActive = index == activeIndex;
    final Color itemColor = isActive ? AppColors.orangeMain : Colors.black;

    return GestureDetector(
      onTap: () => _navigateToPage(context, index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, color: itemColor, size: 26),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: itemColor,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 2),
          Container(
            height: 3,
            width: 32,
            decoration: BoxDecoration(
              color: isActive ? AppColors.orangeMain : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}