import 'package:flutter/material.dart';
import 'package:oppo1/pics/product_card.dart';
import '../pics/my_product.dart';

class Poses extends StatefulWidget {
  const Poses({super.key});

  @override
  State<Poses> createState() => _PosesState();
}

class _PosesState extends State<Poses> {

  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xfffff6cb),
      appBar: AppBar(
        title: const Text('Poses',
        style: TextStyle(
          color: Color(0xffecdcc9),
          fontSize: 22,
          fontWeight: FontWeight.w600
        ),),
        backgroundColor: const Color(0xff4d243d),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Poses Category",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPoses(index : 0,name :"Solo"),
                _buildPoses(index : 1,name :"Duo"),
                _buildPoses(index : 2,name :"Group"),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
                child: isSelected == 0 ? _buildAllProducts()
                    : isSelected == 1
                    ? _buildDuo() :_buildGroup()
            ),
          ],
        ),
      ),

    );
  }
  _buildPoses({required int index, required String name}) =>
  GestureDetector(
    onTap: () => setState(() => isSelected = index),
    child:   Container(
        width: 100,
        height: 40,
        margin: const EdgeInsets.only(top: 10,right: 10),
        alignment: Alignment.center,
        decoration:  BoxDecoration(
          color: isSelected == index ? const Color(0xFFD0A98F) : const Color(0xffd0a98f),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          name,
          style: const TextStyle(color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500),
        ),
  ),
  );

  _buildAllProducts() => GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100/140),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: MyProducts.allProducts.length,
    itemBuilder: (context,index){
      final allProducts =MyProducts.allProducts[index];
      return ProductCard(product: allProducts);
    },
  );

_buildDuo() => GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  childAspectRatio: (100/140),
  crossAxisSpacing: 12,
  mainAxisSpacing: 12,
  ),
  scrollDirection: Axis.vertical,
  itemCount: MyProducts.duo.length,
  itemBuilder: (context,index) {
    final aDuo =MyProducts.duo[index];
    return ProductCard(product: aDuo);
  },
);

  _buildGroup() => GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100/140),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: MyProducts.group.length,
    itemBuilder: (context,index) {
      final aGroup =MyProducts.group[index];
      return ProductCard(product: aGroup);
    },
  );
}



