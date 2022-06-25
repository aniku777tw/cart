import 'package:flutter/material.dart';
class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 28,
      height: 200,
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 16,
                    child: Image(
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                      image: AssetImage('assets/test_img.jpg'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Text(
                    'Product Name',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Text(
                    'NT\$150',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Text(
                    'detail detail detail detail',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            // will be positioned in the top right of the container
              bottom: 4,
              right: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomRight: Radius.circular(10)),
                child: Container(
                  height: 30,
                  width: 30,
                  color: Color.fromRGBO(23, 36, 59, 1),
                  child: IconButton(
                    iconSize: 15,
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    color: Colors.white,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}