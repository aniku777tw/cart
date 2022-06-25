import 'package:flutter/material.dart';

import 'Widget/Recommend.dart';
import 'Widget/ShoppingList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 60,
              child: SizedBox(
                height: 210,
                width: MediaQuery.of(context).size.width - 32,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              )),
          Recommend(),
          ProductScrollView(),
          ShoppingList(),
        ],
      ),
    );
  }
}

class ProductScrollView extends StatelessWidget {
  const ProductScrollView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top:280,
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
                      SizedBox(width: 20,),
                      ProductCard(),
                    ],
                  ),
                  SizedBox(height: 20,),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 28,
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
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
            Text("test")
          ],
        ),
      ),
    );
  }
}
