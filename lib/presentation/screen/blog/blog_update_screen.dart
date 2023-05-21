// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:utc_student_app/data/models/blog.dart';
import 'package:utc_student_app/data/repositories/blog/blog_repository.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/asset.dart';
import 'package:utc_student_app/utils/color.dart';
import 'package:utc_student_app/utils/size.dart';
class BlogUpdateScreen extends StatefulWidget {
  static const routeName = 'blog-update';
  final Blog blog;
  const BlogUpdateScreen({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  State<BlogUpdateScreen> createState() => _BlogUpdateScreenState();
}

class _BlogUpdateScreenState extends State<BlogUpdateScreen> {
  TextEditingController controller = TextEditingController();
  late BlogRepository _blogRepository;
  bool isData = false;

  @override
  void initState() {
    controller.text = widget.blog.body ?? '';
    _blogRepository = BlogRepository();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey200,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Chỉnh sửa bài viết',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ).copyWith(
              color: whiteText,
            ),
          ),
        ),
        backgroundColor: indigo900,
        shadowColor: whiteText,
        bottomOpacity: 0.1,
        elevation: 3,
        actions: [
          if (isData) ...[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _blogRepository.updateBlog(
                  blog: Blog(
                    blogId: widget.blog.blogId,
                    body: controller.text,
                    image: widget.blog.image,
                    studentId: widget.blog.studentId,
                    studentName: widget.blog.studentName,
                    createdAt: widget.blog.createdAt,
                    likeCount: widget.blog.likeCount,
                    commentCount: widget.blog.commentCount,
                    isLiked: widget.blog.isLiked,
                  ),
                );
              },
              child: Container(
                height: 30,
                width: 40,
                decoration: BoxDecoration(
                  color: whiteText,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Center(
                  child: SampleText(
                    text: 'Lưu',
                    fontWeight: FontWeight.w700,
                    size: 12,
                    color: greyText,
                  ),
                ),
              ),
            )
          ],
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/icons/menu_icon.png',
              color: whiteText,
              scale: 3,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
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
                  const SizedBox(width: 14),
                  SampleText(
                    text: widget.blog.studentName,
                    fontWeight: FontWeight.w800,
                    size: 16,
                    color: greyText,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: 50,
                  maxHeight: 500,
                ),
                child: TextFormField(
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        isData = true;
                      });
                    } else {
                      setState(() {
                        isData = false;
                      });
                    }
                  },
                  minLines: 1,
                  maxLines: null,
                  controller: controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nhập nội dung...',
                  ),
                ),
              ),
            ),
            if (widget.blog.image != null) ...[
              CachedNetworkImage(
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
            ],
          ],
        ),
      ),
    );
  }
}
