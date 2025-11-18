import 'package:flutter/material.dart';
import 'package:tugas_pertemuan9/home_page.dart';
import 'package:tugas_pertemuan9/about_page.dart';
import 'package:tugas_pertemuan9/login_page.dart';
import 'package:tugas_pertemuan9/register_page.dart';
import 'package:tugas_pertemuan9/form_data.dart';
import 'package:tugas_pertemuan9/tampil_data.dart';
import 'package:tugas_pertemuan9/profile_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes => {
    '/': (context) => const LoginPage(),
    '/home': (context) => const HomePage(),
    '/about': (context) => const AboutPage(),
    '/register': (context) => const RegisterPage(),
    '/form': (context) => const FormData(),
    '/profile': (context) => const ProfilePage(),
  };

  static void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  static void navigateToWithReplacement(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  static void navigateToTampilData(BuildContext context, 
      {required String nama, required String nim, required int tahunLahir}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TampilData(
          nama: nama,
          nim: nim,
          tahunLahir: tahunLahir,
        ),
      ),
    );
  }
}