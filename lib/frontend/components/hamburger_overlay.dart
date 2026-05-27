import 'package:flutter/material.dart';
import '../../constants.dart';

class HamburgerOverlay extends StatelessWidget {
  const HamburgerOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Keeps translucent barrier background active
      body: Stack(
        children: [
          // Clear layout click interceptor tracking clicks outside the main service window sheet
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Main Menu Card Content
          SafeArea(
            child: Container(
              margin: const EdgeInsets.only(top: kToolbarHeight),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Mero guru services",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.black, size: 24),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1, color: AppColors.borderGray),
                  Flexible(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Quick Links", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                          const SizedBox(height: 16),
                          GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 16,
                            children: [
                              _buildQuickLinkItem(Icons.home, "Home"),
                              _buildQuickLinkItem(Icons.star_outline, "Astrology\nServices"),
                              _buildQuickLinkItem(Icons.calendar_today, "Auspicious\nDays"),
                              _buildQuickLinkItem(Icons.book_outlined, "MeroGuru\nBlogs"),
                              _buildQuickLinkItem(Icons.notifications_none, "Online\nPuja"),
                              _buildQuickLinkItem(Icons.shopping_bag_outlined, "Shop"),
                              _buildQuickLinkItem(Icons.wb_sunny_outlined, "Patro"),
                              _buildQuickLinkItem(Icons.person_outline, "Find Gurus"),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Divider(color: AppColors.borderGray, thickness: 1),
                          ),
                          const Text("Related Services", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                          const SizedBox(height: 16),
                          GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 16,
                            children: [
                              _buildQuickLinkItem(Icons.location_on, "Venue"),
                              _buildQuickLinkItem(Icons.auto_stories, "Puja Material\nSupplier"),
                              _buildQuickLinkItem(Icons.diamond_outlined, "Jewellery\nShop"),
                              _buildQuickLinkItem(Icons.restaurant, "Catering\nProvider"),
                              _buildQuickLinkItem(Icons.yard_outlined, "Garland\nSupplier"),
                              _buildQuickLinkItem(Icons.celebration, "Decoration\nProvider"),
                              _buildQuickLinkItem(Icons.camera_alt_outlined, "Photography\nProvider"),
                              _buildQuickLinkItem(Icons.music_note, "DJ service"),
                              _buildQuickLinkItem(Icons.gavel, "Legal Marriage\nCelebrant"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickLinkItem(IconData icon, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.bg,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.orangeMain, size: 26),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11, color: Colors.black87, height: 1.2),
        ),
      ],
    );
  }
}