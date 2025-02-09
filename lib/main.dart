import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/create_page/create_page.dart';
import 'package:todo_app/pages/detail_page/detail_page.dart';
import 'package:todo_app/pages/home_page/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/pages/update_page/update_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Motion Notes',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home_page',
      theme: _buildTheme(),
      getPages: [
        GetPage(
          name: '/home_page',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/create_page',
          page: () => const CreatePage(),
        ),
        GetPage(name: '/detail_page', page: () => const DetailPage()),
        GetPage(name: '/update_page', page: () => const UpdatePage()),
      ],
    );
  }
}

ThemeData _buildTheme() {
  var baseTheme = ThemeData(brightness: Brightness.light);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
  );
}
