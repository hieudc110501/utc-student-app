// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:utc_student_app/utils/color.dart';
// import 'package:webview_flutter_android/webview_flutter_android.dart';

// class ProfileMap extends StatefulWidget {
//   static const routeName = 'profile-map-screen';
//   const ProfileMap({super.key});

//   @override
//   State<ProfileMap> createState() => _ProfileMapState();
// }

// class _ProfileMapState extends State<ProfileMap> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Bản đồ',
//             style: const TextStyle(
//               fontFamily: 'Inter',
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//             ).copyWith(
//               color: whiteText,
//             ),
//           ),
//         ),
//         automaticallyImplyLeading: false,
//         backgroundColor: indigo900,
//         shadowColor: whiteText,
//         bottomOpacity: 0.1,
//         elevation: 3,
//         actions: [
//           IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(
//               Icons.close,
//               color: whiteText,
//             ),
//           ),
//         ],
//       ),
//       body: InAppWebView(
//         initialUrlRequest: URLRequest(
//           url: Uri.parse(
//               'https://maps.inmapz.com/truong-dai-hoc-giao-thong-van-tai-so-3-cau-giay-university-school-1747848433'),
//         ),
//       ),
//     );
//   }
// }
