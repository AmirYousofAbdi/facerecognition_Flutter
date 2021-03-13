import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:run_app/camera.dart';
import 'package:run_app/galery.dart';

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
      '/camera': (context) => Camera(),
      '/galery': (context) => GalleryAccess(),
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













class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Color gradientStart = Colors.purple[500]; //Change start gradient color here
  Color gradientEnd = Colors.blue[700];

  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    print(width);
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text("Celebrity tour", style: TextStyle(color: Colors.white),),),
        backgroundColor: Colors.blue[500],

      ),
      body:Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [gradientEnd, gradientStart])
        ),
        child: Stack(
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
                        Navigator.pushNamed(context, '/camera');
                      });
                    },
                    color: Colors.blue[500],
                    child: Icon(Icons.add_a_photo)
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
                        Navigator.pushNamed(context, '/galery');
                      });
                    },
                    color: Colors.blue[500],
                    child: Icon(Icons.photo_album)
                ),
              )

              ,
            ),

          ),
          Align(

            child: Center(child: Text("Nothing selected", style: TextStyle(fontFamily: 'Montserrat' ,fontSize: 25, color:Colors.white),)),


          ),




        ],
    ),
      ),


    );
  }


}