import 'package:flutter/material.dart';
import '../../constants.dart';
import '../components/top_nav_bar.dart';
import '../components/bottom_nav_bar.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavBar(
        title: "Mero Guru",
        style: NavBarStyle.BrandedLight,
        showMenu: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black), 
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.black),
            onPressed: () => Navigator.push(
              context, 
              MaterialPageRoute(builder: (_) => const LoginScreen()),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              color: AppColors.orangeMain.withOpacity(0.1),
              child: Column(
                children: [
                  const Text(
                    "Find The Best Guru", 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.brownAccent),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Anywhere in Australia", 
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.orangeMain),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orangeMain, 
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.search, color: Colors.white),
                    label: const Text("Find a Guru", style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0, bottom: 12.0),
              child: Text(
                "Related Services", 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark),
              ),
            ),
            
            // Your explicitly provided spaced service layout grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
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
            ),
            
            _buildSectionHeader("Online Puja Services"),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildPujaCard("Graha Shanti Pooja"),
                  _buildPujaCard("Kal Sarpa Yog Puja"),
                ],
              ),
            ),
            _buildSectionHeader("Our Verified Gurus"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildVerifiedGuruAvatar("Pandit Ram\nPrasad Rijal"),
                _buildVerifiedGuruAvatar("Pandit Rabin\nAryal"),
                _buildVerifiedGuruAvatar("Pandit shankar\nPrasad Gautam"),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(activeIndex: 0),
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
            border: Border.all(color: AppColors.borderGray, width: 0.5),
          ),
          child: Icon(icon, color: AppColors.orangeMain, size: 26),
        ),
        const SizedBox(height: 6),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11, color: Colors.black87, height: 1.2),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
          const Text("View all >", style: TextStyle(color: AppColors.orangeMain, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildPujaCard(String name) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(12), 
        border: Border.all(color: AppColors.borderGray),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: AppColors.brownAccent.withOpacity(0.1), 
              child: const Center(child: Icon(Icons.image, color: Colors.grey)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name, 
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textDark), 
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildVerifiedGuruAvatar(String name) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35, 
          backgroundColor: Colors.grey.shade300, 
          child: const Icon(Icons.person, size: 40, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          name, 
          style: const TextStyle(fontSize: 11, color: AppColors.maroonRed, fontWeight: FontWeight.w600), 
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}