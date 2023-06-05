import 'package:flutter/material.dart';
import 'package:utc_student_app/utils/color.dart';

class ProfileMailScreen extends StatelessWidget {
  static const routeName = 'profile-mail-screen';
  const ProfileMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Đóng góp ý kiến',
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
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
              color: whiteText,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Mọi ý kiến đóng góp xin gửi về địa chỉ email',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: greyText,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'truongminhhieu152@gmail.com',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: greyText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
