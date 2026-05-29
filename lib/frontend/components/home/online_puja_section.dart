// components/home/online_puja_section.dart

import 'package:flutter/material.dart';
import '../../../backend/services/content_services.dart';

class OnlinePujaSection extends StatelessWidget {
  const OnlinePujaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ContentService().fetchOnlinePujas(),
      builder: (context, snapshot) {

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final pujas = snapshot.data!;

        return SizedBox(
          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pujas.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {

              final puja = pujas[index];

              return Container(
                width: 150,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.08),
                      blurRadius: 8,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(18),
                        ),
                        child: Image.network(
                          puja['image'] ?? '',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        puja['title'] ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
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