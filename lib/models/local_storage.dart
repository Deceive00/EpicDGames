import 'package:flutter_project/models/game.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalStorage {
  static Future<List<Game>> loadGameList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonData = prefs.getString('game_list') ?? '[]';

    List<dynamic> jsonList = json.decode(jsonData);
    List<Game> gameList = jsonList.map((json) => Game.fromJson(json as Map<String, dynamic>)).toList();
    
    return gameList;
  }

  static Future<void> saveGameList(List<Game> gameList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> jsonList = gameList.map((game) => game.toJson()).toList();

    String jsonData = json.encode(jsonList);
    prefs.setString('game_list', jsonData);
  }
}
