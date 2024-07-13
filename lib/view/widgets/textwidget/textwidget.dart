import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget {
  text({data, size, weight, color}) {
    return Text(
      data,
      style:
          GoogleFonts.poppins(fontSize: size, fontWeight: weight, color: color),
      overflow: TextOverflow.ellipsis,
    );
  }
}
