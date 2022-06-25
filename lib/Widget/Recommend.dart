import 'package:flutter/material.dart';
class Recommend extends StatelessWidget {
  const Recommend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 35,
      top: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi,Tsung-Han',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Here's some special for you !",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 16,
            width: MediaQuery.of(context).size.width - 70,
            child: Divider(
              thickness: 2,
            ),
          ),
          Row(
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                  image: AssetImage('assets/test_img.jpg'),
                ),
              ),
              SizedBox(width: 11,),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                  image: AssetImage('assets/test_img.jpg'),
                ),
              ),
              SizedBox(width: 11,),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                  image: AssetImage('assets/test_img.jpg'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
