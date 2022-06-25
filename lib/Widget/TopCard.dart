import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  const TopCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
        ));
  }
}