import 'package:checkbox/models/checkbox_model.dart';
import 'package:checkbox/view/screen2.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final List<CheckModel> item = [];
  final List<bool> _isChecked = List<bool>.filled(25, false);
  // var data;
  List<CheckModel> data = [];

  removeData(int index) {
    for (int i = 0; i < item.length; i++) {
      if (item[i].indexValue == index) {
        print("Data Remove");
        item.removeAt(i);
      }
    }
  }

  addData(int index) {
    print("Data item addData");
    item.add(CheckModel(index, "item $index", true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBoxlist'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 25,
        itemBuilder: (context, index) {
          // final data = item[index];
          return CheckboxListTile(
            title: Text('Item $index'),
            value: _isChecked[index],
            onChanged: (value) {
              setState(() {
                _isChecked[index] = value!;
                if (value) {
                  addData(index);
                } else {
                  removeData(index);
                }
              });
            },
          );
        },
      ),
      bottomSheet: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                data.clear();
                for (int i = 0; i < item.length; i++) {
                  data.add(item[i]);
                  print(data);
                }
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen2(
                        vision: data,
                      ),
                    ),
                  );
                });
              },
              child: const Text('SAVE'),
            ),
          ),
        ],
      ),
    );
  }
}
