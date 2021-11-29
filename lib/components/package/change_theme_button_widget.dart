import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fap/providers/theme_provide.dart';

class ChangeThemeButtonWidget extends StatelessWidget{
  Widget build(BuildContext context){
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value){
        final provider = Provider.of<ThemeProvider>(context, listen: false);
            provider.toggleTheme(value);
      },
    );
  }
}