import 'package:flutter/material.dart';

class BoxComponent extends StatelessWidget {
  final Color color;
  final String title;
  final String detail;
  final bool isStrengh;

  const BoxComponent({
    Key? key,
    required this.color,
    required this.title,
    required this.detail,
    this.isStrengh = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
          boxShadow: [
            if (isStrengh)
              const BoxShadow(
                color: Colors.black,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0), // shadow direction: bottom right
              ),
          ],
        ),
        height: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyle(
                  color: isStrengh ? Colors.black : Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                detail,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: isStrengh ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
