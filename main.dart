import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => FirstScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => SecondScreen(),
    },
  ));
}
class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children:[
          Container(
            child:  Center(
              child: SpinKitCubeGrid(
                color: Colors.black,
                size: 80.0,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,

            child: RaisedButton(
                color: Colors.white,

                elevation: 0,
                hoverElevation: 0,
                focusElevation: 0,
                highlightElevation: 0,


                child: Text("Celebrity tour", style: TextStyle(fontSize: 25),),


                onPressed: () {
                  // Navigate to the second screen using a named route.
                  Navigator.pushNamed(context, '/second');
                }),
          ),
        ],
      ),



      //Navigator.pushNamed(context, '/home');

    );
  }
}






void gallery(){
  print("gallery");
}


void camera(){
  print("camera");
}


class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    print(width);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text("Celebrity tour")),
        backgroundColor: Colors.blueGrey[700],

      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              child: ButtonTheme(
                minWidth: width / 2,
                height: 50.0,
                child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        gallery();
                      });
                    },
                    color: Colors.blueGrey[600],
                    child: Icon(Icons.photo_album)
                ),
              ),
            ),

          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(

              child: ButtonTheme(
                minWidth: width / 2,
                height: 50.0,
                child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        camera();
                      });
                    },
                    color: Colors.blueGrey[600],
                    child: Icon(Icons.camera)
                ),
              )

              ,
            ),

          ),
        ],
      ),

    );
  }


}