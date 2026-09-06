import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App-wide text styles built on the Poppins Google Font.
/// Usage: Text('GameVerse', style: AppFonts.title)
class AppFonts {
  static TextStyle title = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle subtitle = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white70,
  );

  static TextStyle body = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.white70,
  );

  static TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle cardTitle = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle cardSubtitle = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.white70,
  );
}
