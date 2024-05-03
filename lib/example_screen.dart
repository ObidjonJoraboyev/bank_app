import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  Offset offset = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
              onTap: () {},
              onPanUpdate: (details) {
                setState(() {
                  offset=details.localPosition;
                });
              },
              onTapUp: (c) {
                offset = c.localPosition;
                setState(
                  () {},
                );
                print(offset);
                print(c.localPosition);
              },
              child: Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).height,
                color: Colors.white,
              )),
          Positioned(
              top: offset.dy,
              left: offset.dx,
              child: const Icon(CupertinoIcons.location_solid,size: 45,)),
        ],
      ),
    );
  }
}
