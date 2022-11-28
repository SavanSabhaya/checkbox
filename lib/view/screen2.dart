import 'package:checkbox/models/checkbox_model.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  // final List vision;
  List<CheckModel> vision = [];

  Screen2({Key? key, required this.vision}) : super(key: key);
  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.vision.length; i++) {
      print(widget.vision[i].title);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBoxlist'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget.vision.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(widget.vision[index].title),
          );
        },
      ),
    );
  }
}
