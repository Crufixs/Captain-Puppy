import 'package:fap/model/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const firstColor = Color(0xff7D79F2); //darker purple
const secondColor = Color(0xff8D92F2); //lighter purple
const thirdColor = Color(0xffF2B366); //lighter orange
const fourthColor = Color(0xffF2865E); //darker orange
const fifthColor = Color(0xffF2F2F2); //white

const firstTransparentColor = Color(0x807D79F2); //darker purple
const secondTransparentColor = Color(0x808D92F2); //lighter purple
const thirdTransparentColor = Color(0x80F2B366); //lighter orange
const fourthTransparentColor = Color(0x80F2865E); //darker orange
const fifthTransparentColor = Color(0x80F2F2F2); //white

const pieChartColor1 = Color(0xff9BBFE0);
const pieChartColor2 = Color(0xffE8A09A);
const pieChartColor3 = Color(0xffFBE29F);
const pieChartColor4 = Color(0xffC6D68F);

const TextTitle = TextStyle(
  //fontFamily:
  fontSize: 50,
  fontWeight: FontWeight.bold,
);

const TextContent = TextStyle(
  //fontFamily:
  fontSize: 20,
);

const TextContentHeading1 = TextStyle(
  //fontFamily:
  fontSize: 30,
  fontWeight: FontWeight.bold,
);

const TextContentHeading2 = TextStyle(
  //fontFamily:
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

const TextContentNormal = TextStyle(
  //fontFamily:
  fontSize: 20,
  fontWeight: FontWeight.normal,
);

const Loading = SpinKitPouringHourGlassRefined(
  color: fourthColor,
  size: 100.0,
);
