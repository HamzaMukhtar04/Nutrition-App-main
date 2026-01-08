import 'package:flutter/material.dart';
import 'package:recipe/model/meal.dart';
import 'package:recipe/screen/utiles/consts/colors.dart';
import 'package:recipe/screen/bottom_nav_bar/4_favorite_screens/provider/favorite_provider.dart';
import 'package:recipe/screen/recipes/lunch/lunch_pizza.dart';
import 'package:recipe/screen/screens/detail_screen.dart';

class MealsGridTile extends StatelessWidget {
  final Meal meal;
  const MealsGridTile({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => DetailScreen(
              meal: meal,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 185, 185, 185),
              offset: Offset(1, 1),
              blurRadius: 15,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: provider.isExist(meal.name)
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite_border),
                    onPressed: () {
                      provider.toggleFavorite(meal.name);
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: Container(
                height: 120,
                width: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(meal.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              meal.name,
              style: TextStyle(
                fontSize: 18,
                color: font,
                fontFamily: 'ro',
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  meal.time,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontFamily: 'ro',
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: maincolor, size: 15),
                    Text(
                      meal.rating,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontFamily: 'ro',
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
