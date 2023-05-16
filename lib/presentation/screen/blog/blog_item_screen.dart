// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:utc_student_app/data/repositories/student/student_repostitory.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/asset.dart';
import 'package:utc_student_app/utils/color.dart';
import 'package:utc_student_app/utils/size.dart';

class BlogItemScreen extends StatefulWidget {
  final int blogId;
  final String studentId;
  final String studentName;
  final String date;
  final String? body;
  final String? image;
  final int likeCount;
  final int commentCount;
  final int isLiked;

  const BlogItemScreen({
    Key? key,
    required this.blogId,
    required this.studentId,
    required this.studentName,
    required this.date,
    required this.body,
    required this.image,
    required this.likeCount,
    required this.commentCount,
    required this.isLiked,
  }) : super(key: key);

  @override
  State<BlogItemScreen> createState() => _BlogItemScreenState();
}

class _BlogItemScreenState extends State<BlogItemScreen> {
  late bool isLike;
  late StudentRepository _studentRepository;

  late int _likes;
  @override
  void initState() {
    isLike = widget.isLiked == 1 ? true : false;
    _studentRepository = StudentRepository();
    _likes = widget.likeCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      text: widget.studentName,
                      fontWeight: FontWeight.w800,
                      size: 16,
                      color: greyText,
                    ),
                    SampleText(
                      text: widget.date,
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
              widget.body ?? '',
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
          if (widget.image != null) ...[
            Image.network(
              widget.image!,
              fit: BoxFit.fitHeight,
            ),
          ],
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
                      WidgetSpan(
                        child: Image.asset(
                          Asset.icon('like.png'),
                          color: Colors.red,
                          scale: 6,
                        ),
                      ),
                      TextSpan(
                        text: ' $_likes',
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
                  text: '${widget.commentCount} bình luận',
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
                InkWell(
                  splashColor: Colors.amber,
                  onTap: () async {
                    setState(() {
                      isLike = !isLike;
                      if (isLike) {
                        _likes++;
                      } else {
                        _likes--;
                      }
                    });
                    if (isLike) {
                      print('insert');
                      await _studentRepository.insertLike(
                        blogId: widget.blogId,
                        studentId: widget.studentId,
                      );
                    } else {
                      print('delete');
                      await _studentRepository.deleteLike(
                        blogId: widget.blogId,
                        studentId: widget.studentId,
                      );
                    }
                  },
                  child: SizedBox(
                    // color: Colors.amber,
                    width: screenSize.width / 2 - 20,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Asset.icon(isLike ? 'like.png' : 'unlike.png'),
                          scale: 5.4,
                          color: isLike ? Colors.red : grey500,
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
                ),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: screenSize.width / 2 - 20,
                    height: 30,
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
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
