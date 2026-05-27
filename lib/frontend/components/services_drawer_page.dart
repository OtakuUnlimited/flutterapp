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
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.orangeMain, size: 32),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              mainAxisSpacing: 24,
              crossAxisSpacing: 8,
              children: [
                _buildDrawerIcon(Icons.notifications_none, "Online\nPuja"),
                _buildDrawerIcon(Icons.star_outline, "Astrology\nServices"),
                _buildDrawerIcon(Icons.calendar_today, "Auspicious\nDays"),
                _buildDrawerIcon(Icons.camera_alt_outlined, "Photography\nProvider"),
                _buildDrawerIcon(Icons.location_on, "Venue"),
                _buildDrawerIcon(Icons.auto_stories, "Puja Material\nSupplier"),
                _buildDrawerIcon(Icons.diamond_outlined, "Jewellery\nShop"),
                _buildDrawerIcon(Icons.music_note, "DJ service"),
                _buildDrawerIcon(Icons.restaurant, "Catering\nProvider"),
                _buildDrawerIcon(Icons.yard_outlined, "Garland\nSupplier"),
                _buildDrawerIcon(Icons.celebration, "Decoration\nProvider"),
                _buildDrawerIcon(Icons.gavel, "Legal Marriage\nCelebrant"),
              ],
            ),
          )
        ],
      ),
    );
  }

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
          ),
        ),
      ],
    );
  }
}