import 'package:flutter/material.dart';
import '../../constants.dart';
import '../components/top_nav_bar.dart';

class GuruProfileScreen extends StatelessWidget {
  const GuruProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomTopNavBar(
        title: "Mero Guru",
        showBack: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(radius: 50, backgroundColor: Colors.grey.shade300, child: const Icon(Icons.person, size: 60, color: Colors.white)),
            const SizedBox(height: 12),
            const Text("Pandit Narayan Shastri", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            const Text('"Preserving Tradition, Inspiring Faith"', style: TextStyle(fontSize: 13, color: AppColors.orangeMain, fontStyle: FontStyle.italic)),
            const SizedBox(height: 12),
            IconButton(icon: const Icon(Icons.share, color: AppColors.orangeMain), onPressed: () {}),
            Row(
              children: [
                Expanded(child: _buildInfoTile("GENDER", "Male", Icons.male)),
                const SizedBox(width: 12),
                Expanded(child: _buildInfoTile("GOTRA", "Bharadwaj", Icons.mediation)),
              ],
            ),
            const SizedBox(height: 16),
            _buildCardBlock("Service Details", [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ["Satyanarayan Puja", "Marriage", "Ghar Puja", "Bratabandha", "Graha Shanti"].map((e) => Chip(backgroundColor: AppColors.bg, side: const BorderSide(color: AppColors.borderGray), label: Text(e, style: const TextStyle(fontSize: 12, color: AppColors.brownAccent)))).toList(),
              ),
              const Divider(height: 24),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _BlockMetaText("EXPERIENCE", "15 Year(s)"),
                  _BlockMetaText("AVAILABILITY", "Full Time"),
                ],
              ),
              const SizedBox(height: 12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _BlockMetaText("SERVICE AREAS", "Sydney"),
                  _BlockMetaText("DO YOU DRIVE", "Yes"),
                ],
              )
            ]),
            _buildCardBlock("Location Details", [
              _buildRowDetail("Country", "Australia"),
              _buildRowDetail("State/Province", "New South Wales"),
              _buildRowDetail("Suburb/City", "Artarmon"),
              _buildRowDetail("Post Code", "2064", valueColor: AppColors.orangeMain),
            ]),
            _buildCardBlock("Professional Profile", [
              const _BlockMetaText("HIGHEST QUALIFICATION", "Masters Degree in Vedic Studies"),
              const SizedBox(height: 12),
              const _BlockMetaText("ASSOCIATED TEMPLE", "Independent Practice"),
              const SizedBox(height: 12),
              const Text("SPOKEN LANGUAGES", style: TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Wrap(
                spacing: 6,
                children: ["ENGLISH", "NEPALI", "HINDI", "SANSKRIT"].map((l) => Chip(backgroundColor: AppColors.orangeMain.withOpacity(0.1), label: Text(l, style: const TextStyle(fontSize: 10, color: AppColors.orangeMain, fontWeight: FontWeight.bold)))).toList(),
              )
            ]),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColors.brownAccent, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Get in Touch", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  _buildContactButton(Icons.phone, "PHONE NUMBER", "+61 451 947 890"),
                  const SizedBox(height: 12),
                  _buildContactButton(Icons.email, "EMAIL ADDRESS", "panthipomlal@gmail.com"),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.borderGray)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.orangeMain, size: 20),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textDark)),
        ],
      ),
    );
  }

  Widget _buildCardBlock(String headerTitle, List<Widget> children) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.borderGray)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(headerTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark)),
          const SizedBox(height: 12),
          ...children
        ],
      ),
    );
  }

  Widget _buildRowDetail(String label, String val, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          Text(val, style: TextStyle(fontWeight: FontWeight.bold, color: valueColor ?? AppColors.textDark)),
        ],
      ),
    );
  }

  Widget _buildContactButton(IconData icon, String subtitle, String title) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Icon(icon, color: AppColors.greenAccent),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 10)),
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}

class _BlockMetaText extends StatelessWidget {
  final String label;
  final String value;
  const _BlockMetaText(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textDark)),
      ],
    );
  }
}