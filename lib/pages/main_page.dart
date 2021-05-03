import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nagaudio/models/menu_item.dart';
import 'package:nagaudio/models/playlist.dart';
import 'package:nagaudio/widgets/alert_textfield_widget.dart';
import 'package:nagaudio/widgets/radio_sheet_widget.dart';
import 'package:nagaudio/widgets/bottom_actions_widget.dart';
import 'package:nagaudio/widgets/duration_widget.dart';
import 'package:nagaudio/widgets/alert_menu_widget.dart';
import 'package:nagaudio/widgets/music_actions_widget.dart';
import 'package:nagaudio/widgets/music_slider_widget.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// import '../models/menu_item.dart';
// import '../models/menu_item.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.item}) : super(key: key);

  final Playlist item;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isRandom = false;
  bool isRepeat = false;

  double durationSliderValue = 55;
  double soundSliderValue = 70;

  String timePassed = '3.26';
  String timeLeft = '4.43';

  Playlist item;
  // Song currentItem = Song('God\'s Favorite Customer', 'Father john Misty');

  // List<Song> items = Song.stubItems();

  final playlistItems = Playlist.stubItems()
      .map((e) => MenuItem(
            e.name,
            Icons.playlist_play,
          ))
      .toList();

  var selectedInputItem = 'HD Player';
  final inputItems = [
    'HD Player',
    'S/PDIF-1',
    'S/PDIF-2',
  ];

  var selectedDeviceNameItem;
  final deviceNameItems = [
    MenuItem('Сведения об устройстве', Icons.wifi),
    MenuItem('Настройки сети', Icons.wifi),
    MenuItem('ЦАП Фильтры', Icons.wifi),
    MenuItem('Сменить устройство', Icons.logout),
  ];

  var selectedFilterItem = 'Sharp Roll-Off';
  final filterItems = [
    'Sharp Roll-Off',
    'Slow Roll-Off',
    'Short Delay Sharp Roll-Off',
    'Short Delay Slow Roll-Off Filter',
    'Super Slow Roll-Off Filter',
  ];

  @override
  void initState() {
    super.initState();
    item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: item != null
                  ? ReorderableListView.builder(
                      // itemExtent: 60,
                      onReorder: (oldIndex, newIndex) {
                        setState(
                          () {
                            if (newIndex == 0) {
                              return;
                            }
                            oldIndex -= 1;
                            newIndex -= 1;
                            if (newIndex > oldIndex) {
                              newIndex = newIndex - 1;
                            }
                            final element = item.songs.removeAt(oldIndex);
                            item.songs.insert(newIndex, element);
                          },
                        );
                      },
                      padding: EdgeInsets.only(top: 0),
                      itemCount: item.songs.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return Column(
                            key: ValueKey(this.item.currentSong.songName),
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 50,
                                child: ListTile(
                                  title: Text(
                                    this.item.currentSong.songName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  subtitle: Text(
                                    this.item.currentSong.singerName,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.playlist_add,
                                      color: Colors.grey,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      AlertMenuWidget(
                                        title: 'Добавить в плейлист',
                                        items: playlistItems,
                                        onSelected: (value) {
                                          Navigator.of(context).pop();
                                        },
                                      ).show(context);
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 17,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'На очереди',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      child: Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.shuffle,
                                              size: 20,
                                              color: isRandom
                                                  ? Colors.green
                                                  : Colors.grey,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                isRandom = !isRandom;
                                              });
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.repeat_one,
                                              size: 20,
                                              color: isRepeat
                                                  ? Colors.green
                                                  : Colors.grey,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                isRepeat = !isRepeat;
                                              });
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.save,
                                              size: 20,
                                              color: Colors.grey,
                                            ),
                                            onPressed: () {
                                              AlertTextfieldWidget(
                                                title: 'Создать плейлист',
                                                text: '',
                                                hint: '',
                                                onCancel: () {
                                                  Navigator.of(context).pop();
                                                },
                                                onSave: (value) {
                                                  Navigator.of(context).pop();
                                                },
                                              ).show(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                        index -= 1;
                        final item = this.item.songs[index];
                        return SizedBox(
                          key: ValueKey(item.songName),
                          height: 60,
                          child: Slidable(
                            actionPane: SlidableDrawerActionPane(),
                            secondaryActions: <Widget>[
                              SlideAction(
                                child: Text(
                                  'Удалить',
                                  style: TextStyle(fontSize: 17),
                                ),
                                color: Colors.red[900],
                                onTap: () => print('Delete'),
                              ),
                            ],
                            child: ListTile(
                              title: Text(
                                item.songName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Text(
                                item.singerName,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.grey,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Container(),
            ),
            DurationWidget(
              durationSliderValue: durationSliderValue,
              timePassed: timePassed,
              timeLeft: timeLeft,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: MusicActionsWidget(),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: MusicSliderWidget(soundSliderValue: soundSliderValue),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: BottomActionsWidget(
                onTabSelected: (index) {
                  print(index);
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //   content: Text('Selected $index'),
                  // ));
                  switch (index) {
                    case 0:
                      RadioSheetWidget(
                        title: 'Выберите вход',
                        items: inputItems,
                        selectedItem: selectedInputItem,
                        onChanged: (value) {
                          selectedInputItem = value;
                        },
                      ).show(context);
                      break;
                    case 1:
                      break;
                    case 2:
                      RadioSheetWidget(
                        title: 'ЦАП Фильтр',
                        items: filterItems,
                        selectedItem: selectedFilterItem,
                        onChanged: (value) {
                          selectedFilterItem = value;
                        },
                      ).show(context);
                      break;
                    case 3:
                      AlertMenuWidget(
                        title: 'DeviceName',
                        items: deviceNameItems,
                        onSelected: (value) {
                          Navigator.of(context).pop();
                        },
                      ).show(context);
                      break;
                    default:
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
