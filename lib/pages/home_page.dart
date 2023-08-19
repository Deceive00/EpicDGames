// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/pages/game_list_page.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/pages/game_detail_page.dart';

class HomePage extends StatefulWidget {

  String username;
  
  HomePage({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  List<Game> popularList = Game.gameList.where((game) => game.category.contains("Most Popular")).toList();
  List<Game> freeGameList = Game.gameList.where((game) => game.category.contains("Free Games")).toList();
  

  final eventList = [
    '../assets/event/event1.png',
    '../assets/event/event2.png',
    '../assets/event/event3.png',
    '../assets/event/event4.png',
    '../assets/event/event5.png',
    '../assets/event/event6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider.builder(
              itemCount: eventList.length, 
              options: CarouselOptions(
                height: 400,
                initialPage: 0,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.7,
                enableInfiniteScroll: false,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                autoPlayInterval: const Duration(seconds: 3),
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              itemBuilder: (context, index, reallIndex){
                final image = eventList[index];
                return setImage(image, index);
              }, 
            ),
            const SizedBox(height: 20,),
            Center(child: buildEventIndicator()),
            const SizedBox(height: 60,),
            titleWidget("Most Popular"),
            const SizedBox(height: 20,),
            CarouselSlider.builder(
              
              itemCount: popularList.length, 
              options: CarouselOptions(
                height: 490,
                initialPage: 0,
                enableInfiniteScroll: false
              ),

              itemBuilder: (content, index, realIndex){
                Game game = popularList[index];
                return GestureDetector(
                  onTap: () {
                     Navigator.push(context, 
                      MaterialPageRoute(builder: (context) {
                        return GameDetailPage(username: widget.username, index: index, game: game);
                      },
                    ));
              
                  },
                  child: setGameContainer(game, popularList[index].image, 330, 280, 350)
                );
              }, 
            ),
            const SizedBox(height: 40,),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).unselectedWidgetColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  titleWidget("Free Games"),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
            Container(
              color: Theme.of(context).unselectedWidgetColor,
              height: 300,
              child: CarouselSlider.builder(
                
                itemCount: freeGameList.length, 
                options: CarouselOptions(
                  height: 300,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  aspectRatio: 0.3
                ),
            
                itemBuilder: (content, index, realIndex){
                  Game game = freeGameList[index];
                  return GestureDetector(
                    onTap: () {
                       Navigator.push(context, 
                        MaterialPageRoute(builder: (context) {
                          return GameDetailPage(username: widget.username, index: index, game: game);
                        },
                      ));
                
                    },
                    child: setGameContainer(game, freeGameList[index].detailImage[0], 400, MediaQuery.of(context).size.width - 80, MediaQuery.of(context).size.height/4 - 40)
                  );
                }, 
              ),
            ),
            const SizedBox(height: 40,),
            titleWidget("Know More About Epic Games"),
            const SizedBox(height: 30,),

            Container(
              padding:const EdgeInsets.only(left: 53, right: 53),
              child: Column(
                children: [
                  Image.asset(
                    "../assets/home/developer.jpeg",
                    fit: BoxFit.cover,
                    width: 300,
                    height: 300,
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                    "Epic Games, founded in 1991 by CEO Tim Sweeney, is a prominent American company known for interactive entertainment and advanced 3D engine technology. With headquarters in Cary, North Carolina, and over 40 global offices, Epic is a major player in the industry. Their flagship game, Fortnite, boasts more than 350 million accounts and 2.5 billion connections. Additionally, Epic is the creator of Unreal Engine, a versatile technology used not only in gaming but also in film, architecture, automotive, and more. They offer a comprehensive digital ecosystem for developers through Unreal Engine, Epic Games Store, and Epic Online Services, facilitating content creation, distribution, and operation.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: "BrutalTypeLight",
                      letterSpacing: 1,
                      
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30,),
                  // Image.network("https://cdn2.unrealengine.com/epic-games-store2022-year-in-review-data-infographic-1920x7288-edc6ac2f0a7b.png"),
                  const SizedBox(height: 30,),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
  Widget setGameContainer(Game game, String image, double containerWidth, double imageWidth, double imageHeight){
    final currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'IDR ');
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.transparent,
      width: containerWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            
            child: Image.network(
              image,
              fit: BoxFit.fill,
              width: imageWidth,
              height: imageHeight,
              loadingBuilder: (context, child, loadingProgress) {
                  return loadingProgress == null ? child : const Center(child:CircularProgressIndicator(),);
              }
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
            game.price == 0 ? "Free" : currencyFormatter.format(game.price),
            style: const TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 16,
              fontFamily: "BrutalTypeLight",
              
            ),  
          ),

        ],
      ),
    );
  }
  Widget setImage(String image, int index){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      )
    );
  }
  Widget titleWidget(String title){
    return  Padding(
      padding: const EdgeInsets.only(left:53.0),
      child:
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(width: 10), 
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                  return GameListPage(username: widget.username);
                }), (route) => false);
              },
              child: Icon(Icons.arrow_circle_right, color: Theme.of(context).colorScheme.primary)
            ), 
          ],
        )
    );
  }
  Widget buildEventIndicator(){
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex, 
      count: eventList.length,
      effect: const SlideEffect(
        activeDotColor:  Colors.blue,
        dotWidth: 5,
        dotHeight: 5

      ),
    );
  }
}