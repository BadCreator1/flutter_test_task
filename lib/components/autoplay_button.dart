
import 'package:flutter/material.dart';

class AutoplayButton extends StatelessWidget {
  AutoplayButton({required this.onTap, required this.autoplay, super.key});

  Function onTap;
  bool autoplay;

  @override
  Widget build(BuildContext context) => DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffD4145A), Color(0xffFBB03B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Autoplay ${autoplay ? 'On' : 'Off'}',
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
      ),
    );
}
