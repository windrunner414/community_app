import 'package:flutter/material.dart';

class AppBarLeadingAvatar extends StatelessWidget {
  final ImageProvider image;
  final VoidCallback onTap;

  AppBarLeadingAvatar({@required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CircleAvatar(
          backgroundImage: image,
          radius: 18,
          child: onTap != null ? GestureDetector(
            onTap: onTap,
          ) : null,
        ),
      ),
    );
  }
}