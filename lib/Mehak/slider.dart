
import 'package:flutter/material.dart';

class slider extends StatelessWidget {
  slider({

    required this.boxName,
    required this.imagePath,
    super.key,
  });


  String boxName;
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height) * 0.3 * 0.5,
      width: (MediaQuery.of(context).size.width) * 0.8 * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(imagePath),
          ),
          SizedBox(
            height: 17,
          ),
          Text(
            boxName,
          ),
        ],
      ),
    );
  }
}
