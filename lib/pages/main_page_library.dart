import 'package:flutter/material.dart';
import 'package:nagaudio/models/menu_item.dart';
import 'package:nagaudio/models/playlist.dart';
import 'package:nagaudio/pages/browser_page.dart';
import 'package:nagaudio/pages/main_page.dart';
import 'package:nagaudio/widgets/alert_menu_widget.dart';
import 'package:nagaudio/widgets/alert_textfield_widget.dart';

class MainPageLibrary extends StatefulWidget {
  MainPageLibrary({Key key}) : super(key: key);

  @override
  _MainPageLibraryState createState() => _MainPageLibraryState();
}

class _MainPageLibraryState extends State<MainPageLibrary> {
  List<Playlist> items = Playlist.stubItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                      onTap: () {
                        Navigator.pop(context);
                      },
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Плейлисты',
                    style: TextStyle(),
                  ),
                  Icon(
                    Icons.update,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 1,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20, right: 20),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       hintText: 'Плейлисты',
            //       hintStyle: TextStyle(
            //         color: Colors.white,
            //       ),
            //       suffixIcon: Icon(
            //         Icons.update,
            //         color: Colors.white,
            //         size: 20,
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
              child: ListView.builder(
                itemExtent: 44,
                itemCount: items.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == items.length) {
                    return ListTile(
                      leading: Icon(
                        Icons.folder,
                        color: Colors.grey,
                        size: 35,
                      ),
                      title: Text(
                        'Проводник',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BrowserPage(
                                // item: item,
                                ),
                          ),
                        );
                      },
                    );
                  }
                  final item = items[index];
                  return ListTile(
                    leading: Icon(
                      Icons.playlist_play,
                      color: Colors.grey,
                      size: 40,
                    ),
                    title: Text(
                      item.name,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      final menuItems = [
                        MenuItem('Воспроизвести', Icons.playlist_add),
                        MenuItem('Добавить в очередь', Icons.add),
                        MenuItem('Переименовать', Icons.edit),
                        MenuItem('Удалить', Icons.delete),
                      ];
                      AlertMenuWidget(
                        title: null,
                        items: menuItems,
                        onSelected: (value) {
                          Navigator.of(context).pop();
                          final index = menuItems.indexOf(value);
                          switch (index) {
                            case 0:
                              break;
                            case 1:
                              break;
                            case 2:
                              AlertTextfieldWidget(
                                title: 'Переименовать плейлист',
                                text: '',
                                hint: 'Имя плейлиста',
                                onCancel: () {
                                  Navigator.of(context).pop();
                                },
                                onSave: (value) {
                                  Navigator.of(context).pop();
                                },
                              ).show(context);
                              break;
                            case 3:
                              showRemoveDialog(context);
                              break;
                            default:
                          }
                        },
                      ).show(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future showPlaylistDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: Dialog(
            backgroundColor: Colors.grey[850],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ), //this right here
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[850],
              ),
              height: 220,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainPage(
                              item: Playlist.stubItems().first,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.play_arrow),
                            color: Colors.grey,
                            iconSize: 25,
                            onPressed: () {},
                          ),
                          Text(
                            'Воспроизвести',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.add),
                          color: Colors.grey,
                          iconSize: 25,
                          onPressed: () {},
                        ),
                        Text(
                          'Добавить в очередь',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        showRenameDialog(context);
                      },
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            color: Colors.grey,
                            iconSize: 25,
                            onPressed: null,
                          ),
                          Text(
                            'Переименовать',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showRemoveDialog(context);
                      },
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.grey,
                            iconSize: 25,
                            onPressed: null,
                          ),
                          Text(
                            'Удалить',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future showRenameDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ), //this right here
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey[850],
            ),
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        contentPadding: const EdgeInsets.symmetric(
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
                        hintStyle: TextStyle(color: Colors.grey),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
  }

  Future showRemoveDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ), //this right here
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey[850],
            ),
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Удалить плейлист',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            'Ок',
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
  }
}
