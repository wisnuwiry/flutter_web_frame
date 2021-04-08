import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';

void main() {
  runApp(MyAp());
}

class MyAp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      builder: (context) {
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text('Title '),
            ),
            body: Center(
              child: Text('Body Text'),
            ),
          ),
        );
      },
      maximumSize: Size(475.0, 812.0),
      enabled: kIsWeb,
      backgroundColor: Colors.grey,
    );
  }
}
