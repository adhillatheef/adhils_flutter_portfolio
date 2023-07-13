import 'package:adhils_portfolio/desktop/desktop_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          displayMedium: GoogleFonts.montserrat(),
          headlineMedium: GoogleFonts.montserrat(),
            bodyMedium: GoogleFonts.montserrat(),
            bodySmall: GoogleFonts.montserrat(),
            headlineSmall: GoogleFonts.montserrat(),
        )
      ),
      home: const Portfolio(),
    );
  }
}
