import 'package:flutter/material.dart';
import '../../constants.dart';

class ServicesDrawerPage extends StatelessWidget {
  const ServicesDrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 12),
      child: Column(
        children: [
          // Dismiss Arrow Button
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.orangeMain, size: 32),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(height: 8),
          
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Static Core Services Menu (Kept as requested)
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.8,
                    children: [
                      _buildDrawerIcon(Icons.notifications_none, "Online\nPuja"),
                      _buildDrawerIcon(Icons.star_outline, "Astrology\nServices"),
                      _buildDrawerIcon(Icons.calendar_today, "Auspicious\nDays"),
                    ],
                  ),
                  
                  // Divider to cleanly separate the Core items from Dynamic Related items
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Builder method kept exclusively for the local static Core Services items
  Widget _buildDrawerIcon(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.orangeMain, size: 28),
        const SizedBox(height: 6),
        Expanded(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11, color: Colors.black87, height: 1.1),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}