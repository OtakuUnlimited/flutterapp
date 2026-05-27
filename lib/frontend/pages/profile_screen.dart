import 'package:flutter/material.dart';
import '../../constants.dart';
import '../components/top_nav_bar.dart';
import '../components/bottom_nav_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavBar(
        title: "My Profile",
        style: NavBarStyle.BrandedLight,
        showMenu: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 65,
                backgroundColor: Colors.grey.shade300,
                backgroundImage: const NetworkImage("https://via.placeholder.com/150"),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Pandit Narayan Shastri",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textDark),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.maroonRed,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              ),
              onPressed: () {},
              child: const Text("Upload", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 24),
            
            // Name Fields Grid
            Row(
              children: [
                Expanded(child: _buildInputLabelField("FIRST NAME", "Julian")),
                const SizedBox(width: 12),
                Expanded(child: _buildInputLabelField("MIDDLE NAME", "Luther")),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildInputLabelField("LAST NAME", "Amsel")),
                const SizedBox(width: 12),
                Expanded(child: _buildInputLabelField("USERNAME", "Julianking")),
              ],
            ),
            const SizedBox(height: 24),

            // Location Box Block
            _buildProfileSectionCard("Location Details", Icons.location_on_outlined, [
              _buildDropdownRow("Country", "Australia"),
              _buildDropdownRow("State/Province", "New South Wales"),
              _buildInlineInputRow("Suburb/City", "Artarmon"),
              _buildInlineInputRow("Post Code", "2064", valueColor: AppColors.orangeMain),
              const SizedBox(height: 12),
              const TextField(
                decoration: InputDecoration(
                  labelText: "Full Address",
                  labelStyle: TextStyle(color: Colors.black54),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black87)),
                ),
              ),
            ]),
            const SizedBox(height: 16),

            // Contact Block
            _buildProfileSectionCard("Contact Details", Icons.phone_outlined, [
              Row(
                children: [
                  Expanded(flex: 2, child: _buildInputLabelField("COUNTRY CODE", "+977")),
                  const SizedBox(width: 12),
                  Expanded(flex: 4, child: _buildInputLabelField("PHONE", "9800000000")),
                ],
              ),
              const SizedBox(height: 16),
              _buildInputLabelField("EMAIL", "samrock@gmail.com"),
            ]),
            const SizedBox(height: 32),

            // Action Dashboard Buttons
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.maroonRed,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {},
                child: const Text("Save Changes", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.borderGray),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel", style: TextStyle(color: Colors.black87, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildInputLabelField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 6),
        TextFormField(
          initialValue: value,
          style: const TextStyle(color: AppColors.textDark, fontSize: 15),
          decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileSectionCard(String heading, IconData icon, List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: AppColors.orangeMain.withOpacity(0.1), child: Icon(icon, color: AppColors.orangeMain)),
              const SizedBox(width: 12),
              Text(heading, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            ],
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildDropdownRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54, fontSize: 14)),
          Row(
            children: [
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textDark, fontSize: 14)),
              const Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.grey),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildInlineInputRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54, fontSize: 14)),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: valueColor ?? AppColors.textDark, fontSize: 14, decoration: TextDecoration.underline)),
        ],
      ),
    );
  }
}