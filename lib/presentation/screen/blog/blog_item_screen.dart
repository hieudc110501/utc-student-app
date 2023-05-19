// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:utc_student_app/data/models/blog.dart';
import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/data/repositories/blog/blog_repository.dart';
import 'package:utc_student_app/data/repositories/comment/comment_repository.dart';
import 'package:utc_student_app/data/repositories/student/student_repostitory.dart';
import 'package:utc_student_app/presentation/screen/blog/blog_comment_image.dart';
import 'package:utc_student_app/presentation/screen/blog/blog_comment_screen.dart';
import 'package:utc_student_app/presentation/screen/blog/blog_update_screen.dart';
import 'package:utc_student_app/presentation/widgets/dialog/delete_blog_dialog.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/asset.dart';
import 'package:utc_student_app/utils/color.dart';
import 'package:utc_student_app/utils/size.dart';

class BlogItemScreen extends StatefulWidget {
  final Blog blog;
  final Student currentStudent;

  const BlogItemScreen({
    Key? key,
    required this.blog,
    required this.currentStudent,
  }) : super(key: key);

  @override
  State<BlogItemScreen> createState() => _BlogItemScreenState();
}

class _BlogItemScreenState extends State<BlogItemScreen> {
  late bool isLike;
  bool isEntering = false;
  late BlogRepository _blogRepository;
  late int _likes;
  TextEditingController cmtController = TextEditingController();
  final CommentRepository _commentRepository = CommentRepository();

  @override
  void initState() {
    isLike = widget.blog.isLiked == 1 ? true : false;
    _blogRepository = BlogRepository();
    _likes = widget.blog.likeCount;
    cmtController.text = widget.blog.commentCount.toString();
    _commentRepository.getComment(blogId: widget.blog.blogId);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                          text: widget.blog.studentName,
                          fontWeight: FontWeight.w800,
                          size: 16,
                          color: greyText,
                        ),
                        SampleText(
                          text: widget.blog.updatedAt != null
                              ? 'Đã chỉnh sửa ${widget.blog.updatedAt}'
                              : widget.blog.createdAt,
                          fontWeight: FontWeight.w400,
                          size: 12,
                          color: greyText,
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    if (widget.currentStudent.studentId ==
                        widget.blog.studentId) {
                      showModalBottomSheet(
                        backgroundColor: Colors.white.withOpacity(0),
                        //barrierColor: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(26),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 100,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () => Navigator.pushReplacementNamed(
                                    context,
                                    BlogUpdateScreen.routeName,
                                    arguments: widget.blog,
                                  ),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: whiteText,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            Asset.icon('edit.png'),
                                            scale: 4,
                                            color: greyText,
                                          ),
                                          const SizedBox(width: 20),
                                          const SampleText(
                                            text: 'Chỉnh sửa bài viết',
                                            fontWeight: FontWeight.w500,
                                            size: 16,
                                            color: greyText,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await showDeleteBlogDialog(context);
                                    // ignore: use_build_context_synchronously
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: whiteText,
                                      border: Border.symmetric(
                                        horizontal: BorderSide(
                                          width: 1,
                                          color: grey300,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            Asset.icon('delete.png'),
                                            scale: 4,
                                            color: rose500,
                                          ),
                                          const SizedBox(width: 20),
                                          const SampleText(
                                            text: 'Xóa bài viết',
                                            fontWeight: FontWeight.w500,
                                            size: 16,
                                            color: rose500,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        isScrollControlled: true,
                      );
                    }
                  },
                  child: Image.asset(
                    Asset.icon('menu_dots.png'),
                    scale: 3,
                    color: grey900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              widget.blog.body ?? '',
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
          if (widget.blog.image != null) ...[
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                BlogCommentImage.routeName,
                arguments: widget.blog.image!,
              ),
              child: CachedNetworkImage(
                imageUrl: widget.blog.image!,
                fit: BoxFit.fitHeight,
                placeholder: (context, url) => Container(
                  color: whiteText,
                  width: screenSize.width,
                  height: 300,
                  child: Image.asset(
                    Asset.image('loading.png'),
                    scale: 6,
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: whiteText,
                  width: screenSize.width,
                  height: 300,
                  child: Image.asset(
                    Asset.image('error.png'),
                    scale: 6,
                  ),
                ),
              ),
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
                StreamBuilder(
                  stream: _commentRepository.commentCount(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SampleText(
                        text: '${snapshot.data} bình luận',
                        fontWeight: FontWeight.w600,
                        size: 14,
                        color: greyText,
                      );
                    }
                    return const SizedBox();
                  },
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
                      await _blogRepository.insertLike(
                        blogId: widget.blog.blogId,
                        studentId: widget.currentStudent.studentId,
                      );
                    } else {
                      await _blogRepository.deleteLike(
                        blogId: widget.blog.blogId,
                        studentId: widget.currentStudent.studentId,
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
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.white.withOpacity(0),
                      //barrierColor: Colors.transparent,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(26),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return BlogCommentScreen(
                          blog: widget.blog,
                          currentStudent: widget.currentStudent,
                          likes: _likes,
                          cmtController: cmtController,
                        );
                      },
                      isScrollControlled: true,
                    ).then((value) => setState(() {
                          _commentRepository.getComment(
                              blogId: widget.blog.blogId);
                        }));
                  },
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
