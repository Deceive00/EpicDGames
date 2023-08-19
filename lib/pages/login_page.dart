import 'package:flutter/material.dart';
import 'package:flutter_project/custom_colors.dart';
import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/models/local_storage.dart';
import 'package:flutter_project/pages/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  bool isRemember = false;
  TextEditingController  usernameController = TextEditingController();
  TextEditingController  passwordController = TextEditingController();

  String? usernameError;
  String? passwordError;

  bool containsCapitalized(String input) {
    return input != input.toLowerCase();
  }

  void resetErrorMsg(){
    passwordError = null;
    usernameError = null;
  }

  void handleLogin(){
    resetErrorMsg();
    String username = usernameController.text;
    String password = passwordController.text;

    if(username.isEmpty){
      setState(() {
        usernameError = "Please enter your username!";
      });
      return;
    }

    if(password.isEmpty){
      setState(() {
        passwordError = "Please enter your password!";
      });
      return;
    }

    if(password.length < 8 || password.length > 30){
      setState(() {
        passwordError = "Password must be between 8 and 30 characters";
      });
      return;
    }

    if(!containsCapitalized(username)){
      setState(() {
        usernameError = "Username must have at least 1 capitalized character";
      });
      return;
    }

    showDialog(context: context, builder: (context){
      return AlertDialog(
        title:const Text("Success"),
        content:const Text("Login Success!"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
              return MainPage(username: username);
            }), (route) => false);
          }, child: const Text("OK", style: TextStyle(color:Colors.black),)),
          
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primarySwatch,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "../assets/logo.png",
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(height: 50,),
            const Text(
              "Sign in with an Epic Games account",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: usernameController,
              style: const TextStyle(
                color: Colors.white
                
              ),
              
              decoration: InputDecoration(
                hintText: "Username",
                hintStyle:  TextStyle(color: CustomColors.loginTextColor),
                labelText: "Username",
                errorText: usernameError,
                labelStyle: TextStyle(color: CustomColors.loginTextColor),
                filled: true,
                fillColor: CustomColors.loginFillColor,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: CustomColors.loginTextColor),

                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: CustomColors.white),
                ),

              ),
              
            ),
            const SizedBox(height: 15,),
            TextField(
              controller: passwordController,
              obscureText: true,
              style: const TextStyle(
                color: Colors.white
              ),
              decoration:  InputDecoration(
                hintText: "Password",
                hintStyle:  TextStyle(color: CustomColors.loginTextColor),
                labelText: "Password",
                errorText: passwordError,
                labelStyle:  TextStyle(color: CustomColors.loginTextColor),
                filled: true,
                fillColor: CustomColors.loginFillColor,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: CustomColors.loginTextColor),

                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: CustomColors.white),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)
                )
              ),
              
            ),
            const SizedBox(height: 5,),
            CheckboxListTile(
                value: isRemember, 
                contentPadding: EdgeInsets.zero,
                selectedTileColor: Colors.blue,
                
                title: Text(
                  "Remember me",
                  style: TextStyle(color: CustomColors.loginTextColor),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.black,
                onChanged: (value){
                  setState(() {
                    isRemember = value!;
                  });
                },
            ),
            const SizedBox(height: 20,),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: handleLogin, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        "LOG IN NOW",
                        style: TextStyle(
                          fontSize: 18,
                          color: CustomColors.white,
                          letterSpacing: 1
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Text(
                    "Privacy Policy",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: CustomColors.textColor,
                    ),
                  ),
                ],
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     saveLocal();
            //   },
            //   child: const Text('save Local Storage'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     loadLocal();
            //   },
            //   child: const Text('load Local Storage'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     viewLocalStorage();
            //   },
            //   child: const Text('view Local Storage'),
            // ),
          ],
        ),
      ),
    );
  }
}
  Future<void> saveLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    LocalStorage.saveGameList(Game.gameList);
    Set<String> keys = prefs.getKeys();
    print(keys.length);
    // Game.loadedGameList = await LocalStorage.loadGameList();
    // print(Game.loadedGameList);
    // for (String key in keys) {
    //   String? value = prefs.getString(key);
    //   print("$key: $value\n");
    // }
  }
  Future<void> loadLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    // LocalStorage.saveGameList(Game.gameList);
    print(Icons.abc_outlined.codePoint);
    Game.loadedGameList = await LocalStorage.loadGameList();
    print(Game.loadedGameList);

  }
  Future<void> viewLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    // LocalStorage.saveGameList(Game.gameList);
      Set<String> keys = prefs.getKeys();
    for (String key in keys) {
      String? value = prefs.getString(key);
      print("$key: $value\n");
    }
}

