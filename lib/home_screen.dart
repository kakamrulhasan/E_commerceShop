
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_19/models/my_product.dart';
import 'package:flutter_application_19/product_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Our Products',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProductCategory(index: 0, name: 'All product'),
              _buildProductCategory(index: 1, name: 'jackets'),
              _buildProductCategory(index: 2, name: 'Sneakers'),
            ],
          ),
          const SizedBox(height: 20, ),
          Expanded(child: _buildAllProduct())
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
    
  } 

  _buildProductCategory({required int index, required String name}) =>
      Container(
        width: 100,
        height: 40,
        margin: const EdgeInsets.only(top: 10, right: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected == index ? Colors.red : Colors.red.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
      );

  _buildAllProduct() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: Myproduct.AllProducts.length,
      itemBuilder: (context, index) {
        final allProduct = Myproduct.AllProducts[index];
        return ProductCard(product: allProduct);
      });
}
