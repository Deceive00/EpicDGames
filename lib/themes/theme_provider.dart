import 'package:flutter/material.dart';
import 'package:flutter_project/custom_colors.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool value){
    themeMode = value ? ThemeMode.dark : ThemeMode.light;
    print(themeMode);
    notifyListeners();
  }
}

class MyThemes {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: CustomColors.blue,
    scaffoldBackgroundColor: CustomColors.navigationColor,
    primaryColor: CustomColors.navigationColor,
    focusColor: Colors.white,
    colorScheme:  const ColorScheme.dark(
      primary: CustomColors.white,
      
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.3,
        color: Colors.white, 
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
        color: CustomColors.navigationColor,
    ),
    unselectedWidgetColor: CustomColors.loginFillColor,
    tabBarTheme: const TabBarTheme(
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: CustomColors.blue, // Color of the indicator
            width: 2.0, // Specify the width of the bottom border
          ),
        ),
      ),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: CustomColors.blue,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    focusColor: Colors.black,
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.3,
        color: Colors.black, 
      ),
    ),
    unselectedWidgetColor: const Color.fromARGB(156, 222, 222, 222),
    tabBarTheme: const TabBarTheme(
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: CustomColors.blue, // Color of the indicator
            width: 2.0, // Specify the width of the bottom border
          ),
        ),
      ),
    ),
    
  );
}
