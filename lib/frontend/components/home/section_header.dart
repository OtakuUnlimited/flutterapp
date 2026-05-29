import 'package:flutter/material.dart';
import '../../../constants.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll;

  const SectionHeader({
    super.key,
    required this.title,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 18,
      ),

      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.center,

        children: [

          /// TITLE
          Expanded(
            child: Text(
              title,

              maxLines: 2,

              overflow:
                  TextOverflow.ellipsis,

              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
          ),

          const SizedBox(width: 10),

          /// VIEW MORE BUTTON
          GestureDetector(
            onTap: onViewAll,

            child: Container(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),

              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      AppColors.orangeMain,
                ),

                borderRadius:
                    BorderRadius.circular(
                  20,
                ),
              ),

              child: const Text(
                "View More",

                style: TextStyle(
                  color:
                      AppColors.orangeMain,
                  fontSize: 12,
                  fontWeight:
                      FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}