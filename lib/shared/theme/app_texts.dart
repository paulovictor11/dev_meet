import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTexts {
  static titleText({
    required Color color,
    double size = 18,
  }) {
    return GoogleFonts.epilogue(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }
}
