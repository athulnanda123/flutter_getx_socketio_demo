import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

 SnackbarController pushSnack({required String t, required String d}) {
  return Get.snackbar(
    t,
    d,
    titleText: Text(t,
        style: getGTextStyle(fz: 15, fw: FontWeight.w700, c: Colors.white)),
    messageText: Text(d,
        style: getGTextStyle(fz: 14, fw: FontWeight.w500, c: Colors.white)),
    icon: Icon(Icons.person, color: Colors.white),
    snackPosition: SnackPosition.TOP,
  );
}
TextStyle getGTextStyle(
    {Color c = Colors.black,
    FontWeight fw = FontWeight.w400,
    double fz = 15,
    double h = 1}) {
  return GoogleFonts.ubuntu(
    textStyle: TextStyle(color: c, fontWeight: fw, fontSize: fz, height: h),
  );
}
