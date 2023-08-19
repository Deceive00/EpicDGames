import 'package:flutter/material.dart';
import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/pages/game_detail_page.dart';
import 'package:intl/intl.dart';
import 'dart:core';

class GameListPage extends StatefulWidget {
  String username;
  GameListPage({super.key, required this.username});

  @override
  State<GameListPage> createState() => _GameListPageState();
}

class _GameListPageState extends State<GameListPage> {
  
  List<String> categories = [
    "All",
    "Most Popular",
    "New Release",
    "Coming Soon",
    "Free Games",
    "Price: Low To High",
  ];
  int categoryIndex = 0;
  List<Game> gameListFiltered = Game.gameList;
  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'IDR ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),
        const Center(
          child: Text(
            "STORE",
            style: TextStyle(
              
              fontSize: 20,
              letterSpacing: 1
            )
          ),
        ),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            height: 27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index){
                return categoryList(index);
              }
            ),
          ),
        ),
        const SizedBox(height: 20,),
        gameListGrid(currencyFormatter)
      ],
    );
  }

  Expanded gameListGrid(NumberFormat currencyFormatter) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: gameListFiltered.isNotEmpty,
              replacement: const Text("Kosong"),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.45,
                  crossAxisSpacing: 10,
                ), 
                itemCount: gameListFiltered.length,
                itemBuilder: (context,index){
                  
                  return getGameCard(
                    currencyFormatter,
                    gameListFiltered[index], 
                    () => Navigator.push(context, 
                        MaterialPageRoute(builder: (context) {
                          return GameDetailPage(username: widget.username, index: index, game: gameListFiltered[index]);
                        },
                      )
                    )
                  );
                }
              ),
            ),
          ),
        ),
      );
  }

  Widget getGameCard(NumberFormat currencyFormatter, Game game, VoidCallback press) {
    return GestureDetector(
      onTap: press,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                game.image,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 11,),
          const Text(
            "Base Game",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            
            ),  
          ),
          const SizedBox(height: 11,),
          Text(
            game.title,
            style: const TextStyle(
              
              fontSize: 16,
            ),  
          ),
          const SizedBox(height: 18,),
          Text(
            () {
              if(game.price == -1){
                return "Available ${game.releaseDate}";
              }
              else if(game.price == 0){
                return "Free";
              }
              else{
                return currencyFormatter.format(game.price);
              }
            }(),
            style: const TextStyle(
              
              fontWeight: FontWeight.w100,
              fontSize: 16,
              
            ),  
          ),
          ],
        ),
    );
  }

  Widget categoryList(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          categoryIndex = index;
          gameListFiltered = Game.gameList.where((game) => game.category.contains(categories[index])).toList();
          if(index == 0){
            gameListFiltered = Game.gameList;
          }
          else if(categories[index] == "Price: Low To High"){
            gameListFiltered = Game.gameList;
            gameListFiltered.sort((a, b) => a.price.compareTo(b.price));
          }
          else if(categories[index] == "Price: High To Low"){
            gameListFiltered = Game.gameList;
            gameListFiltered.sort((a, b) => b.price.compareTo(a.price));
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(
              categories[index],
              style: TextStyle(
                color: categoryIndex == index ? Theme.of(context).focusColor : Colors.grey,
              ),
    
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(top: 5),
              height: 2,
              width: 30,
              color: categoryIndex == index ? Theme.of(context).focusColor : Colors.transparent,
              curve: accelerateEasing,
            ),
            
            
          ],
        ),
      ),
    );
  }
}