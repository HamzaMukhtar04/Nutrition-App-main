// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe/model/meal.dart';
import 'package:recipe/screen/utiles/consts/colors.dart';
import 'package:recipe/screen/bottom_nav_bar/4_favorite_screens/provider/favorite_provider.dart';

import 'package:recipe/screen/recipes/dinner/dinner_burger.dart';
import 'package:recipe/screen/recipes/dinner/dinner_cheesepie.dart';
import 'package:recipe/screen/recipes/dinner/dinner_grilledmeat.dart';
import 'package:recipe/screen/recipes/dinner/dinner_minced.dart';
import 'package:recipe/screen/recipes/fast/fast_bananachips.dart';
import 'package:recipe/screen/recipes/fast/fast_eggcurry.dart';
import 'package:recipe/screen/recipes/fast/fast_pancake.dart';
import 'package:recipe/screen/recipes/fast/fast_riceeggs.dart';
import 'package:recipe/screen/recipes/lunch/lunch_burger.dart';
import 'package:recipe/screen/recipes/lunch/lunch_pasta.dart';
import 'package:recipe/screen/recipes/lunch/lunch_pizza.dart';
import 'package:recipe/screen/recipes/lunch/lunch_steak.dart';
import 'package:recipe/screen/utiles/widgets/list_container.dart';
import 'package:recipe/screen/screens/meals_grid_tile.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:recipe/screen/sidebar_screens/sidebar.dart';

import '../sidebar_screens/tolearn/pages/home_page.dart';

