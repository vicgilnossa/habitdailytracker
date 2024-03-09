import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static final TextStyle h1 = GoogleFonts.pressStart2p(
    fontSize: 24,
    color: Colors.black,
    shadows: [
      Shadow(
        color: Colors.yellow.withOpacity(0.5),
        offset: Offset(0, 4),
      ),
      Shadow(
        color: Colors.purple.withOpacity(0.5),
        offset: Offset(0, 2),
      ),
    ],
  );
  static final TextStyle h2 = GoogleFonts.pressStart2p(
    fontSize: 16,
    color: Colors.black,
  );
  static final TextStyle h3 = GoogleFonts.pressStart2p(
    fontSize: 14,
    color: Colors.black,
  );
  static final TextStyle h4 = GoogleFonts.pressStart2p(
    fontSize: 13,
    color: Colors.black.withOpacity(0.6),
  );
  static final TextStyle h5 = GoogleFonts.pressStart2p(
    
    fontSize: 12,
    color: Colors.black,
  );

  static final TextStyle p = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}
