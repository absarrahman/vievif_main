import 'package:flutter/material.dart';

class FailurePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text('Failed'),
          ),
          RaisedButton(
            onPressed: () {
              //TODO NEED to navigate home screen
            },
            child: Text('Go to home'),
          ),
        ],
      ),
    );
  }
}
