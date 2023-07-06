import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      builder: (context) {
        return MaterialApp(
          home: FirstScreen(),
        );
      },
      clipBehavior: Clip.hardEdge,
      maximumSize: Size(475.0, 812.0),
      enabled: kIsWeb,
      backgroundColor: Colors.grey,
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Web Frame'),
      ),
      body: Stack(
        children: [
          Positioned(
            child: _buildButton(context),
            left: 0,
            top: 20,
          ),
          Positioned(
            child: _buildButton(context),
            right: 0,
            top: 20,
          ),
          Positioned(
            child: _buildButton(context),
            left: 0,
            bottom: 20,
          ),
          Positioned(
            child: _buildButton(context),
            right: 0,
            bottom: 20,
          ),
          Center(child: _buildButton(context)),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => SomeScreen(number: 1),
          ),
        );
      },
      icon: Icon(Icons.next_plan),
      label: Text('Next Page'),
    );
  }
}

class SomeScreen extends StatelessWidget {
  const SomeScreen({Key? key, required this.number}) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen $number'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Back'),
          ),
          SizedBox(height: 20, width: double.infinity),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => SomeScreen(number: number + 1),
                ),
              );
            },
            child: Text('Next To Screen ${number + 1}'),
          ),
          SizedBox(height: 20, width: double.infinity),
          TextField(
            decoration: InputDecoration(hintText: 'Input some text'),
          ),
        ],
      ),
    );
  }
}
