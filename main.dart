import 'package:flutter/material.dart';

void gallery(){
  print("gallery");
}


void camera(){
  print("camera");
}
void main() {
  runApp(MaterialApp(
    home: Home(),
  ),);
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery. of(context). size. width;
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
                   minWidth: width/2,
                    height: 50.0,
                    child: RaisedButton(
                    onPressed: (){
                      gallery();
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
                minWidth: width/2,
                height: 50.0,
                child: RaisedButton(
                onPressed: (){
                  camera();
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


