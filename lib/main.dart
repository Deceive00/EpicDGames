import 'package:flutter/material.dart';
import 'package:flutter_project/models/game.dart';
// import 'package:flutter_project/pages/game_detail_page.dart';
import 'package:flutter_project/pages/login_page.dart';
// import 'package:flutter_project/pages/main_page.dart';
// import 'package:flutter_project/pages/search_page.dart';
import 'package:flutter_project/themes/theme_provider.dart';
import 'package:provider/provider.dart';



void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Game.loadGames(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: "MyApp",
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            // theme: ThemeData(
            //   primarySwatch:Colors.blue ,
            //   scaffoldBackgroundColor: CustomColors.primarySwatch,
            //   fontFamily: "Inter",
            //   colorScheme: const ColorScheme.dark(
            //     primary: Colors.white
            //   ),
            //   textTheme: TextTheme(
            //     bodyMedium: TextStyle(
            //       fontSize: 16,
            //       fontWeight: FontWeight.w400,
            //       letterSpacing: 0.3,
            //       color: CustomColors.textColor, 
            //     ),
            //   )
            // ),
            home: const LoginPage(),
            // home: MainPage(username: "Riann"),
            // home: SearchPage(username: "Riann"),
            // home: GameDetailPage(username: "Riann", index:2,game: Game.gameList[2]),
          );
        },
      );
    
  }
  
}