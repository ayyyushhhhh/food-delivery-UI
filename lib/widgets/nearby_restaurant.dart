import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data/data.dart';
import 'package:food_delivery_ui/models/restaurant.dart';
import 'package:food_delivery_ui/screens/restaurant_screen.dart';
import 'package:food_delivery_ui/widgets/rating_stars.dart';

class NearbyRestaurant extends StatefulWidget {
  @override
  _NearbyRestaurantState createState() => _NearbyRestaurantState();
}

class _NearbyRestaurantState extends State<NearbyRestaurant> {
  Widget _buildRestaurant() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(
        GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return RestaurantScreen(
              restaurant: restaurant,
            );
          })),
          child: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[200], width: 1)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                    tag: restaurant.imageUrl,
                    child: Image(
                      height: 150,
                      width: 150,
                      image: AssetImage(
                        restaurant.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          restaurant.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        RatingStars(
                          ratings: restaurant.rating,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          restaurant.address,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "0.2 miles away",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });

    return Column(
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Nearby Restaurants',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2),
            ),
          ),
        ),
        _buildRestaurant(),
      ],
    );
  }
}
