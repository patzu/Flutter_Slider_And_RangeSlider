import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySliderApp(),
    );
  }
}

class MySliderApp extends StatefulWidget {
  MySliderApp({Key key}) : super(key: key);

  @override
  _MySliderAppState createState() => _MySliderAppState();
}

class _MySliderAppState extends State<MySliderApp> {
  RangeValues _dollarsRange = const RangeValues(2, 90);

  var _dollars = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Sliders Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RangeSlider(
                values: _dollarsRange,
                min: 1,
                max: 100,
                divisions: 100,
                activeColor: Colors.green,
                inactiveColor: Colors.pink,
                labels: RangeLabels(
                  '${_dollarsRange.start.round()} dollars',
                  '${_dollarsRange.end.round()} dollars',
                ),
                onChanged: (RangeValues newValues) {
                  setState(() {
                    _dollarsRange = newValues;
                  });
                },
              ),
              SizedBox(
                height: 50,
              ),
              Slider(
                  value: _dollars.toDouble(),
                  min: 0,
                  max: 100,
                  activeColor: Colors.green,
                  inactiveColor: Colors.pink,
                  label: '$_dollars dollars',
                  divisions: 100,
                  onChanged: (double newValue) {
                    setState(() {
                      _dollars = newValue.round();
                    });
                  },
                  semanticFormatterCallback: (double newValue) {
                    return '${newValue.round()} dollars';
                  })
            ],
          ),
        ),
      ),
    );
  }
}
