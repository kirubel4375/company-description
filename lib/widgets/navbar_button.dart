import 'package:flutter/material.dart';

class NavBarButton extends StatelessWidget {
  const NavBarButton({super.key, this.onTap, required this.text});
  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left:18.0),
        child: Text(
          text,
          style: const TextStyle(fontFamily: "Montserrat-Bold"),
        ),
      ),
    );
  }
}
