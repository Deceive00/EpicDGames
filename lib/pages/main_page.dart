import 'package:flutter/material.dart';
import 'package:flutter_project/custom_colors.dart';
import 'package:flutter_project/pages/game_list_page.dart';
import 'package:flutter_project/pages/home_page.dart';
import 'package:flutter_project/pages/login_page.dart';
import 'package:flutter_project/pages/search_page.dart';
import 'package:flutter_project/themes/theme_provider.dart';
import 'package:provider/provider.dart';
class MainPage extends StatefulWidget {

  late String username;
  MainPage({super.key, required this.username});

  
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late String usernamePass;
  
  int currentPage = 0;
  bool isDarkTheme = true;

  late List<Widget> pages;
  @override
  void initState() {
    super.initState();
    usernamePass = widget.username;
    pages = [
      HomePage(username: usernamePass,),
      GameListPage(username: usernamePass,)
    ];
  }
  String getGreeting(int hour) {
    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 18) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    String greeting = getGreeting(now.hour);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).unselectedWidgetColor,
        toolbarHeight: 90,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$greeting,", 
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18,
                      
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "${widget.username}!",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w900
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                // Navigator.pop(context);
                Navigator.push(context, 
                    MaterialPageRoute(builder: (context) {
                      return SearchPage(username: widget.username);
                    },
                  )
                );
              },
              child: Icon(Icons.search,color: Theme.of(context).colorScheme.primary,)
            ),
            const SizedBox(width: 13,),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(26),
                              topRight: Radius.circular(26),
                            )
                          ),
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            height: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    height: 2,
                                    width: 30,
                                    
                                  ),
                                ),
                                const SizedBox(height: 8,),
                                SwitchListTile.adaptive(
                                  title: const Text(
                                    "Dark theme",
                                    style: TextStyle(
                                      fontSize: 18
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  controlAffinity: ListTileControlAffinity.leading,
                                  value: themeProvider.isDarkMode,
                                  onChanged: (value) {
                                    setState(() {
                                      final provider = Provider.of<ThemeProvider>(context, listen: false);
                                      provider.toggleTheme(value);                                      
                                    },);

                                  },
                                )
                                ,
                                const SizedBox(height: 5,),
                                TextButton.icon(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                                      return const LoginPage();
                                    }), (route) => false);
                                  },
                                  icon: const Icon(Icons.logout, color: Colors.red,),
                                  label:const Row(
                                    children:[
                                      SizedBox(width: 30,),
                                      Text(
                                        
                                        "Log out of this account",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 18
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                              
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: Icon(Icons.settings, color: Theme.of(context).colorScheme.primary,),
            )

          ]
        ),
      ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).bottomAppBarTheme.color,
        unselectedItemColor: CustomColors.loginTextColor,
        selectedItemColor: Colors.blue,
        onTap :(value) {
          setState(() {
            currentPage = value;
          });
      },currentIndex: currentPage,
       items:const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled), 
          activeIcon: Icon(Icons.home_filled), 
          tooltip: "Home", 
          label: "Home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list), 
          activeIcon: Icon(Icons.list_alt_rounded), 
          tooltip: "Game", 
          label: "Game"
        ),

      ]),
    );
  }
}

