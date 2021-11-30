// import 'package:fap/model/User.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:fap/providers/theme_provide.dart';
//
// class ChangeThemeButtonWidget extends StatefulWidget {
//   @override
//   ChangeThemeButtonWidget({required Key key, required this.function}) : super(key: key);
//   Function function;
//   State<ChangeThemeButtonWidget> createState() => ChangeThemeButtonWidgetState();
//
// }
//
// class ChangeThemeButtonWidgetState extends State<ChangeThemeButtonWidget> {
//   IconData icon = CupertinoIcons.moon_stars;
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//
//     //final icon2 = CupertinoIcons.sun_max;
//
//
//     // return Switch.adaptive(
//     //   value: themeProvider.isDarkMode,
//     //   onChanged: (value) {
//     //     final provider = Provider.of<ThemeProvider>(context, listen: false);
//     //     provider.toggleTheme(value);
//     //     User.isDarkMode = value;
//     //   },
//     // );
//
//     return IconButton(
//       icon: Icon(icon),
//       iconSize: 30,
//       color: Color(0xff7D79F2),
//       onPressed: () {
//
//         User.isDarkMode = !User.isDarkMode!;
//         final provider = Provider.of<ThemeProvider>(context, listen: false);
//         provider.toggleTheme(User.isDarkMode!);
//
//         setState(() {
//           if(!User.isDarkMode!){
//             icon = CupertinoIcons.sun_max;
//             print('sun');
//           }else{
//             icon = CupertinoIcons.moon_stars;
//             print('moon');
//           }
//           widget.function();
//           print(User.isDarkMode!);
//         });
//
//       },
//     );
//   }
// }
