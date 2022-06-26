import 'package:flutter/material.dart';

class ShoppingListItem extends StatelessWidget {
  const ShoppingListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
            child: Image(
              fit: BoxFit.cover,
              height: 100,
              width: 100,
              image: AssetImage('assets/test_img.jpg'),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Text('No.${index + 1}',style: TextStyle(fontSize: 12,)),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Text('Product Name',style: TextStyle(fontSize: 16,)),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Text('NT\$150',style: TextStyle(fontSize: 12,),),
              ),
              Text(
                'detail detail detail detail',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              )
            ],
          ),
        ],
      ),
    );
  }
}
