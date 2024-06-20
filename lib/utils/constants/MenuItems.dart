import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: Text("Download"),
        ),
        Container(
          height: 50,
          child: Text("Add to folder"),
        ),
      ],
    );
  }
}
