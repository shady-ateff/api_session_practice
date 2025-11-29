import 'package:api_session_practice/shared/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CartItemCounter extends StatefulWidget {
  const CartItemCounter({super.key});

  @override
  State<CartItemCounter> createState() => _CartItemCounterState();
}

class _CartItemCounterState extends State<CartItemCounter> {
  int _itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.primary, width: 1),
          ),
          child: IconButton(
            icon: Icon(Icons.remove, color: AppColors.primary),
            onPressed: _itemCount > 1
                ? () {
                    setState(() {
                      _itemCount--;
                    });
                  }
                : null,
          ),
        ),
        SizedBox(width: 15),
        Text(
          '$_itemCount',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 15),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.primary, width: 1),
          ),
          child: IconButton(
            icon: Icon(Icons.add, color: AppColors.primary),
            onPressed: () {
              setState(() {
                _itemCount++;
              });
            },
          ),
        ),
      ],
    );
  }
}
