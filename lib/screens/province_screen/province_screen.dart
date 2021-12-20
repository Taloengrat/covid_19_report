import 'package:flutter/material.dart';

class ProvinceScreen extends StatelessWidget {
  final String data;
  const ProvinceScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Text(data),
    );
  }
}
