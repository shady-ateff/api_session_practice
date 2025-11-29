
import 'package:flutter/material.dart';

class OrderPlacedPage extends StatelessWidget {
const OrderPlacedPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text('Your order has been placed successfully!'),
      ),
    );
  }
}