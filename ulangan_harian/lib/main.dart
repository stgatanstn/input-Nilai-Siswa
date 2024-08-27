import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(NilaiSiswaApp());
}

class NilaiSiswaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Penilaian Siswa',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor:
            Colors.white, // Warna latar belakang untuk light mode
      ),
      home: HomePage(),
    );
  }
}
