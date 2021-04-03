import 'package:flutter/material.dart';
import 'package:nagaudio/pages/main_page_library.dart';

class BrowserPage extends StatefulWidget {
  BrowserPage({Key key}) : super(key: key);

  @override
  _BrowserPageState createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainPageLibrary()),
                    );
                  },
                ),
                Text(
                  'Проводник',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0,
            child: Divider(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 18,
            ),
            child: Row(
              children: [
                Text(
                  'Home > Directory 1',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Container(
              height: 150,
              child: Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: IconButton(
                          icon: Icon(
                            Icons.folder,
                            size: 40,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('Directory 4')
                    ],
                  ),
                  Positioned(
                    top: 40,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: IconButton(
                            icon: Icon(
                              Icons.audiotrack,
                              size: 40,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('The Only One'),
                            Text(
                              'The Black Keys',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 80,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: IconButton(
                            icon: Icon(
                              Icons.audiotrack,
                              size: 40,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Doing It To Death'),
                            Text(
                              'The Kills',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
