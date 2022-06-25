import 'package:flutter/material.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({
    Key? key,
  }) : super(key: key);

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  DraggableScrollableController draggableScrollableController =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: draggableScrollableController,
      maxChildSize: 1,
      minChildSize: 0.15,
      initialChildSize: 0.15,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 7,
                  offset: Offset(3, 0), // changes position of shadow
                ),
              ],
              color: Color.fromRGBO(23, 36, 59, 1),
              borderRadius:
                  BorderRadius.vertical(top: Radius.elliptical(35, 35))),
          child: AnimatedBuilder(
            animation: scrollController,
            builder: (context, child) {
              double percentage = 0.15;

              if (scrollController.hasClients) {
                percentage = scrollController.position.viewportDimension /
                    MediaQuery.of(context).size.height;
              }
              if (percentage > 0.997) {
                percentage = 1;
              }
              if (percentage <= 0.17) {
                percentage = 0.15;
              }

              return Stack(
                children: [
                  Positioned(
                    top: 20 * (1 - percentage) + (100 - 50 - 13) * percentage,
                    left: MediaQuery.of(context).size.width * percentage / 2 -
                        27 * percentage,
                    child: Opacity(
                        opacity: percentage == 1 ? 0 : 1,
                        child: Text(
                          "購買項目",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  PositionedImg(
                    percentage: percentage,
                    index: 0,
                  ),
                  PositionedImg(
                    percentage: percentage,
                    index: 1,
                  ),
                  PositionedImg(
                    percentage: percentage,
                    index: 2,
                  ),
                  PositionedImg(
                    percentage: percentage,
                    index: 3,
                  ),
                  PositionedImg(
                    percentage: percentage,
                    index: 4,
                  ),
                  PositionedImg(
                    percentage: percentage,
                    index: 5,
                  ),
                  OpenedList(
                    percentage: percentage,
                    scrollController: scrollController,
                  ),
                  percentage != 1
                      ? Positioned(
                          top: 50,
                          right: 20,
                          child: IconButton(
                            iconSize: 30,
                            icon: Icon(Icons.menu),
                            color: Colors.white,
                            onPressed: () {
                              draggableScrollableController.animateTo(
                                1,
                                duration: const Duration(seconds: 1),
                                curve: Curves.fastOutSlowIn,
                              );
                            },
                          ))
                      : Positioned(
                          top: 50,
                          right: 20,
                          child: IconButton(
                            iconSize: 30,
                            icon: Icon(Icons.close_outlined),
                            color: Colors.white,
                            onPressed: () {
                              draggableScrollableController.animateTo(
                                0.15,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOutCubic,
                              );
                            },
                          )),
                ],
              );
            },
          ),
        ); // This trailing comma makes auto-formatting nicer for build methods.
      },
    );
  }
}

class PositionedImg extends StatelessWidget {
  const PositionedImg({
    Key? key,
    required this.percentage,
    required this.index,
  }) : super(key: key);

  final double percentage;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: percentage < 0.25
          ? 60 + ((calculateRatio(60, 200 + 116 * index)) * (percentage - 0.15))
          : 60 +
              ((calculateRatio(60, 200 + 116 * index)) * (percentage - 0.15)) -
              50 * percentage,
      left: percentage < 0.25
          ? 28 +
              48 * index +
              (calculateRatio(28 + 48 * index, 60) * (percentage - 0.15))
          : 28 +
              48 * index +
              (calculateRatio(28 + 48 * index, 60) * (percentage - 0.15)) -
              44 * percentage,
      child: percentage < 0.25
          ? Opacity(
              opacity: percentage == 1 ? 0 : 1 * (1 - percentage),
              child: Transform.scale(
                scale: percentage == 0.15 ? 1 : 1 + 1.1 * percentage,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Container(
                    color: Colors.white,
                    child: Image(
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                      image: AssetImage('assets/test_img.jpg'),
                    ),
                  ),
                ),
              ),
            )
          : Opacity(
              opacity: percentage == 1 ? 0 : 1 * (percentage) - 0.1,
              child: Container(
                  height: 105,
                  width: MediaQuery.of(context).size.width - 32,
                  child: Card(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomLeft: Radius.circular(4)),
                          child: Image(
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                            image: AssetImage('assets/test_img.jpg'),
                          ),
                        ),
                        Text('${index + 1}'),
                      ],
                    ),
                  )),
            ),
    );
  }
}

class OpenedList extends StatelessWidget {
  const OpenedList({
    Key? key,
    required this.percentage,
    required this.scrollController,
  }) : super(key: key);

  final double percentage;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: percentage == 1 ? 1 : 0,
      child: Stack(alignment: Alignment.topCenter, children: [
        ListView.builder(
          shrinkWrap: true,
          controller: scrollController,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Stack(children: [
                SizedBox(
                  width: 1,
                  height: 100,
                )
              ]);
            } else {
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Card(
                  child: Container(
                      height: 100,
                      width: 100,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                bottomLeft: Radius.circular(4)),
                            child: Image(
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,
                              image: AssetImage('assets/test_img.jpg'),
                            ),
                          ),
                          Text('$index'),
                        ],
                      )),
                ),
              );
            }
          },
        ),
        Container(
          height: 100 * percentage,
          width: percentage * MediaQuery.of(context).size.width,
          color: Color.fromRGBO(23, 36, 59, 1),
          child: Center(
            child: Text(
              "購買項目",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ]),
    );
  }
}

double calculateRatio(start, end) {
  double num;
  num = (end - start) / 0.85;
  return num;
}
