import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new GalleryAccess(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GalleryAccess extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new GalleryAccessState();
  }
}

class GalleryAccessState extends State<GalleryAccess> {
  File galleryFile;

  @override

  Color gradientStart = Colors.purple[500]; //Change start gradient color here
  Color gradientEnd = Colors.blue[700];
  Widget build(BuildContext context) {
    //display image selected from gallery
    imageSelectorGallery() async {
      galleryFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
      setState(() {});
    }

    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text('Gallery Access')),
        backgroundColor: Colors.blue[500],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [gradientEnd, gradientStart])
        ),
        child: new Builder(
          builder: (BuildContext context) {
            return Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(

                    child: new Text('Select Image from Gallery', style: TextStyle(color: Colors.white),),
                    onPressed: imageSelectorGallery,
                    color: Colors.blue[700],
                  ),
                  SizedBox(
                    height: 200.0,
                    width: 300.0,
                    child: galleryFile == null
                        ? Center(child: new Text('Nothing selected!!', style: TextStyle(color: Colors.white),))
                        : Center(child: new Image.file(galleryFile)),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
