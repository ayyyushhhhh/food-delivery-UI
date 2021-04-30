import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data/data.dart';
import 'package:food_delivery_ui/models/order.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  Widget _buildCartItem(Order order) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      height: 175,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 150,
              child: Image(
                  fit: BoxFit.cover, image: AssetImage(order.food.imageUrl)),
            ),
          ),
          SizedBox(
            width: 6,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.food.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  order.restaurant.name,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  height: 22,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(width: 1, color: Colors.black54)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '-',
                        style: TextStyle(color: Colors.deepOrangeAccent),
                      ),
                      Text(order.quantity.toString()),
                      Text(
                        '+',
                        style: TextStyle(color: Colors.deepOrangeAccent),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text("\$" + order.food.price.toString(),
              style: TextStyle(fontSize: 16))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart(${currentUser.cart.length})'),
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              if (index < currentUser.cart.length) {
                Order order = currentUser.cart[index];
                return _buildCartItem(order);
              }
              return Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Estimated Delivery time:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '25 Min',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Cost:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "\$ 265",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.green),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 1,
                color: Colors.grey,
              );
            },
            itemCount: currentUser.cart.length + 1),
        bottomSheet: Container(
          height: MediaQuery.of(context).size.height / 10,
          width: MediaQuery.of(context).size.width,
          decoration:
              BoxDecoration(color: Theme.of(context).primaryColor, boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, -1), blurRadius: 6),
          ]),
          child: Center(
            child: Text(
              'CHECKOUT',
              style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 1.2,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
