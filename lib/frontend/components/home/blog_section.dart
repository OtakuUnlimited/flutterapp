// components/home/blog_section.dart

import 'package:flutter/material.dart';
import '../../../backend/services/content_services.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ContentService().fetchBlogs(),
      builder: (context, snapshot) {

        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        final blogs = snapshot.data!;

        return Column(
          children: blogs.map((blog) {

            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
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
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                    child: Image.network(
                      blog['image'] ?? '',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          blog['title'] ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          blog['description'] ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}