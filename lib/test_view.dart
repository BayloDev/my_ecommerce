import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.orange.withOpacity(0.1),
          height: context.height,
        ),
      ),
    );
  }
}
