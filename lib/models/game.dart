// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_project/models/game_rating_model.dart';
import 'package:flutter_project/models/local_storage.dart';

class Game {
  String title;
  int price;
  String refundType;
  String image;
  String releaseDate;
  String initialRelease;
  List<String> platform;
  String developer;
  String description;
  String genres;
  String features;
  int rating;
  List<String> category;
  List<String> detailImage;
  List<GameRatingModel> ratingInformation;

  Game({
    required this.title,
    required this.price,
    required this.refundType,
    required this.image,
    required this.releaseDate,
    required this.initialRelease,
    required this.platform,
    required this.developer,
    required this.description,
    required this.genres,
    required this.features,
    required this.rating,
    required this.category,
    required this.detailImage,
    required this.ratingInformation
  });
  
  static List<Game> gameList = [
    Game(
      title: "Fix Me Up Doc!", 
      price: 21000, 
      refundType: "Self-Refundable",
      image: "https://cdn1.epicgames.com/spt-assets/388f6f4a4cb446acba8ad516557a3c8e/fix-me-up-doc--dark-humor-19qqm.jpg?h=480&quality=medium&resize=1&w=360",
      releaseDate: "08/12/23", 
      initialRelease: "07/12/23", 
      platform: [
        "Windows", "Mac"
      ], 
      developer: "Atomic Fabrik",
      description: "!!!No rugby players were harmed during the game development!!!\nPrepare your popcorn and play the funniest game you've ever played!", 
      genres: "Comedy, Indie, Simulation", 
      features: "Controller, Support, Single Player",
      rating: 4,
      category: ["Most Popular", "New Release"],
      detailImage: [
        "https://cdn1.epicgames.com/spt-assets/388f6f4a4cb446acba8ad516557a3c8e/fix-me-up-doc--dark-humor-kesvy.jpg?h=270&quality=medium&resize=1&w=480"
      ],
      ratingInformation: [],

    ),
    Game(
      title: "Grand Theft Auto V", 
      price: 300750, 
      refundType: "Self-Refundable",
      image: "https://cdn1.epicgames.com/0584d2013f0149a791e7b9bad0eec102/offer/GTAV_EGS_Artwork_1200x1600_Portrait%20Store%20Banner-1200x1600-382243057711adf80322ed2aeea42191.jpg?h=480&quality=medium&resize=1&w=360",
      releaseDate: "05/14/20", 
      initialRelease: "01/14/20", 
      platform: [
        "Windows"
      ], 
      developer: "Rockstar Games",
      description: "The Grand Theft Auto V: Premium Edition includes the complete GTAV story, Grand Theft Auto Online and all existing gameplay upgrades and content. You’ll also get the Criminal Enterprise Starter Pack, the fastest way to jumpstart your criminal empire in GTA Online.", 
      genres: "Action, Adventure", 
      features: "Competitive",
      rating: 5,
      category: ["Most Popular"],
      detailImage: [
        "https://cdn2.unrealengine.com/Diesel%2Fproductv2%2Fgrand-theft-auto-v%2Fhome%2FGTAV_EGS_Artwork_1920x1080_Hero-Carousel_V06-1920x1080-1503e4b1320d5652dd4f57466c8bcb79424b3fc0.jpg"
      ],
      ratingInformation: [],

    ),
    Game(
      title: "VALORANT", 
      price: 0, 
      refundType: "-",
      image: "https://cdn1.epicgames.com/offer/cbd5b3d310a54b12bf3fe8c41994174f/EGS_VALORANT_RiotGames_S2_1200x1600-b911781672bac23a556586fb92c42983?h=480&quality=medium&resize=1&w=360",
      releaseDate: "06/03/20", 
      initialRelease: "06/03/19", 
      platform: [
        "Windows"
      ], 
      developer: "Riot Games",
      description: "VALORANT is a character-based 5v5 tactical shooter set on the global stage. Outwit, outplay, and outshine your competition with tactical abilities, precise gunplay, and adaptive teamwork.",
      genres: "Action, Shooter", 
      features: "Competitive, Multiplayer",
      rating: 5,
      category: ["Most Popular", "Free Games"],
      detailImage: [
        "https://cdn1.epicgames.com/offer/cbd5b3d310a54b12bf3fe8c41994174f/EGS_VALORANT_RiotGames_S1_2560x1440-91dc9490f14942ad5eeef278eb3ef4a6?h=270&quality=medium&resize=1&w=480",
        "https://cdn2.unrealengine.com/egs-valorant-riotgames-g1a-02-1920x1080-580683fffe0f.jpg",
        "https://cdn2.unrealengine.com/egs-valorant-riotgames-g1a-03-1920x1080-f34bc7b4f1b5.jpg",
        "https://cdn2.unrealengine.com/egs-valorant-riotgames-g1a-04-1920x1080-b9b0e57a12be.jpg",
        "https://cdn2.unrealengine.com/egs-valorant-riotgames-g1a-06-1920x1080-c525ac170f37.jpg",
        "https://cdn2.unrealengine.com/egs-valorant-riotgames-g1a-08-1920x1080-a5e711aeae90.jpg",
      ],
      ratingInformation: [
        GameRatingModel(
          username: "Deceive", 
          rating: 5, 
          comment: "This game is fantastic! With intense gunplay and transformative agent abilities, Valorant is an exceptional FPS that everyone should try.", 
          timeStamp: DateTime(2020,12,30)
        )
      ],

    ),
    Game(
      title: "EA SPORTS™ FIFA 23 Standard Edition", 
      price: 759000, 
      refundType: "Self-Refundable",
      image: "https://cdn1.epicgames.com/offer/f5deacee017b4b109476933f7dd2edbd/EGS_EASPORTSFIFA23StandardEdition_EACanada_S2_1200x1600-c806355d9cc8b35ebe392f2a7db03075?h=480&quality=medium&resize=1&w=360",
      releaseDate: "09/30/22", 
      initialRelease: "01/30/22", 
      platform: [
        "Windows"
      ], 
      developer: "EA Canada",
      description: "FIFA 23 brings The World’s Game to the pitch, with HyperMotion2 Technology, men’s and women’s FIFA World Cup™ coming during the season, women’s club teams, cross-play features*, and more.",
      genres: "Simulation", 
      features: "Competitive",
      rating: 4,
      category: ["Most Popular"],
      detailImage: [
        "https://cdn1.epicgames.com/offer/f5deacee017b4b109476933f7dd2edbd/EGS_EASPORTSFIFA23StandardEdition_EACanada_S1_2560x1440-aaf9c5273c27a485f2cce8cb7e804f5c?h=270&quality=medium&resize=1&w=480",
        "https://cdn2.unrealengine.com/egs-easportsfifa23standardedition-eacanada-g1a-01-1920x1080-d332a2aa3416.jpg",
        "https://cdn2.unrealengine.com/egs-easportsfifa23standardedition-eacanada-g1a-02-1920x1080-7c0a1ea98d96.jpg",
        "https://cdn2.unrealengine.com/egs-easportsfifa23standardedition-eacanada-g1a-03-1920x1080-61d55aaec991.jpg",
        "https://cdn2.unrealengine.com/egs-easportsfifa23standardedition-eacanada-g1a-04-1920x1080-65c487093baf.jpg",
        "https://cdn2.unrealengine.com/egs-easportsfifa23standardedition-eacanada-g1a-05-1920x1080-7de2acdb5abf.jpg",
        "https://cdn2.unrealengine.com/egs-easportsfifa23standardedition-eacanada-g1a-06-1920x1080-d0535e5e7f82.jpg",

      ],
      ratingInformation: [],

    ),
    Game(
      title: "Red Dead Redemption 2", 
      price: 640000, 
      refundType: "Self-Refundable",
      image: "https://cdn1.epicgames.com/epic/offer/RDR2PC1227_Epic%20Games_860x1148-860x1148-b4c2210ee0c3c3b843a8de399bfe7f5c.jpg?h=480&quality=medium&resize=1&w=360",
      releaseDate: "11/05/19", 
      initialRelease: "01/05/19", 
      platform: [
        "Windows"
      ], 
      developer: "Rockstar Games",
      description: "Winner of over 175 Game of the Year Awards and recipient of over 250 perfect scores, Red Dead Redemption 2 is an epic tale of honor and loyalty at the dawn of the modern age. Includes Red Dead Redemption 2: Story Mode and Red Dead Online.",
      genres: "Action, Naration, Open World", 
      features: "Single Player",
      rating: 4,
      category: ["Most Popular"],
      detailImage: [
        "https://cdn1.epicgames.com/b30b6d1b4dfd4dcc93b5490be5e094e5/offer/RDR2476298253_Epic_Games_Wishlist_RDR2_2560x1440_V01-2560x1440-2a9ebe1f7ee202102555be202d5632ec.jpg?h=270&quality=medium&resize=1&w=480",
        "https://cdn2.unrealengine.com/Diesel%2Fproductv2%2Fheather%2Fhome%2FEGS_RockstarGames_RedDeadRedemption2_G1A_00-1920x1080-308f101576da37225c889173094f373f2afc56c1.jpg",
      ],
      ratingInformation: [],

    ),
    Game(
      title: "Quake II", 
      price: 133000, 
      refundType: "Self-Refundable",
      image: "https://cdn1.epicgames.com/offer/a5434b28a3ac403e966478e86a839f5b/EGS_QuakeII_idSoftware_S2_1200x1600-6123414858c2f24e8f760ba637155c8c?h=480&quality=medium&resize=1&w=360",
      releaseDate: "08/11/23", 
      initialRelease: "03/11/23", 
      platform: [
        "Windows"
      ], 
      developer: "Nighdive Studio",
      description: "You are humanity’s last hope to stop the Strogg, a hostile alien race waging war against Earth. Play this military sci-fi FPS, now enhanced for modern platforms and feature-complete with all-new campaign content, Quake II 64, online multiplayer and co-op support, and more.",
      genres: "Action, Shooter", 
      features: "Co-op Player, Multiplayer, Single Player",
      rating: 4,
      category: ["New Release"],
      detailImage: [
        "https://cdn1.epicgames.com/offer/a5434b28a3ac403e966478e86a839f5b/EGS_QuakeII_idSoftware_S1_2560x1440-56ea07da35c80d822a17b5e9d0d7e0c6?h=270&quality=medium&resize=1&w=480",
        "https://cdn2.unrealengine.com/egs-quakeii-idsoftware-g1a-07-1920x1080-a52429863432.jpg",
        "https://cdn2.unrealengine.com/egs-quakeii-idsoftware-g1a-00-1920x1080-334b1330920e.jpg",
        "https://cdn2.unrealengine.com/egs-quakeii-idsoftware-g1a-01-1920x1080-6a2938a82a60.jpg",
        "https://cdn2.unrealengine.com/egs-quakeii-idsoftware-g1a-02-1920x1080-1df013ce9a18.jpg",
        "https://cdn2.unrealengine.com/egs-quakeii-idsoftware-g1a-03-1920x1080-56048c451beb.jpg",
        "https://cdn2.unrealengine.com/egs-quakeii-idsoftware-g1a-04-1920x1080-d01ba5875755.jpg",
      ],
      ratingInformation: [],

    ),
    Game(
      title: "Extreme Bus Driver 2024", 
      price: 6999, 
      refundType: "Self-Refundable",
      image: "https://cdn1.epicgames.com/spt-assets/e184f7dc2a1f4b84b68b5fa60c40408a/extreme-bus-driver-simulator-5uy0t.png?h=480&quality=medium&resize=1&w=360",
      releaseDate: "08/13/23", 
      initialRelease: "02/13/23", 
      platform: [
        "Windows"
      ], 
      developer: "Samet Acar",
      description: "Are you ready to become an experienced bus driver? Experience the thrill of transporting passengers in a realistic city with Extreme Bus Driver 2024! Get passengers to their destination on time and safely, earn rewards and customize your bus.",
      genres: "Open World, Racing, Simulation", 
      features: "Single Player",
      rating: 4,
      category: ["New Release"],
      detailImage: [
        "https://cdn1.epicgames.com/spt-assets/e184f7dc2a1f4b84b68b5fa60c40408a/extreme-bus-driver-simulator-15tq8.png?h=270&quality=medium&resize=1&w=480",
        "https://cdn1.epicgames.com/spt-assets/e184f7dc2a1f4b84b68b5fa60c40408a/extreme-bus-driver-simulator-1jvfg.jpg",
        "https://cdn1.epicgames.com/spt-assets/e184f7dc2a1f4b84b68b5fa60c40408a/extreme-bus-driver-simulator-1aa3m.jpg",
        "https://cdn1.epicgames.com/spt-assets/e184f7dc2a1f4b84b68b5fa60c40408a/extreme-bus-driver-simulator-1tml1.jpg",
        "https://cdn1.epicgames.com/spt-assets/e184f7dc2a1f4b84b68b5fa60c40408a/extreme-bus-driver-simulator-ot9ts.jpg",
        "https://cdn1.epicgames.com/spt-assets/e184f7dc2a1f4b84b68b5fa60c40408a/extreme-bus-driver-simulator-1w4rm.jpg",
        
      ],
      ratingInformation: [],

    ),
    Game(
      title: "SNWBRD: Freestyle Snowboarding", 
      price: -1, 
      refundType: "Self-Refundable",
      image: "https://cdn1.epicgames.com/spt-assets/82287fd30aa54ea49cbea1214637693f/snwbrd-freestyle-snowboarding-ex7mt.jpg?h=480&quality=medium&resize=1&w=360",
      releaseDate: "08/14/23", 
      initialRelease: "03/14/23", 
      platform: [
        "Windows", "Mac"
      ], 
      developer: "Gaming Limited",
      description: "SNWBRD - Is a Snowboard Game like AMPED and inspired by the AMPED Original Xbox Game, an action-packed, open-world snowboarding game that lets players experience the thrill and freedom of shredding the slopes.",
      genres: "Action, Simulation, Sports", 
      features: "Co-op, Competitive, Controller, Support",
      rating: 0,
      category: ["Coming Soon"],
      detailImage: [
        "https://cdn1.epicgames.com/spt-assets/82287fd30aa54ea49cbea1214637693f/snwbrd-freestyle-snowboarding-wucpm.jpg",
        "https://cdn1.epicgames.com/spt-assets/82287fd30aa54ea49cbea1214637693f/snwbrd-freestyle-snowboarding-ozrdr.jpg?h=270&quality=medium&resize=1&w=480",
        "https://cdn1.epicgames.com/spt-assets/82287fd30aa54ea49cbea1214637693f/snwbrd-freestyle-snowboarding-qyzxz.jpg",
        "https://cdn1.epicgames.com/spt-assets/82287fd30aa54ea49cbea1214637693f/snwbrd-freestyle-snowboarding-1wysu.jpg",
        "https://cdn1.epicgames.com/spt-assets/82287fd30aa54ea49cbea1214637693f/snwbrd-freestyle-snowboarding-1agnc.jpg",
        "https://cdn1.epicgames.com/spt-assets/82287fd30aa54ea49cbea1214637693f/snwbrd-freestyle-snowboarding-gwusz.jpg",

      ],
      ratingInformation: [],

    ),
    Game(
      title: "Madden NFL 24", 
      price: -1, 
      refundType: "Self-Refundable",
      image: "https://cdn1.epicgames.com/offer/0460f46401ae4bdcadbc931d30028015/EGS_MaddenNFL24_Tiburon_S2_1200x1600-abb3a7b03415834c8c904ee7e1463691?h=480&quality=medium&resize=1&w=360",
      releaseDate: "09/14/23", 
      initialRelease: "02/14/23", 
      platform: [
        "Windows"
      ], 
      developer: "Gaming Limited",
      description: "Experience The newest iteration of FieldSENSE™ in Madden NFL 24. More realistic character movement and smarter AI gives you control to play out your gameplay strategy with the confidence to dominate any opponent in Madden NFL 24.",
      genres: "Sports", 
      features: "Co-op, Multiplayer, Cross Platform",
      rating: 0,
      category: ["Coming Soon"],
      detailImage: [
        "https://cdn1.epicgames.com/offer/0460f46401ae4bdcadbc931d30028015/EGS_MaddenNFL24_Tiburon_S1_2560x1440-e3e021bbdd6feffd2318f35fd3e2dd69?h=270&quality=medium&resize=1&w=480",
        "https://cdn2.unrealengine.com/egs-maddennfl24-tiburon-g1a-00-1920x1080-cec13bbfd0bb.jpg",
        "https://cdn2.unrealengine.com/egs-maddennfl24-tiburon-g1a-01-1920x1080-69f79b6a3202.jpg",
        "https://cdn2.unrealengine.com/egs-maddennfl24-tiburon-g1a-02-1920x1080-711316174c23.jpg",
        "https://cdn2.unrealengine.com/egs-maddennfl24-tiburon-g1a-03-1920x1080-e3038923215d.jpg",
        "https://cdn2.unrealengine.com/egs-maddennfl24-tiburon-g1a-04-1920x1080-c5a89613af2c.jpg",
        "https://cdn2.unrealengine.com/egs-maddennfl24-tiburon-g1a-05-1920x1080-7f75616bbadf.jpg",
      ],
      ratingInformation: [],

    ),
    Game(
      title: "Aimlabs", 
      price: 0, 
      refundType: "-",
      image: "https://cdn1.epicgames.com/offer/baa1163025994ae3b1cf3d425230e90a/EGS_Aimlabs_StateSpaceLabsInc_S2_1200x1600-adeec4040a02ec05f3881323db86f814?h=480&quality=medium&resize=1&w=360",
      releaseDate: "03/08/23", 
      initialRelease: "03/08/22", 
      platform: [
        "Windows"
      ], 
      developer: "State Space Labs Inc.",
      description: "Aimlabs is the aim trainer of choice for over 30 Million players, from beginners to esports pros. Our unique aim analysis optimizes your gameplay, targets your weaknesses &amp; builds key skills for any FPS/TPS game, all for free!",
      genres: "Shooter", 
      features: "Competitive, Controller Support",
      rating: 5,
      category: ["Free Games"],
      detailImage: [
        "https://cdn1.epicgames.com/offer/baa1163025994ae3b1cf3d425230e90a/EGS_Aimlabs_StateSpaceLabsInc_S1_2560x1440-19ed7c3790290146977ec2ede7d5295e?h=270&quality=medium&resize=1&w=480",
        "https://cdn2.unrealengine.com/egs-aimlabs-statespacelabsinc-g1a-01-1920x1080-dbc3a54629f4.jpg",
        "https://cdn2.unrealengine.com/egs-aimlabs-statespacelabsinc-g1a-02-1920x1080-fcf4c1efc7de.jpg",
        "https://cdn2.unrealengine.com/egs-aimlabs-statespacelabsinc-g1a-03-1920x1080-553104d4e5b3.jpg",
        "https://cdn2.unrealengine.com/egs-aimlabs-statespacelabsinc-g1a-04-1920x1080-9df61d2f8ab3.jpg",
        "https://cdn2.unrealengine.com/egs-aimlabs-statespacelabsinc-g1a-06-1920x1080-82139daa1ae0.jpg",
        "https://cdn2.unrealengine.com/egs-aimlabs-statespacelabsinc-g1a-07-1920x1080-6a85a5d503f7.jpg",
      ],
      ratingInformation: [],

    ),
    Game(
      title: "Rocket League", 
      price: 0, 
      refundType: "-",
      image: "https://cdn1.epicgames.com/offer/9773aa1aa54f4f7b80e44bef04986cea/EGS_RocketLeague_PsyonixLLC_S2_1200x1600-edcc4af1ea991205eb2346c6691cc99c?h=480&quality=medium&resize=1&w=360",
      releaseDate: "09/23/20", 
      initialRelease: "09/23/19", 
      platform: [
        "Windows"
      ], 
      developer: "Psyonic LLC",
      description: "Rocket League is a high-powered hybrid of arcade-style soccer and vehicular mayhem with easy-to-understand controls and fluid, physics-driven competition.",
      genres: "Racing", 
      features: "Achievement, Multiplayer, Co-op",
      rating: 5,
      category: ["Free Games"],
      detailImage: [
        "https://cdn1.epicgames.com/offer/9773aa1aa54f4f7b80e44bef04986cea/EGS_RocketLeagueBattleBusTitaniumWhite_PsyonixLLC_DLC_S1_2560x1440-ebbb755d6a28c6f4a801567361ab27ab?h=270&quality=medium&resize=1&w=480",

      ],
      ratingInformation: [],

    ),
    Game(
      title: "Fortnite", 
      price: 0, 
      refundType: "-",
      image: "https://cdn1.epicgames.com/offer/fn/25BR_Quotient_EGS_Launcher_Blade_1200x1600_1200x1600-edf9499c496491fcbde374a8c73c357f?h=480&quality=medium&resize=1&w=360",
      releaseDate: "07/21/17", 
      initialRelease: "02/21/17", 
      platform: [
  "Windows", "Mac",
      ], 
      developer: "Epic Games",
      description: "Rocket League is a high-powered hybrid of arcade-style soccer and vehicular mayhem with easy-to-understand controls and fluid, physics-driven competition.",
      genres: "Action, Shooter", 
      features: "Multiplayer, Single-player, Competitive, Co-op",
      rating: 5,
      category: ["Free Games"],
      detailImage: [
        "https://cdn1.epicgames.com/offer/fn/25BR_Quotient_EGS_Launcher_Blade_2560x1440_2560x1440-0dce844812533fa4feb32c88c4f371e5?h=270&quality=medium&resize=1&w=480",
        "https://cdn2.unrealengine.com/en-25br-zerobuild-egs-2560x1440-2560x1440-311ccfe1ea74.jpg",
        "https://cdn2.unrealengine.com/01-cinematicstill011-3840x2160-3840x2160-ae28976210fc.png",
        "https://cdn2.unrealengine.com/02-still002-3840x2160-3840x2160-1150a4a5bc46.png",
        "https://cdn2.unrealengine.com/03-still005-3840x2160-3840x2160-8c30fdfe476e.png",
        "https://cdn2.unrealengine.com/04-gameplaystill002-3840x2160-3840x2160-d9cd59f646ee.png",
        "https://cdn2.unrealengine.com/05-cinematicstill003-3840x2160-3840x2160-97121fdfb6d2.png"

      ],
      ratingInformation: [],

    ),


  ];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'refundType': refundType,
      'image': image,
      'releaseDate': releaseDate,
      'initialRelease': initialRelease,
      'platform': platform.toList(),
      'developer': developer,
      'description': description,
      'genres': genres,
      'features': features,
      'rating': rating,
      'category': category.toList(),
      'detailImage': detailImage.toList(),
      'ratingInformation': ratingInformation.map((rating) => rating.toJson()).toList(), 
    };
  }
  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      title: json['title'] as String, 
      price: json['price'] as int, 
      refundType: json['refundType'] as String,
      image: json['image'] as String,
      releaseDate: json['releaseDate'] as String, 
      initialRelease: json['initialRelease'] as String, 
      platform: json['platform'] as List<String>,
      developer: json['developer'] as String,
      description: json['description']as String,
      genres: json['genres']as String, 
      features: json['features']as String,
      rating: json['rating'] as int,
      category: json['category'] as List<String>,
      detailImage: json['detailImage'] as List<String>,
      ratingInformation: json['ratingInformation'] as List<GameRatingModel>,
    );
    
  }


  static List<Game> loadedGameList = gameList;

  static Future<void> loadGames() async {
    loadedGameList = await LocalStorage.loadGameList();
  }
}
