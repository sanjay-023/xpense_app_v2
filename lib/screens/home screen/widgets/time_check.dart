import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

DateTime timeCheck = DateTime.now();
timecontrol() {
  if (timeCheck.hour >= 0 && timeCheck.hour < 12) {
    return Text(
      'Good Morning ',
      style: GoogleFonts.signika(textStyle: const TextStyle(fontSize: 22)),
    );
  } else if (timeCheck.hour >= 12 && timeCheck.hour < 16) {
    return Text(
      'Good Afternoon ',
      style: GoogleFonts.signika(textStyle: const TextStyle(fontSize: 24)),
    );
  } else {
    return Text(
      'Good Evening ',
      style: GoogleFonts.signika(textStyle: const TextStyle(fontSize: 24)),
    );
  }
}
