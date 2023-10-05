import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, required this.onTap});

  final IconData icon;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.05)),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
