// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/pages/game_detail_page.dart';

class SearchPage extends StatefulWidget {
  String username;
  SearchPage({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}


class _SearchPageState extends State<SearchPage> {

  String userSearch = "";
  List<Game> get filteredData {
    return Game.gameList.where((item) => item.title.toLowerCase().contains(userSearch.toLowerCase())).toList();
  }

  late TextEditingController searchController; 
  
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController(); 
  }

  @override
  void dispose() {
    searchController.dispose(); 
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    final currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'IDR ');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).unselectedWidgetColor,
        toolbarHeight: 90,
        title: Row(
          children: [
            Flexible(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).primaryColor,
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  hintStyle: const TextStyle(
                    color:  Color.fromARGB(180, 83, 83, 83)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Theme.of(context).dividerColor),
                  ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      userSearch = '';
                      FocusScope.of(context).unfocus(); 
                      
                    });
                    searchController.clear();
                  },
                  
                  child: const Icon(Icons.close_outlined),
                ),
                ),
                onChanged: (value){
                  setState(() {
                    userSearch = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      body: gameListGrid(currencyFormatter),
      
    );
  }

    Widget gameListGrid(NumberFormat currencyFormatter) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Align(
        alignment: Alignment.center,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.45,
            crossAxisSpacing: 10,
          ), 
          itemCount: filteredData.length,
          itemBuilder: (context,index){
            
            return getGameCard(
              currencyFormatter,
              filteredData[index], 
              () => Navigator.push(context, 
                  MaterialPageRoute(builder: (context) {
                    return GameDetailPage(username: widget.username, index: index, game: filteredData[index]);
                  },
                )
              )
            );
          }
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
}