import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utc_student_app/data/local/repository/local_repository.dart';
import 'package:utc_student_app/data/local/shared_preferences/shared_preferences_service.dart';
import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/logic/bloc/student/student_bloc.dart';
import 'package:utc_student_app/logic/bloc/student/student_event.dart';
import 'package:utc_student_app/logic/bloc/student/student_state.dart';
import 'package:utc_student_app/presentation/screen/blog/blog_create_screen.dart';
import 'package:utc_student_app/presentation/screen/blog/blog_item_screen.dart';
import 'package:utc_student_app/presentation/screen/loading/loading_circle_screen.dart';
import 'package:utc_student_app/utils/asset.dart';
import 'package:utc_student_app/utils/color.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  late Student student;

  @override
  void initState() {
    getStudent();
    super.initState();
  }

  void getStudent() async {
    student = await LocalRepository().getStudent(
        SharedPreferencesService.preferences.getString('username')!);
  }

  Future<void> refresh(BuildContext context, String studentId) async {
    context.read<StudentBloc>().add(StudentEventRefreshBlog(studentId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey200,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Thảo luận',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ).copyWith(
              color: whiteText,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: indigo900,
        shadowColor: whiteText,
        bottomOpacity: 0.1,
        elevation: 3,
        actions: [
          IconButton(
            icon: Image.asset(
              Asset.icon('plus.png'),
              scale: 3,
              color: whiteText,
            ),
            onPressed: () => Navigator.pushNamed(
              context,
              BlogCreateScreen.routeName,
              arguments: student,
            ),
          ),
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
        child: RefreshIndicator(
          onRefresh: () => refresh(context, student.studentId),
          child: BlocBuilder<StudentBloc, StudentState>(
            builder: (context, state) {
              if (state is StudentStateBlogSuccess) {
                return ListView.builder(
                  itemCount: state.blogs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        BlogItemScreen(
                          blogId: state.blogs[index].blogId,
                          studentId: state.blogs[index].studentId,
                          studentName: state.blogs[index].studentName,
                          date: state.blogs[index].createdAt,
                          body: state.blogs[index].body,
                          image: state.blogs[index].image,
                          likeCount: state.blogs[index].likeCount,
                          commentCount: state.blogs[index].commentCount,
                          isLiked: state.blogs[index].isLiked,
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                );
              }
              return const LoadingCircleScreen();
            },
          ),
        ),
      ),
    );
  }
}
