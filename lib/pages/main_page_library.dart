import 'package:flutter/material.dart';
import 'package:nagaudio/models/library.dart';
import 'package:nagaudio/pages/browser_page.dart';
import 'package:nagaudio/pages/device_properties.dart';
import 'package:nagaudio/pages/network_settings_page.dart';

class MainPageLibrary extends StatefulWidget {
  MainPageLibrary({Key key}) : super(key: key);

  @override
  _MainPageLibraryState createState() => _MainPageLibraryState();
}

class _MainPageLibraryState extends State<MainPageLibrary> {
  List<Library> items = [
    Library('playlist_play', 'Аква-дискотека'),
    Library('playlist_playa', 'Комната грязи'),
    Library('playlist_play', 'Дворец в Италии'),
    Library('folder', 'Проводник'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Библиотека',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: Center(
                        child: Icon(
                          Icons.clear,
                          color: Colors.black,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Плейлисты',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                suffixIcon: Icon(
                  Icons.update,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),

//           SizedBox(
//             height: 240,
//             child: ReorderableListView.builder(
//               itemCount: items.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final String productName = 'items';
//                 return Card(
//                   key: ValueKey(productName),
//                   color: Colors.amberAccent,
//                   elevation: 1,
//                   margin: const EdgeInsets.all(10),
//                   child: ListTile(
//                     leading: IconButton(
//                         icon: Icon(
//                           Icons.ac_unit,
//                           color: Colors.grey,
//                           size: 30,
//                         ),
//                         onPressed: () {
//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return Dialog(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ), //this right here
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(10)),
//                                     color: Colors.grey[850],
//                                   ),
//                                   height: 120,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(10),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Переименовать плейлист',
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Container(
//                                           height: 30,
//                                           child: TextField(
//                                             decoration: InputDecoration(
//                                               contentPadding:
//                                                   const EdgeInsets.symmetric(
//                                                       vertical: 1,
//                                                       horizontal: 5),
//                                               focusedBorder: OutlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                   color: Colors.grey[800],
//                                                 ),
//                                               ),
//                                               enabledBorder: OutlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                   color: Colors.grey[800],
//                                                 ),
//                                               ),
//                                               filled: true,
//                                               hintText: 'Имя плейлиста',
//                                               hintStyle:
//                                                   TextStyle(color: Colors.grey),
//                                               fillColor: Colors.grey[800],
//                                             ),
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 15,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceAround,
//                                           children: [
//                                             InkWell(
//                                               onTap: () {
//                                                 Navigator.pop(context);
//                                               },
//                                               child: Container(
//                                                 child: Text(
//                                                   'Отмена',
//                                                   style: TextStyle(
//                                                     color: Colors.grey,
//                                                     fontSize: 18,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             InkWell(
//                                               onTap: () {},
//                                               child: Container(
//                                                 child: Text(
//                                                   'Сохранить',
//                                                   style: TextStyle(
//                                                     color: Colors.grey,
//                                                     fontSize: 18,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                           Text(
//                             items[index].buttonName,
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           );
//                         }
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.playlist_play),
                      color: Colors.grey,
                      iconSize: 40,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ), //this right here
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.grey[850],
                                ),
                                height: 120,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Переименовать плейлист',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 30,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 1, horizontal: 5),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.grey[800],
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.grey[800],
                                              ),
                                            ),
                                            filled: true,
                                            hintText: 'Имя плейлиста',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            fillColor: Colors.grey[800],
                                          ),
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              child: Text(
                                                'Отмена',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              child: Text(
                                                'Сохранить',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Text(
                      'Аква-дискотека',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.playlist_play),
                      color: Colors.grey,
                      iconSize: 40,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeviceProperties()),
                        );
                      },
                    ),
                    Text(
                      'Комната грязи',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.playlist_play),
                      color: Colors.grey,
                      iconSize: 40,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NetworkSettingsPage()),
                        );
                      },
                    ),
                    Text(
                      'Дворец в Италии',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.folder),
                      color: Colors.grey,
                      iconSize: 40,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BrowserPage()),
                        );
                      },
                    ),
                    Text(
                      'Проводник',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
