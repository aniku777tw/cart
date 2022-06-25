import 'package:flutter/material.dart';

import 'ProductCard.dart';

class ProductScrollView extends StatelessWidget {
  const ProductScrollView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 280,
      child: SizedBox(
        height: 400,
        width: MediaQuery.of(context).size.width - 32,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Row(
                    children: [
                      ProductCard(),
                      SizedBox(
                        width: 20,
                      ),
                      ProductCard(),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}