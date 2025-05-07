import 'package:flutter/material.dart';

class AppThemes {
  // Light Theme
  static ThemeData lightTheme = ThemeData(

    primaryColor: Color(0xFFE58411),

    scaffoldBackgroundColor: Colors.white,


      bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xffF8F8F8),
      unselectedItemColor: Color(0xffB6B6B6),
       selectedItemColor: Color(0xFFE58411),
        selectedLabelStyle: TextStyle(color: Color(0xFFE58411)),
        unselectedLabelStyle: TextStyle(color: Color(0xffB6B6B6)),
        selectedIconTheme:  IconThemeData(color: Color(0xFFE58411)),
        unselectedIconTheme: IconThemeData(color: Color(0xffB6B6B6)),
    ),

     

    dividerColor: Color(0xffD9D9D9),
    textTheme: TextTheme(
      headlineLarge: TextStyle(color: Colors.black),

      labelMedium: TextStyle(color: Colors.black54),

    ),

    iconTheme: IconThemeData(color: Color(0xFFE58411)),

     colorScheme: ColorScheme.light().copyWith(onPrimary: Colors.grey.shade100)

    // Add more customizations as needed
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(


    primaryColor: Color(0xFFE58411),

    scaffoldBackgroundColor: Colors.black,
    
    appBarTheme: AppBarTheme(
      elevation: 0,
    ),
    dividerColor: Color(0xff221506),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xff2A2A2A),

      unselectedItemColor: Colors.white,
    selectedItemColor: Color(0xFFE58411),
      selectedLabelStyle: TextStyle(color: Color(0xFFE58411)),
      unselectedLabelStyle: TextStyle(color: Colors.white),
      selectedIconTheme:  IconThemeData(color: Color(0xFFE58411)),
      unselectedIconTheme: IconThemeData(color: Colors.white),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
      iconColor: WidgetStateProperty.all(Color(0xff0B0C0C)),
        backgroundColor: WidgetStateProperty.all(Color(0xFFFFFFFF)),
    )),
    
    
    textTheme: TextTheme(
      headlineLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),

      bodyMedium: TextStyle(color: Colors.white,  fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),

        labelMedium: TextStyle(color: Colors.white)
    ),

      colorScheme: ColorScheme.light().copyWith(onPrimary: Color(0xff221506)),

      iconTheme: IconThemeData(color: Color(0xFFE58411)),
      iconButtonTheme: IconButtonThemeData(

        style: ButtonStyle(

            iconColor: WidgetStateProperty.all(Color(0xFFE58411))
        ),
      ),


    // Add more customizations as needed
  );
}
