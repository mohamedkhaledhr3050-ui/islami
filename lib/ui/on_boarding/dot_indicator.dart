import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/colors_manager.dart';

class DotIndicator extends StatelessWidget {
  final bool active;

  const DotIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.all(5),
      height: 10,
      width: active? 20 : 10,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: active ? ColorsManager.primaryColor: Colors.grey[400],
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}
