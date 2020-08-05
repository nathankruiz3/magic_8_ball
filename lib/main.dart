import 'package:flutter/material.dart';
// Import dart:math to use the Random number widget
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: BallPage(),
    ),
  );
}

// Stateless widget for appbar, background
class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      appBar: AppBar(
        title: Text(
          'The Magic 8-Ball',
          style: TextStyle(
            fontSize: 28,
            color: Colors.teal[900],
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey[400],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Ask Me Anything...',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 1,
              color: Colors.teal[800],
            ),
          ),

          // To create space in Columns/Rows
          SizedBox(
            height: 75,
          ),
          Ball(),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}

// stateful widget to hold the 8-ball that we want to update when tapped
class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  // variable to change the number of the ball images
  int ballNum = 1;

  // function to handle when the ball is clicked
  void changeBall() {
    print('Ball pressed, new image value is : $ballNum');
    // updates the state of the app
    setState(() {
      // will change the ball# to a random num from 1-5
      ballNum = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // wrap the ball image in a flatButton to make it clickable
    return FlatButton(
      onPressed: () {
        // call the changeBall function when pressed
        changeBall();
      },
      child: Image.asset('images/ball$ballNum.png'),
    );
  }
}
