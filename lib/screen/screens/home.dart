// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe/model/meal.dart';
import 'package:recipe/screen/consent/colors.dart';
import 'package:recipe/screen/fav/provider/favorite_provider.dart';

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
import 'package:recipe/screen/screens/List%20Container/list_container.dart';
import 'package:recipe/screen/screens/meals_grid_tile.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:recipe/screen/screens/sidebar.dart';

import '../tolearn/pages/home_page.dart';

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

  List<String> get breakfastNames => [
        'Pancakes',
        'Omelette',
        'French Toast',
        'Paratha',
        'Egg Sandwich',
        'Cereal Bowl',
        'Waffles',
        'Fruit Salad',
      ];
  List<String> get breakfastImages => [
        'images/pancakes.png',
        'images/omelette.png',
        'images/french_toast.png',
        'images/paratha.png',
        'images/egg_sandwich.png',
        'images/cereal_bowl.png',
        'images/waffles.png',
        'images/fruit_salad.png',
      ];

  List<Meal> get breakfastMeals => [
        for (var i = 0; i < breakfastNames.length; i++)
          Meal(
            name: breakfastNames[i],
            detail:
                'The application allows the you to create an account and set your profile.        The application allows the you to enter your daily cooking activities that you wish to practice or learn.         The application gives the stats of nutrients consumed by you today .        The application gives recipes for meals chosen by you.        The application allows the you to select your day meals(Breakfast, Lunch and Supper).',
            image: breakfastImages[i],
            time: '20 min',
            rating: '4.3',
            isFavourite: false,
            carbs: 180,
            protein: 60,
            fats: 50,
            foodType: FoodType.breakfast,
            boost: '90',
            fire: '5',
            sausage: '30g',
            dateTime: DateTime.now(),
          ),
      ];

  List<String> get lunchNames => [
        'Burger',
        'Suwarma',
        'Rogni Nan',
        'Baryani',
        'Chicken Karahi',
        'Beef Pulao',
        'Club Sandwich',
        'Pasta Alfredo',
      ];
  List<String> get lunchImages => [
        'images/burger.png',
        'images/swarma.png',
        'images/rogni_nan.png',
        'images/baryani.png',
        'images/chicken_karahi.png',
        'images/beef_pulao.png',
        'images/club_sandwich.png',
        'images/pasta_alfredo.png',
      ];

  List<Meal> get lunchMeals => [
        for (var i = 0; i < lunchNames.length; i++)
          Meal(
            name: lunchNames[i],
            detail:
                'The application allows the you to create an account and set your profile.        The application allows the you to enter your daily cooking activities that you wish to practice or learn.         The application gives the stats of nutrients consumed by you today .        The application gives recipes for meals chosen by you.        The application allows the you to select your day meals(Breakfast, Lunch and Supper).',
            image: lunchImages[i],
            time: '45 min',
            rating: '4.5',
            isFavourite: false,
            carbs: 250,
            protein: 100,
            fats: 120,
            foodType: FoodType.lunch,
            boost: '120',
            fire: '10',
            sausage: '50g',
            dateTime: DateTime.now(),
          ),
      ];

  List<String> get dinnerNames => [
        'Grilled Chicken',
        'Chicken Handi',
        'Mutton Korma',
        'BBQ Tikka',
        'Steak',
        'Fish Curry',
        'Vegetable Stir Fry',
        'Chicken Soup',
      ];
//dinner images
  List<String> get dinnerImages => [
        'images/d1.png',
        'images/d2.png',
        'images/d3.png',
        'images/d4.png',
        'images/d5.png',
        'images/d6.png',
        'images/d7.png',
        'images/d8.png',
      ];

  List<Meal> get dinnerMeals => [
        for (var i = 0; i < dinnerNames.length; i++)
          Meal(
            name: dinnerNames[i],
            detail:
                'The application allows the you to create an account and set your profile.        The application allows the you to enter your daily cooking activities that you wish to practice or learn.         The application gives the stats of nutrients consumed by you today .        The application gives recipes for meals chosen by you.        The application allows the you to select your day meals(Breakfast, Lunch and Supper).',
            image: dinnerImages[i],
            time: '60 min',
            rating: '4.6',
            isFavourite: false,
            carbs: 220,
            protein: 130,
            fats: 90,
            foodType: FoodType.dinner,
            boost: '140',
            fire: '12',
            sausage: '60g',
            dateTime: DateTime.now(),
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



/*
 SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    children: [
                     FittedBox(child:  Text(
                        'Found a great recipe and you want to learn it later?',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Add it to your tasks below,',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: GestureDetector(
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
                  )
                ],
              ),
            ),

 */