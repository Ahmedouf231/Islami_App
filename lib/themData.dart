import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
class MyThemeDate { 

 static final ThemeData lightTheme = ThemeData(                                      
      scaffoldBackgroundColor: Colors.transparent, 
      appBarTheme: AppBarTheme(   
        backgroundColor: Colors.transparent,
        centerTitle: true, 
        iconTheme:IconThemeData(
          color: AppColors.blackColor
        )
      ) ,
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 30 , fontWeight: FontWeight.bold , 
          color: Colors.black , ) , 
          bodyMedium: TextStyle(
            fontSize: 25 , 
            fontWeight: FontWeight.w600
          ) , 
          bodySmall: TextStyle(
            fontSize: 20 , 
            fontWeight: FontWeight.bold
          )
      ) , 
      primaryColor:  AppColors.primaryLightColor,
      //canvasColor: AppColors.primaryLightColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData( 
        backgroundColor:const Color.fromARGB(255, 112, 109, 104) ,
        selectedItemColor: AppColors.blackColor , 
        unselectedItemColor: AppColors.WhiteColor , 
        showSelectedLabels: true, 

      ) 
      );  
      static final ThemeData darkTheme = ThemeData(      
       // canvasColor: AppColors.primaryDarkColor,                                
      scaffoldBackgroundColor: Colors.transparent, 
      appBarTheme: AppBarTheme(   
        backgroundColor: Colors.transparent,
        centerTitle: true, 
          iconTheme: IconThemeData(
        color: AppColors.WhiteColor ,
        
      )
      ) ,
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 30 , fontWeight: FontWeight.bold , 
          color: AppColors.WhiteColor , ) , 
          bodyMedium: TextStyle(
            fontSize: 25 , 
            fontWeight: FontWeight.w600 ,
            color: AppColors.WhiteColor
          ) , 
          bodySmall: TextStyle(
            fontSize: 20 , 
            fontWeight: FontWeight.bold ,
            color: AppColors.WhiteColor
          )
      ) , 
      primaryColor:  AppColors.primaryDarkColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryDarkColor,
        selectedItemColor: AppColors.yellowColor , 
        unselectedItemColor: AppColors.WhiteColor , 
        showSelectedLabels: true,
      ), 
      );
}