List<MyContainerInTopClass> myContTopListImgSrc = const [
  MyContainerInTopClass(imgPath: 'images/2c.jpg'),
  MyContainerInTopClass(imgPath: 'images/1c.jpg'),
  MyContainerInTopClass(imgPath: 'images/3c.jpg'),
  MyContainerInTopClass(imgPath: 'images/4c.jpg')
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scrollController = ScrollController();

  double scrollPostion = 0;
  bool scrollForward = true;

  List<Meal> get breakfastNames => [
        Meal(
            name: "Pancakes",
            image: "images/pancakes.png",
            rating: "4.3",
            time: "20 min",
            carbs: 60,
            fats: 15,
            protein: 15,
            detail:
                "Fluffy buttermilk pancakes crafted with organic flour and farm-fresh eggs for a balanced morning. This recipe ensures a light, airy texture that pairs perfectly with maple syrup for lasting energy.",
            boost: "100",
            fire: "10",
            sausage: "10", isFavourite: false, foodType: FoodType.breakfast, dateTime: DateTime.now(),
            ),
        Meal(
            name: "Omelette",
            image: "images/omelette.png",
            rating: "4.8",
            time: "10 min",
            carbs: 10,
            fats: 40,
            protein: 45,
            detail:
                "A protein-packed classic featuring whisked eggs and garden-fresh vegetables. This savory, low-carb meal is slow-cooked to achieve a silky texture that provides essential vitamins for your day.",
            boost: "120",
            fire: "10",
            sausage: "5",isFavourite: false, foodType: FoodType.breakfast, dateTime: DateTime.now(),),
        Meal(
            name: "French Toast",
            image: "images/french_toast.png",
            rating: "4.5",
            time: "15 min",
            carbs: 55,
            fats: 20,
            protein: 15,
            detail:
                "Artisanal bread soaked in cinnamon custard and griddled to a golden, caramelized finish. It balances natural sweetness with complex carbohydrates to fuel your body and brain effectively.",
            boost: "100",
            fire: "11",
            sausage: "10",isFavourite: false, foodType: FoodType.breakfast, dateTime: DateTime.now(),),
        Meal(
            name: "Paratha",
            image: "images/paratha.png",
            rating: "4.7",
            time: "15 min",
            carbs: 50,
            fats: 35,
            protein: 10,
            detail:
                "Traditional whole-wheat flatbread expertly layered and pan-seared for a crispy, flaky exterior. High in fiber and healthy fats, it offers a hearty, satisfying start to any busy morning routine.",
            boost: "120",
            fire: "10",
            sausage: "5",isFavourite: false, foodType: FoodType.breakfast, dateTime: DateTime.now(),),
        Meal(
            name: "Egg Sandwich",
            image: "images/egg_sandwich.png",
            rating: "4.4",
            time: "12 min",
            carbs: 40,
            fats: 25,
            protein: 30,
            detail:
                "A perfectly poached egg and fresh greens nestled between toasted whole-grain buns. This portable, high-protein meal is designed for convenience without compromising on vital nutritional standards.",
            boost: "120",
            fire: "10",
            sausage: "5",isFavourite: false, foodType: FoodType.breakfast, dateTime: DateTime.now(),),
        Meal(
            name: "Cereal Bowl",
            image: "images/cereal_bowl.png",
            rating: "4.1",
            time: "5 min",
            carbs: 70,
            fats: 10,
            protein: 15,
            detail:
                "A vibrant mix of crunchy oat clusters, toasted nuts, and seeds for a diverse nutrient profile. Naturally sweetened with dried fruits, it provides a quick, refreshing energy boost without the sugar crash.",
            boost: "120",
            fire: "5",
            sausage: "4",isFavourite: false, foodType: FoodType.breakfast, dateTime: DateTime.now(),),
        Meal(
            name: "Waffles",
            image: "images/waffles.png",
            rating: "4.6",
            time: "18 min",
            carbs: 55,
            fats: 20,
            protein: 15,
            detail:
                "Belgian-style waffles baked to a crisp perfection with a light, airy core. Enriched with ancient grains, they offer a robust nutritional foundation and a delightful texture for a special breakfast.",
            boost: "120",
            fire: "10",
            sausage: "10",isFavourite: false, foodType: FoodType.breakfast, dateTime: DateTime.now(),),
        Meal(
            name: "Fruit Salad",
            image: "images/fruit_salad.png",
            rating: "4.9",
            time: "10 min",
            carbs: 85,
            fats: 5,
            protein: 5,
            detail:
                "A refreshing selection of seasonal berries and tropical fruits tossed in a light mint dressing. This antioxidant powerhouse provides a massive dose of Vitamin C and natural hydration to start your day.",
            boost: "1000",
            fire: "100",
            sausage: "5",isFavourite: false, foodType: FoodType.breakfast, dateTime: DateTime.now(),),
      ];

  List<Meal> get breakfastMeals => [
        for (var i = 0; i < breakfastNames.length; i++)
          Meal(
            name: breakfastNames[i].name.toString(),
            detail: breakfastNames[i].detail.toString(),
            // 'The application allows the you to create an account and set your profile.        The application allows the you to enter your daily cooking activities that you wish to practice or learn.         The application gives the stats of nutrients consumed by you today .        The application gives recipes for meals chosen by you.        The application allows the you to select your day meals(Breakfast, Lunch and Supper).',
            image: breakfastNames[i].image.toString(),
            time: breakfastNames[i].time.toString(),
            rating: breakfastNames[i].rating.toString(),
            isFavourite: breakfastNames[i].isFavourite,
            carbs: breakfastNames[i].carbs,
            protein: breakfastNames[i].protein,
            fats: breakfastNames[i].fats,
            foodType: breakfastNames[i].foodType,
            boost: breakfastNames[i].boost.toString(),
            fire: breakfastNames[i].fire.toString(),
            sausage: breakfastNames[i].sausage.toString(),
            dateTime: breakfastNames[i].dateTime,
          ),
      ];

  List<Meal> get lunchNames => [
        Meal(
            name: "Burger",
            image: "images/burger.png",
            rating: "4.6",
            time: "20 min",
            carbs: 35,
            fats: 30,
            protein: 30,
            detail:
                "A juicy flame-grilled patty topped with fresh lettuce and melted cheese on a toasted brioche bun. It provides a satisfying balance of protein and carbohydrates for a powerful midday energy boost.",
            boost: "120",
            fire: "10",
            sausage: "5",isFavourite: false, foodType: FoodType.lunch, dateTime: DateTime.now(),),
        Meal(
            name: "Shawarma",
            image: "images/swarma.png",
            rating: "4.8",
            time: "25 min",
            carbs: 30,
            fats: 25,
            protein: 40,
            detail:
                "Tender shavings of marinated chicken wrapped in soft pita with garlic sauce and pickled vegetables. This Mediterranean classic offers a lean protein punch with a rich, aromatic blend of traditional spices.",
            boost: "120",
            fire: "10",
                        sausage: "5",isFavourite: false, foodType: FoodType.lunch, dateTime: DateTime.now(),),

        Meal(
            name: "Rogni Nan",
            image: "images/rogni_nan.png",
            rating: "4.2",
            time: "15 min",
            carbs: 70,
            fats: 20,
            protein: 8,
            detail:
                "Freshly baked leavened bread brushed with clarified butter and sprinkled with toasted sesame seeds. Its soft, pillowy texture and rich flavor make it the perfect high-energy accompaniment to any savory dish.",
            boost: "120",
            fire: "10",
                        sausage: "2",isFavourite: false, foodType: FoodType.lunch, dateTime: DateTime.now(),),

        Meal(
            name: "Biryani",
            image: "images/baryani.png",
            rating: "4.9",
            time: "50 min",
            carbs: 55,
            fats: 25,
            protein: 15,
            detail:
                "A fragrant blend of long-grain basmati rice and succulent meat, slow-cooked with exotic spices and saffron. This calorie-dense meal is a nutritional powerhouse that offers a complex profile of essential flavors.",
            boost: "120",
            fire: "10",
                        sausage: "5",isFavourite: false, foodType: FoodType.lunch, dateTime: DateTime.now(),),

        Meal(
            name: "Chicken Karahi",
            image: "images/chicken_karahi.png",
            rating: "4.7",
            time: "35 min",
            carbs: 15,
            fats: 40,
            protein: 40,
            detail:
                "Succulent chicken pieces stir-fried in a thick tomato-based gravy with ginger and green chilies. A high-protein, bold-flavored dish that delivers a spicy kick while keeping you fueled throughout the afternoon.",
            boost: "120",
            fire: "10",
                        sausage: "5",isFavourite: false, foodType: FoodType.lunch, dateTime: DateTime.now(),),

        Meal(
            name: "Beef Pulao",
            image: "images/beef_pulao.png",
            rating: "4.5",
            time: "60 min",
            carbs: 50,
            fats: 20,
            protein: 25,
            detail:
                "Hearty beef chunks simmered with aromatic rice and a blend of traditional warm spices for deep flavor. This iron-rich meal is designed to provide long-lasting satiety and a steady release of daily energy.",
            boost: "120",
            fire: "10",
                        sausage: "5",isFavourite: false, foodType: FoodType.lunch, dateTime: DateTime.now(),),

        Meal(
            name: "Club Sandwich",
            image: "images/club_sandwich.png",
            rating: "4.4",
            time: "15 min",
            carbs: 35,
            fats: 25,
            protein: 35,
            detail:
                "Triple-layered toasted bread filled with roasted turkey, crisp bacon, fresh egg, and garden greens. A balanced, nutrient-dense choice that offers a variety of textures and essential food groups in every bite.",
            boost: "120",
            fire: "10",
                        sausage: "5",isFavourite: false, foodType: FoodType.lunch, dateTime: DateTime.now(),),

        Meal(
            name: "Pasta Alfredo",
            image: "images/pasta_alfredo.png",
            rating: "4.3",
            time: "25 min",
            carbs: 50,
            fats: 35,
            protein: 10,
            detail:
                "l dente pasta tossed in a velvety cream sauce made with aged parmesan and a hint of garlic. This comforting, energy-rich meal provides a smooth texture and a satisfyingly rich culinary experience.",
            boost: "120",
            fire: "10",
                        sausage: "5",isFavourite: false, foodType: FoodType.lunch, dateTime: DateTime.now(),),

      ];

  List<Meal> get lunchMeals => [
        for (var i = 0; i < lunchNames.length; i++)
          Meal(
            name: lunchNames[i].name.toString(),
            detail: lunchNames[i].detail.toString(),
            // 'The application allows the you to create an account and set your profile.        The application allows the you to enter your daily cooking activities that you wish to practice or learn.         The application gives the stats of nutrients consumed by you today .        The application gives recipes for meals chosen by you.        The application allows the you to select your day meals(Breakfast, Lunch and Supper).',
            image: lunchNames[i].image.toString(),
            time: lunchNames[i].time.toString(),
            rating: lunchNames[i].rating.toString(),
            isFavourite: lunchNames[i].isFavourite,
            carbs: lunchNames[i].carbs,
            protein: lunchNames[i].protein,
            fats: lunchNames[i].fats,
            foodType: lunchNames[i].foodType,
            boost: lunchNames[i].boost.toString(),
            fire: lunchNames[i].fire.toString(),
            sausage: lunchNames[i].sausage.toString(),
            dateTime:lunchNames[i].dateTime,
          ),
      ];

  List<Meal> get dinnerNames => [
        Meal(
            name: "Grilled Chicken",
            image: "images/d1.png",
            rating: "4.8",
            time: "30 min",
            carbs: 10,
            fats: 15,
            protein: 70,
            detail:
                "Succulent chicken breast marinated in herbs and flame-grilled for a smoky, tender finish. This lean protein option is low in calories and perfect for a healthy, muscle-recovering evening meal.",
            boost: "120",
            fire: "10",
                        sausage: "5",isFavourite: false, foodType: FoodType.dinner, dateTime: DateTime.now(),),

        Meal(
            name: "Chicken Handi",
            image: "images/d2.png",
            rating: "4.6",
            time: "40 min",
            carbs: 15,
            fats: 45,
            protein: 35,
            detail:
                "A rich, creamy chicken curry cooked in a traditional clay pot with ginger and aromatic spices. It offers a velvety texture and a comforting, protein-dense profile to end your day on a high note.",
            boost: "120",
            fire: "10",
                        sausage: "6",isFavourite: false, foodType: FoodType.dinner, dateTime: DateTime.now(),),

        Meal(
            name: "Mutton Korma",
            image: "images/d3.png",
            rating: "4.7",
            time: "75 min",
            carbs: 10,
            fats: 50,
            protein: 35,
            detail:
                "Slow-cooked mutton simmered in a yogurt-based gravy infused with cardamom and exotic saffron spices. This iron-rich dinner provides deep, complex flavors and a satisfyingly tender meat experience.",
            boost: "120",
            fire: "10",
                        sausage: "5",isFavourite: false, foodType: FoodType.dinner, dateTime: DateTime.now(),),

        Meal(
            name: "BBQ Tikka",
            image: "images/d4.png",
            rating: "4.9",
            time: "35 min",
            carbs: 5,
            fats: 20,
            protein: 70,
            detail:
                "Char-grilled chicken chunks marinated in a spicy yogurt blend for a bold and authentic smoky flavor. It is a high-protein, low-fat choice that delivers a punch of traditional spices in every bite.",
            boost: "120",
            fire: "10",
                        sausage: "7",isFavourite: false, foodType: FoodType.dinner, dateTime: DateTime.now(),),

        Meal(
            name: "Steak",
            image: "images/d5.png",
            rating: "4.8",
            time: "25 min",
            carbs: 5,
            fats: 35,
            protein: 55,
            detail:
                "A premium cut of beef seared to perfection to lock in natural juices and essential nutrients. Rich in protein and B vitamins, it provides a hearty and satiating meal for effective overnight recovery.",
            boost: "120",
            fire: "10",
                        sausage: "5",isFavourite: false, foodType: FoodType.dinner, dateTime: DateTime.now(),),

        Meal(
            name: "Fish Curry",
            image: "images/d6.png",
            rating: "4.4",
            time: "30 min",
            carbs: 15,
            fats: 30,
            protein: 50,
            detail:
                "Fresh fish fillets simmered in a light coconut and tamarind gravy with a hint of turmeric. This heart-healthy meal is packed with Omega-3 fatty acids and light proteins for easy evening digestion.",
            boost: "120",
            fire: "10",
                        sausage: "5",isFavourite: false, foodType: FoodType.dinner, dateTime: DateTime.now(),),

        Meal(
            name: "Vegetable Stir Fry",
            image: "images/d7.png",
            rating: "4.2",
            time: "15 min",
            carbs: 45,
            fats: 25,
            protein: 20,
            detail:
                "A vibrant medley of crisp seasonal vegetables tossed in a light soy and ginger glaze. This fiber-rich, antioxidant powerhouse is a low-calorie way to stay hydrated and nourished through the night.",
            boost: "120",
            fire: "10",
                        sausage: "10",isFavourite: false, foodType: FoodType.dinner, dateTime: DateTime.now(),),

        Meal(
            name: "Chicken Soup",
            image: "images/d8.png",
            rating: "4.5",
            time: "45 min",
            carbs: 20,
            fats: 20,
            protein: 55,
            detail:
                "A soothing broth made with shredded chicken and garden vegetables for a light yet nutritious dinner. It is the perfect hydrating meal to support your immune system while remaining gentle on the stomach.",
            boost: "120",
            fire: "10",
                        sausage: "5",isFavourite: false, foodType: FoodType.dinner, dateTime: DateTime.now(),),

      ];

  List<Meal> get dinnerMeals => [
        for (var i = 0; i < dinnerNames.length; i++)
          Meal(
            name: dinnerNames[i].name.toString(),
            detail: dinnerNames[i].detail.toString(),
            // 'The application allows the you to create an account and set your profile.        The application allows the you to enter your daily cooking activities that you wish to practice or learn.         The application gives the stats of nutrients consumed by you today .        The application gives recipes for meals chosen by you.        The application allows the you to select your day meals(Breakfast, Lunch and Supper).',
            image: dinnerNames[i].image.toString(),
            time: dinnerNames[i].time.toString(),
            rating: dinnerNames[i].rating.toString(),
            isFavourite: dinnerNames[i].isFavourite,
            carbs: dinnerNames[i].carbs,
            protein: dinnerNames[i].protein,
            fats: dinnerNames[i].fats,
            foodType: dinnerNames[i].foodType,
            boost: dinnerNames[i].boost.toString(),
            fire: dinnerNames[i].fire.toString(),
            sausage: dinnerNames[i].sausage.toString(),
            dateTime: dinnerNames[i].dateTime,
          ),
      ];

  List<String> images = [
    'images/1c.jpg',
    'images/2c.jpg',
    'images/3c.jpg',
    'images/4c.jpg',
    'images/5c.jpg',
    'images/6c.jpg',
  ];
  List texts = [
    "The application allows the you to create an account and set your profile.        The application allows the you to enter your daily cooking activities that you wish to practice or learn.         The application gives the stats of nutrients consumed by you today .        The application gives recipes for meals chosen by you.        The application allows the you to select your day meals(Breakfast, Lunch and Supper).",
    " "
  ];
  int indexx = 0;
  List category = ['Breakfast', 'Lunch', 'Dinner'];
  List categoryname = ['Breakfast', 'Lunch', 'Dinner'];
  List food = [
    ['Pizza', 'Steak', 'Pasta', 'Burger'],
    ['Chips Burger', 'Minced Meat', 'Cheese pie Meat', 'Grilled Meat'],
    ['Pancake', 'Egg curry', 'Banana chips', 'Rice Eggs'],
  ];
  List time = [
    ['68 min', '50 min', '40 min', '35 min'],
    ['30 min', '35 min', '40 min', '35 min'],
    ['20 min', '15 min', '40 min', '35 min'],
  ];
  List starz = [
    ['4.3', '4.9', '4.3', '4.9'],
    ['4.2', '4.7', '4.3', '4.9'],
    ['4.3', '4.8', '4.3', '4.9'],
  ];
  List screen = [
    [Pizza(), Steak_burger(), Pasta_burger(), Lunch_burger()],
    [
      Dinner_burger(),
      Mincedmeat_dinner(),
      Cheesepie_dinner(),
      Grilledmeat_dinner()
    ],
    [Pancake_fast(), Eggcurry_fast(), Bananachips_fast(), Riceeggs_fast()],
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      Duration(milliseconds: 500),
      (timer) {
        if (!scrollController.hasClients) return;

        double speed = 10;

        if (scrollForward) {
          scrollPostion += speed;
          if (scrollPostion >= scrollController.position.maxScrollExtent) {
            scrollForward = false;
          }
        } else {
          scrollPostion -= speed;
          if (scrollPostion <= 0) {
            scrollForward = true;
          }
        }
        scrollController.animateTo(scrollPostion,
            duration: Duration(milliseconds: 500), curve: Curves.linear);
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      drawer: Navbar(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 70),
          child: Text(
            "Best Meals",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
        )),
        backgroundColor: maincolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: Container(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 5),
                child: Column(
                  children: [
                    Text(
                      'Welcome,',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'To Mobile Nutrition App',
                      style: TextStyle(
                        fontSize: 25,
                        color: font,
                        fontFamily: 'ro',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                          width: mqSize.width,
                          height: mqSize.height * 0.24,
                          color: Colors.transparent,
                          child: ListView.builder(
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount: myContTopListImgSrc.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 10, bottom: 10),
                              child: MyContainerInTopList(
                                  imgPath: myContTopListImgSrc[index].imgPath),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 0),
                      height: mqSize.height * 0.03,
                      child: Column(
                        children: [
                          // CarouselSlider.builder(
                          //   itemCount: texts.length,
                          //   options: CarouselOptions(
                          //     height: 20,
                          //     viewportFraction: 6,
                          //     initialPage: 0,
                          //     enableInfiniteScroll: true,
                          //     autoPlay: true,
                          //     autoPlayInterval: Duration(milliseconds: 2000),
                          //     autoPlayAnimationDuration:
                          //         Duration(milliseconds: 10000),
                          //     autoPlayCurve: Curves.easeInCirc,
                          //     enlargeCenterPage: false,
                          //     scrollDirection: Axis.horizontal,
                          //   ),
                          //   itemBuilder: (BuildContext context, int index,
                          //       int realIndex) {
                          //     return Text(texts[index],
                          //         style: TextStyle(
                          //           fontSize: 15,
                          //         ));
                          //   },
                          // ),
                          SizedBox(
                            height: 5,
                          ),
                          // CarouselSlider.builder(
                          //   itemCount: images.length,
                          //   options: CarouselOptions(
                          //     height: 200,
                          //     aspectRatio: 16 / 9,
                          //     viewportFraction: 0.8,
                          //     initialPage: 0,
                          //     enableInfiniteScroll: false,
                          //     reverse: false,
                          //     autoPlay: true,
                          //     autoPlayInterval: Duration(seconds: 5),
                          //     autoPlayAnimationDuration:
                          //         Duration(milliseconds: 1000),
                          //     autoPlayCurve: Curves.easeIn,
                          //     enlargeCenterPage: true,
                          //     enlargeFactor: 0.4,
                          //     scrollDirection: Axis.horizontal,
                          //   ),
                          //   itemBuilder: (BuildContext context, int index,
                          //       int realIndex) {
                          //     return Container(
                          //       decoration: BoxDecoration(
                          //         image: DecorationImage(
                          //           image: AssetImage(images[index]),
                          //           fit: BoxFit.cover,
                          //         ),
                          //         borderRadius: BorderRadius.circular(20),
                          //       ),
                          //     );
                          //   },
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 20,
                    color: font,
                    fontFamily: 'ro',
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  indexx = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                  left: index == 0 ? 4 : 0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: indexx == index
                                      ? maincolor
                                      : Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: indexx == index
                                          ? maincolor
                                          : Colors.transparent,
                                      offset: indexx == index
                                          ? Offset(1, 1)
                                          : Offset(0, 0),
                                      blurRadius: indexx == index ? 7 : 0,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 17),
                                    child: Text(
                                      category[index],
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: indexx == index
                                            ? Colors.white
                                            : font,
                                        fontFamily: 'ro',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'Best and tasty!',
                          style: TextStyle(
                            fontSize: 20,
                            color: font,
                            fontFamily: 'ro',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return MealsGridTile(meal: getMealFromIndex(indexx)[index]);
                  },
                  childCount: getMealFromIndex(indexx).length,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 270,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(right: 10, left: 15),
              sliver: SliverToBoxAdapter(
                child: Container(
                  height: mqSize.height * 0.22,
                  width: mqSize.width * 0.9,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FittedBox(
                        child: Text(
                          'Found a great recipe and you want to learn it later?',
                          softWrap: true,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Add it to your tasks below,',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => ToLearn())));
                        },
                        child: Container(
                          height: 30,
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              'Add to tasks',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Meal> getMealFromIndex(int index) {
    if (index == 0) {
      return breakfastMeals;
    } else if (index == 1) {
      return lunchMeals;
    }
    return dinnerMeals;
  }
}

