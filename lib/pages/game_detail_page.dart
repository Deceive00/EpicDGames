// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_project/custom_colors.dart';
import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/models/game_rating_model.dart';

class GameDetailPage extends StatefulWidget {
  final String username;
  final Game game;
  final int index;
  const GameDetailPage({
    Key? key,
    required this.username,
    required this.game,
    required this.index,
  }) : super(key: key);


  @override
  State<GameDetailPage> createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {
  int detailImageIndex = 0;
  int userRating = 0;
  TextEditingController ratingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:  Text(
            "DETAILS",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary
            ),
          ),
          backgroundColor: Theme.of(context).unselectedWidgetColor,
          
        ),
        body: Column(
          children: [
            const TabBar(
              
              tabs: [
                Tab(
                  icon: Icon(Icons.storage_outlined),
                ),
                Tab(
                  icon: Icon(Icons.star),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  firstPage(screenWidth, screenHeight),
                  secondPage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget ratingStar(int rating){
    double starSize = 18;
    Color fillColor = Colors.yellow;
    Color emptyColor = Theme.of(context).focusColor;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating) {
          return Icon(
            Icons.star,
            size: starSize,
            color: fillColor,
          );
        } else {
          return Icon(
            Icons.star_border,
            size: starSize,
            color: emptyColor,
          );
        }
      }),
    );

  }
  Widget firstPage(double screenWidth, double screenHeight){
    final currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'IDR ');
    int rating = widget.game.rating;
    double formattedRating = rating.toDouble();

    String status;
    if(widget.game.price == -1){
      status = "COMING SOON";
    }
    else if(widget.game.price == 0){
      status = "GET";
    }
    else{
      status = "BUY NOW";
    }

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Text(
              widget.game.title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                ratingStar(rating),
                const SizedBox(width: 7,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal:7, vertical: 4),
                  color: CustomColors.loginFillColor,
                  child: Text(
                    formattedRating.toStringAsFixed(1),
                    style:  const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                widget.game.detailImage[0],
                height: screenHeight/4,
                width: screenWidth-40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: 
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal:13, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: CustomColors.loginFillColor,
                      ),
                      child: Text(
                        "BASE GAME",
                        style: const TextStyle(
                          fontSize: 10,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Text(
                      () {
                        if(widget.game.price == -1){
                          return "Available ${widget.game.releaseDate}";
                        }
                        else if(widget.game.price == 0){
                          return "Free";
                        }
                        else{
                          return currencyFormatter.format(widget.game.price);
                        }
                      }(),
                        style:const TextStyle(
                          fontWeight: FontWeight.bold
    
                        ),     
                    )
                  ],
                ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: screenWidth-40,
              height: 40,
              child: 
              (){
                if(status == "Coming Soon"){
                  return OutlinedButton(
                    onPressed: () {
                      
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: Text(
                      status,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: CustomColors.white,
                        letterSpacing: 1
                      ),
                    ),
                  );
                }
                else{
                  return ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 33, 93, 243),
                    ),
                    child: Text(
                      status,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: CustomColors.white,
                        letterSpacing: 1
                      ),
                    ),
                  );
                }
              }()
              
            ),
            
            const SizedBox(height: 20,),
            outlineButton(screenWidth-40, 33, "ADD TO WISHLIST", Icons.add_circle_outline,10),
            const SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.game.refundType == '-' ? const SizedBox(height: 0,) : rowInformation("Refund Type", widget.game.refundType),
                const SizedBox(height: 10,),
                line(screenWidth),
                const SizedBox(height: 10,),
                rowInformation("Developer", widget.game.developer),
                const SizedBox(height: 10,),
                line(screenWidth),
                const SizedBox(height: 10,),
                rowInformation("Release Date", widget.game.releaseDate),
                const SizedBox(height: 10,),
                line(screenWidth),
                const SizedBox(height: 10,),
                rowInformation("Initial Release", widget.game.initialRelease),
                const SizedBox(height: 10,),
                line(screenWidth),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const Expanded(
                      child:  Text(
                        "Platform",
                        style: TextStyle(
                          color: Color.fromARGB(255, 155, 155, 155),
                        ),
                      ),
                    ),
                   ...List<Widget>.generate(
                    widget.game.platform.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: widget.game.platform[index] == "Windows" ? const Icon(Icons.laptop_windows) : Icon(Icons.apple),
                    ),
                   )
                                
                  ],
                ),
                const SizedBox(height: 10,),
                line(screenWidth),
                const SizedBox(height: 40,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                outlineButton(screenWidth / 2 - 30, 40, "SHARE", Icons.share,14),
                outlineButton(screenWidth / 2 - 30, 40, "REPORT", Icons.report,14),
              ],
            ),
            const SizedBox(height: 40,),
            detailImageSlider(widget.game.detailImage),
            const SizedBox(height: 40,),
            Text(
              widget.game.description,
            ),
            const SizedBox(height: 40,),
            genreAndFeatureContainer(screenWidth),
            const SizedBox(height: 40,),
            ratingSection(screenWidth),
          ],
        ),
      ),
    );
  }

  Widget ratingSection(double screenWidth){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "RATE THIS GAME",
          style: TextStyle(
            fontWeight: FontWeight.w900
          ),
        ),
        const SizedBox(height: 8,),
        const Text(
          "Tell others what you think",
          style: TextStyle(
            fontSize: 13
          ),
        ),
        const SizedBox(height: 20,),
        Center(child: starRating()),
        const SizedBox(height: 20,),
        TextField(
          controller: ratingController,
          decoration: const InputDecoration(
            hintText: "Describe Your Experience",
             border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                
              )
             )
          ),
        ),
        const SizedBox(height: 13,),
        SizedBox(
          width: screenWidth - 40,
          height: 35,
          child: ElevatedButton(
            onPressed: () {
              handleReview();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColors.loginFillColor,
            ),
            child: const Text(
              "POST",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: CustomColors.white,
                letterSpacing: 1
              ),
            ),
          ),
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
  
  void handleReview(){
    String ratingDescription = ratingController.text;
    String errorMsg = "";
    if(userRating == 0){
      errorMsg = "Please rate the game by clicking the stars";
    }
    else if(ratingDescription.isEmpty){
      errorMsg = "Please enter your rating description";
    }

    if(errorMsg.isNotEmpty){
      SnackBar snackbar = SnackBar(content: Text(errorMsg), duration:const Duration(seconds: 2),);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    else{
      SnackBar snackbar = const SnackBar(content: Text("Rate succesfully posted"), duration:Duration(seconds: 2),);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      GameRatingModel newRating = GameRatingModel(
        username: widget.username, 
        rating: userRating, 
        comment: ratingDescription, 
        timeStamp: DateTime.now()
      );
      print(Game.gameList[widget.index].ratingInformation);
      setState(() {
        Game.gameList[widget.index].ratingInformation.add(newRating);
        userRating = 0;
        ratingController.clear();
      });
      print(Game.gameList[widget.index].ratingInformation);
    }
    
  }

  void updateRating(int rate){
      setState(() {
      userRating = rate;
    });
  }

  Widget starRating() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () => updateRating(index + 1),
          child: index < userRating ? 
            const Icon(Icons.star, color: Colors.yellow,size: 40,) : 
            const Icon(Icons.star_outline,color: Color.fromARGB(153, 146, 146, 146), size: 40,)
        );
      }),
    );
  }
  Widget genreAndFeatureContainer(double screenWidth){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          height: 60,
          width: 0.3,
          color: const Color.fromARGB(153, 146, 146, 146),
        ),
        SizedBox(
          width: screenWidth / 2 - 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Genres", style: TextStyle(color: Colors.grey),),
              Text(widget.game.genres)
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 5),
          height: 60,
          width: 0.3,
          color: const Color.fromARGB(153, 146, 146, 146),
        ),
        SizedBox(
          width: screenWidth / 2 - 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Features", style: TextStyle(color: Colors.grey),),
              Text(widget.game.features)
            ],
          ),
        ),
      ],
    );
  }
  Widget detailImageSlider(List<String> imageList){
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200, 
            autoPlay: true, 
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            initialPage: detailImageIndex,
          ),
          items: imageList.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget rowInformation(String topic, String value){
    return Row(
      children: [
        Expanded(
          child:  Text(
            topic,
            style: const TextStyle(
              color: Color.fromARGB(255, 155, 155, 155),
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary
          ),
        
        ),
        
      ],
    );
  }

  Widget line(double screenWidth){
    return Container(
      height: 0.3,
      width: screenWidth-40,
      color:const Color.fromARGB(153, 115, 115, 115),
    );
  }

  Widget secondPage(){
    List<GameRatingModel> ratingInformation = widget.game.ratingInformation;

    if(ratingInformation.isEmpty){
      return Center(
        child: Text(
          "THERE IS NO RATING YET",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 20
          ),
        ),
      );
    }
    else{
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(ratingInformation.length, (index) {
            DateTime dateTime = ratingInformation[index].timeStamp;
            String formattedDate = DateFormat.yMd().format(dateTime);
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  color: Theme.of(context).unselectedWidgetColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(widget.game.ratingInformation[index].username),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          ratingStar(ratingInformation[index].rating),
                          const SizedBox(width: 7,),
                          Text(
                            formattedDate,
                            style: const TextStyle(
                              fontSize: 12
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        ratingInformation[index].comment,
                        style: const TextStyle(
                          color:  Color.fromARGB(153, 146, 146, 146)
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            );
          } 
          ),
        ),
      );

    }
      
    
  }

  Widget outlineButton(double buttonWidth, double buttonHeight, String text, IconData icon, double size){
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: OutlinedButton(
        onPressed: () {
          
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Icon(
              icon, 
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 8), 
            Text(
              text,
              style: TextStyle(
                fontSize: size,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.primary,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}