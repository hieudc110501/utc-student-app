import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:utc_student_app/data/local/repository/local_repository.dart';
import 'package:utc_student_app/data/local/shared_preferences/shared_preferences_service.dart';
import 'package:utc_student_app/data/models/blog.dart';
import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/data/repositories/blog/blog_repository.dart';
import 'package:utc_student_app/logic/bloc/student/student_bloc.dart';
import 'package:utc_student_app/logic/bloc/student/student_event.dart';
import 'package:utc_student_app/logic/bloc/student/student_state.dart';
import 'package:utc_student_app/presentation/screen/blog/blog_create_screen.dart';
import 'package:utc_student_app/presentation/screen/blog/blog_item_screen.dart';
import 'package:utc_student_app/presentation/screen/loading/loading_circle_screen.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/presentation/widgets/toast.dart';
import 'package:utc_student_app/utils/asset.dart';
import 'package:utc_student_app/utils/color.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  late Student currentStudent;
  late bool _connectionStatus;
  late BlogRepository _blogRepository;

  @override
  void initState() {
    _blogRepository = BlogRepository();
    getStudent();
    super.initState();
  }

  void getStudent() async {
    currentStudent = await LocalRepository().getStudent(
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
            onPressed: () => _connectionStatus
                ? Navigator.pushNamed(
                    context,
                    BlogCreateScreen.routeName,
                    arguments: currentStudent,
                  )
                : showToast(context, 'Bạn đang offline'),
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
        child: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            _connectionStatus = connectivity != ConnectivityResult.none;
            if (_connectionStatus) {
              _blogRepository.getAllBlog(studentId: currentStudent.studentId);
              return RefreshIndicator(
                onRefresh: () => refresh(context, currentStudent.studentId),
                child: BlocBuilder<StudentBloc, StudentState>(
                  builder: (context, state) {
                    if (state is StudentStateBlogSuccess) {
                      _blogRepository.getAllBlog(studentId: state.studentId);
                      return StreamBuilder(
                        stream: _blogRepository.all(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const LoadingCircleScreen();
                          }
                          if (snapshot.hasData) {
                            List<Blog> blogs = snapshot.data!;
                            return ListView.builder(
                              itemCount: blogs.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    BlogItemScreen(
                                      blog: blogs[index],
                                      currentStudent: currentStudent,
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                );
                              },
                            );
                          }
                          return const Center(
                            child: SampleText(
                              text: 'Chưa có bài viết nào',
                              fontWeight: FontWeight.w600,
                              size: 20,
                              color: greyText,
                            ),
                          );
                        },
                      );
                    }
                    return const LoadingCircleScreen();
                  },
                ),
              );
            } else {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SampleText(
                      text: 'Lỗi kết nối, vui lòng kiểm tra lại mạng',
                      fontWeight: FontWeight.w500,
                      size: 16,
                      color: grey500,
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      Asset.icon(
                        'disconnect.png',
                      ),
                      scale: 3,
                    ),
                  ],
                ),
              );
            }
          },
          child: const SizedBox(),
        ),
      ),
    );
  }
}
