import 'package:api_session_practice/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProductDetailsItemCounter extends StatefulWidget {
  const ProductDetailsItemCounter({super.key});

  @override
  State<ProductDetailsItemCounter> createState() =>
      _ProductDetailsItemCounterState();
}

class _ProductDetailsItemCounterState extends State<ProductDetailsItemCounter> {
  int _itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: IconButton(
            disabledColor: Colors.blueGrey,
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
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.primary, width: 1),
          ),
          child: Center(
            child: Text(
              '$_itemCount',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(width: 15),
        SizedBox(
          width: 40,
          height: 40,
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
