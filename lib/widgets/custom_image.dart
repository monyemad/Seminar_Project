import 'package:flutter/material.dart';

class CustomProfileImg extends StatelessWidget {
  final String? image;
  final double? right;
  final IconData? icon;

  const CustomProfileImg({super.key, this.image, this.right, this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIraIxLFndsHnK34RQm1q525ZHz77CFY2vCw&usqp=CAU"
          ),
          backgroundColor: Colors.white70,
        ),
        Positioned(
          bottom: 0,
          right: 4,
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              border:
                  Border.all(style: BorderStyle.solid, color: Colors.black26),
              color: Colors.white60,
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
                onPressed: () {
                  // context.read<AppCubitA>().pickImage();
                },
                icon: Icon(icon)),
          ),
        )
      ],
    );
  }
}
