// components/home/verified_guru_section.dart

import 'package:flutter/material.dart';
import '../../../backend/services/content_services.dart';
import '../../../constants.dart';

class VerifiedGuruSection extends StatelessWidget {
  const VerifiedGuruSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ContentService().fetchVerifiedGurus(),
      builder: (context, snapshot) {

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final gurus = snapshot.data!;

        return SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: gurus.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {

              final guru = gurus[index];

              return Container(
                width: 100,
                margin: const EdgeInsets.only(right: 14),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 38,
                      backgroundImage: NetworkImage(
                        guru['image'] ?? '',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      guru['name'] ?? '',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.maroonRed,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}