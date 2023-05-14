// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/asset.dart';
import 'package:utc_student_app/utils/color.dart';

class BlogItemScreen extends StatelessWidget {
  final String studentName;
  final String date;
  final String body;
  final String image;
  final int likeCount;
  final int commentCount;

  const BlogItemScreen({
    Key? key,
    required this.studentName,
    required this.date,
    required this.body,
    required this.image,
    required this.likeCount,
    required this.commentCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: const BoxDecoration(
        color: whiteText,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Image.asset(
                  Asset.icon('avatar.png'),
                  scale: 3,
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SampleText(
                      text: studentName,
                      fontWeight: FontWeight.w800,
                      size: 16,
                      color: greyText,
                    ),
                    SampleText(
                      text: date,
                      fontWeight: FontWeight.w400,
                      size: 12,
                      color: greyText,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              body,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: greyText,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 20),
          const Divider(
            height: 0,
            color: grey300,
          ),
          Image.asset(
            image,
          ),
          const Divider(
            height: 0,
            color: grey300,
          ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Icon(Icons.favorite, color: Colors.red),
                      ),
                      TextSpan(
                        text: '  $likeCount',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: greyText,
                        ),
                      ),
                    ],
                  ),
                ),
                SampleText(
                  text: '$commentCount bình luận',
                  fontWeight: FontWeight.w600,
                  size: 14,
                  color: greyText,
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          const Divider(
            height: 0,
            color: grey300,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Asset.icon('heart.png'),
                        scale: 3,
                        color: grey500,
                      ),
                      const SizedBox(width: 10),
                      const SampleText(
                        text: 'Thích',
                        fontWeight: FontWeight.w500,
                        size: 14,
                        color: greyText,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Asset.icon('comment.png'),
                        scale: 3,
                        color: grey500,
                      ),
                      const SizedBox(width: 10),
                      const SampleText(
                        text: 'Bình luận',
                        fontWeight: FontWeight.w500,
                        size: 14,
                        color: greyText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
