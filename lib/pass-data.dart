import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class ImagePreview extends StatefulWidget {
  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  var image;
  var newImage;
  bool _isPassedData = false;
  String descriptionText = '';
  String titleText = '';

  final titleTextClear = TextEditingController();
  final descriptionTextClear = TextEditingController();

  void clearText() {
    titleTextClear.clear();
    descriptionTextClear.clear();
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(),
      child: Consumer<MyProvider>(
        builder: (context, provider, child) {
          void newBlogPost() {
            setState(
              () {
                if (image != null) {
                  newImage = provider.image.path;
                  titleText;
                  descriptionText;
                  clearText();
                  _isPassedData = true;
                  image = null;
                }
              },
            );
          }

          return Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      width: 350,
                      height: 600,
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 8.0,
                          top: 4.0,
                        ),
                        child: Text(
                          'New Title',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.black,
                          width: 1.5,
                        ),
                      ),
                      width: 150,
                      height: 50,
                    ),
                    Positioned(
                      top: 30,
                      child: Container(
                        height: 570,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black,
                            width: 1.5,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                width: 350,
                                child: TextField(
                                  onChanged: (newTitle) {
                                    titleText = newTitle;
                                  },
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Color(0xFFc56e4f),
                                  ),
                                  controller: titleTextClear,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'New Title',
                                    hintStyle: TextStyle(
                                      fontSize: 20.0,
                                      color: Color(0xFFc56e4f),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 350,
                                child: TextField(
                                  maxLines: 9,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  onChanged: (newDescription) {
                                    descriptionText = newDescription;
                                  },
                                  controller: descriptionTextClear,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'New Description',
                                  ),
                                ),
                              ),
                              if (image != null)
                                Container(
                                  child: _isPassedData
                                      ? SizedBox(
                                          width: 0,
                                        )
                                      : Image.network(
                                          provider.image.path,
                                          width: 340,
                                          height: 250,
                                        ),
                                )
                              else
                                Container(
                                  child: FlatButton(
                                    minWidth: 340,
                                    height: 250,
                                    color: Color(0xFFe2b7a7),
                                    onPressed: () {
                                      setState(() async {
                                        image = await ImagePicker().getImage(source: ImageSource.gallery);
                                        provider.setImage(image);
                                      });
                                    },
                                    child: Column(children: [
                                      Icon(
                                        Icons.add,
                                        size: 100.0,
                                      ),
                                      Text('Image'),
                                    ]),
                                  ),
                                ),
                              if (image != null && titleText != '' && descriptionText != '')
                                Container(
                                  margin: const EdgeInsets.only(
                                    top: 10.0,
                                    left: 300.0,
                                  ),
                                  child: FlatButton(
                                    minWidth: 40,
                                    height: 40,
                                    color: Colors.green,
                                    onPressed: newBlogPost,
                                    child: null,
                                  ),
                                )
                              else
                                Container(
                                  margin: const EdgeInsets.only(
                                    top: 10.0,
                                    left: 300.0,
                                  ),
                                  child: FlatButton(
                                    minWidth: 40,
                                    height: 40,
                                    color: Colors.black26,
                                    onPressed: () {},
                                    child: null,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80.0,
                ),
                Stack(
                  children: [
                    Container(
                      width: 350,
                      height: 600,
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 8.0,
                          top: 4.0,
                        ),
                        child: Text(
                          'New Title',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.black,
                          width: 1.5,
                        ),
                      ),
                      width: 150,
                      height: 50,
                    ),
                    Positioned(
                      top: 30,
                      child: Container(
                        child: Container(
                          height: 570,
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 1.5,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 340,
                                  height: 50,
                                  child: _isPassedData
                                      ? Text(
                                          '$titleText',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Color(0xFFc56e4f),
                                          ),
                                        )
                                      : SizedBox(
                                          width: 1,
                                        ),
                                ),
                                Container(
                                  width: 340,
                                  height: 230,
                                  child: _isPassedData
                                      ? Text('$descriptionText')
                                      : SizedBox(
                                          width: 1,
                                        ),
                                ),
                                Container(
                                  child: _isPassedData
                                      ? Image.network(
                                          newImage,
                                          width: 340,
                                          height: 250,
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xffc4c4c4),
                                          ),
                                          width: 340,
                                          height: 250,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MyProvider extends ChangeNotifier {
  var image;

  Future setImage(img) async {
    this.image = img;
    this.notifyListeners();
  }
}
