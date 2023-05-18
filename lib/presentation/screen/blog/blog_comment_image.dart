// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:utc_student_app/utils/asset.dart';
import 'package:utc_student_app/utils/color.dart';

class BlogCommentImage extends StatelessWidget {
  static const routeName = 'blog-comment-image';
  final String imageUrl;
  const BlogCommentImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PhotoView(
          imageProvider: CachedNetworkImageProvider(
            imageUrl,
          ),
        ),
        Positioned(
          top: 60,
          right: 20,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset(
              Asset.icon('cross.png'),
              scale: 4,
              color: whiteText,
            ),
          ),
        ),
      ],
    );
  }
}
