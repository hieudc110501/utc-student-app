import 'package:flutter/material.dart';
import 'package:utc_student_app/utils/asset.dart';
import 'package:utc_student_app/utils/color.dart';

class ProfileIntroduceScreen extends StatelessWidget {
  static const routeName = 'profile-introduce-screen';
  const ProfileIntroduceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Giới thiệu',
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
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 10),
              Image.asset(
                Asset.image('dhgtvt.jpg'),
              ),
              const SizedBox(height: 10),
              RichText(
                text: const TextSpan(
                  text: 'Trường Đại học Giao thông vận tải',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: rose700,
                  ),
                  children: [
                    TextSpan(
                      text:
                          " có tiền thân là Trường Cao đẳng Công chính Việt Nam được khai giảng lại dưới chính quyền cách mạng ngày 15 tháng 11 năm 1945 theo Sắc lệnh của Chủ tịch Hồ Chí Minh; Nghị định thư của Bộ trưởng Quốc gia Giáo dục Vũ Đình Hòe và Bộ trưởng Bộ Giao thông công chính Đào Trọng Kim. Tháng 8/1960, Ban Xây dựng Trường Đại học Giao thông vận tải được thành lập và tuyển sinh khóa 1 trình độ Đại học. Ngày 24/03/1962, trường chính thức mang tên Trường Đại học Giao thông vận tải theo Quyết định số 42/CP ngày 24/03/1962 của Hội đồng Chính phủ.",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: greyText,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Trường Đại học Giao thông vận tải hiện có 2 cơ sở. Trụ sở chính tại số 3 phố Cầu Giấy, Láng Thượng, Đống Đa, Hà Nội. Phân hiệu Thành phố Hồ Chí Minh tại 450-451 đường Lê Văn Việt, phường Tăng Nhơn Phú A, quận 9 .',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: greyText,
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: 'Trường Đại học Giao thông vận tải',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: grey900,
                  ),
                  children: [
                    TextSpan(
                      text:
                          " có sứ mạng đào tạo, nghiên cứu khoa học, chuyển giao công nghệ chất lượng cao theo xu thế hội nhập, có trách nhiệm xã hội nhằm thúc đẩy sự phát triển bền vững của ngành giao thông vận tải và đất nước.",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: greyText,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: const TextSpan(
                  text: 'Mục tiêu',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: rose700,
                  ),
                  children: [
                    TextSpan(
                      text:
                          " của Trường Đại học Giao thông vận tải hướng tới mô hình đại học đa ngành về kỹ thuật, công nghệ và kinh tế; trở thành đại học trọng điểm, đào tạo nguồn nhân lực có trình độ cao đáp ứng nhu cầu phát triển bền vững ngành giao thông vận tải và đất nước; là trung tâm nghiên cứu khoa học có uy tín về Giao thông vận tải và một số lĩnh vực khác; có đẳng cấp trong khu vực và hội nhập Quốc tế; là địa chỉ tin cậy của người học, nhà đầu tư và toàn xã hội.",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: greyText,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Trường Đại học Giao thông vận tải đã vinh dự được Đảng và Nhà nước trao tặng những phần thưởng cao quý',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: greyText,
                ),
              ),
              const Text(
                "* Danh hiệu Anh hùng Lực lượng Vũ trang Nhân dân (2011)\n* Danh hiệu Anh hùng Lao động (2007)\n* Huân chương Hồ Chí Minh (2005)\n* 02 Huân chương Độc lập Hạng Nhất (2000 và 2015)\n* Huân chương Độc lập Hạng Nhì (1995)\n* Huân chương Độc lập Hạng Ba (1986)\n* 03 Huân chương Lao động Hạng Nhất (1982,1990, 2020)\n* 02 Huân chương Lao động Hạng Nhì (1977 và 2004)\n* 02 Huân chương Lao động Hạng Ba (1966 và 1999)\n* Huân chương Kháng chiến Hạng Nhì (1973)",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
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
