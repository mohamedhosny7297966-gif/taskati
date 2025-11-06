

import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  final Color color;
  final bool isActive;
  final void Function()? onTap;
  const ColorItem({super.key, required this.color, this.isActive= false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,

      children: [
        InkWell(
          onTap: onTap,
     child: CircleAvatar(
      radius: 30,
      backgroundColor: color,
    ),),
        if(isActive)
        Icon(Icons.check,color: Colors.white,size: 40,),

    ]

    );
  }
}
List<Color>taskColors=[
  Colors.black,
  Colors.lightBlue,
  Colors.teal,
  Colors.orange,
  Colors.lime,
  Colors.deepPurple,
  Colors.pinkAccent,
  Colors.red,
  Colors.pink,
  Colors.black45,

];
