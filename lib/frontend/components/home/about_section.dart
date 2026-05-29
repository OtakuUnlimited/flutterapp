// lib/components/home/about_section.dart

import 'package:flutter/material.dart';
import '../../../constants.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [

          const Text(
            "About MeroGuru",
            style: TextStyle(
              color: AppColors.orangeMain,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "Your Trusted Spiritual Companion",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "MeroGuru.com is your trusted platform for accessing verified, experienced Gurus and religious service providers—no matter where you are in the world.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              height: 1.6,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 30),

          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor:
                  AppColors.orangeMain,
              side: const BorderSide(
                color: AppColors.orangeMain,
              ),
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 26,
                vertical: 14,
              ),
              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                  30,
                ),
              ),
            ),
            child: const Text(
              "Know More",
            ),
          ),

          const SizedBox(height: 30),

          Image.asset(
            'lib/assets/images/guru.png',
            height: 260,
          ),
        ],
      ),
    );
  }
}