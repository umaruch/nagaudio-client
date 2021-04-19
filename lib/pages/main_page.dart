import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nagaudio/models/playlist.dart';
import 'package:nagaudio/pages/radio_page.dart';
import 'package:nagaudio/widgets/bottom_actions_widget.dart';
import 'package:nagaudio/widgets/duration_widget.dart';
import 'package:nagaudio/widgets/music_actions_widget.dart';
import 'package:nagaudio/widgets/music_slider_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
                                    onPressed: () {},
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
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ), //this right here
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        color: Colors.grey[850],
                                                      ),
                                                      height: 120,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Создать плейлист',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              height: 30,
                                                              child: TextField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              8),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                              .grey[
                                                                          800],
                                                                    ),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                              .grey[
                                                                          800],
                                                                    ),
                                                                  ),
                                                                  filled: true,
                                                                  hintText: '',
                                                                  hintStyle: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                  fillColor:
                                                                      Colors.grey[
                                                                          800],
                                                                ),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    child: Text(
                                                                      'Отмена',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  onTap: () {},
                                                                  child:
                                                                      Container(
                                                                    child: Text(
                                                                      'Сохранить',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.bold,
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
              padding: const EdgeInsets.only(right: 45),
              child: MusicActionsWidget(),
            ),
            SizedBox(
              height: 50,
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
                      showMaterialModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => RadioPage(
                          title: 'Выберите вход',
                          items: ['HD Player', 'S/PDIF-1', 'S/PDIF-2'],
                          selectedIndex: 0,
                        ),
                      );
                      break;
                    case 1:
                      showMaterialModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => RadioPage(
                          title: 'DeviceName',
                          items: [
                            'Сведения об устройстве',
                            'Настройки сети',
                            'ЦАП Фильтры',
                            'Сменить устройство'
                          ],
                          selectedIndex: 0,
                        ),
                      );
                      break;
                    case 2:
                      showMaterialModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => RadioPage(
                          title: 'ЦАП Фильтр',
                          items: [
                            'Sharp Roll-Off',
                            'Slow Roll-Off',
                            'Short Delay Sharp Roll-Off',
                            'Short Delay Slow Roll-Off Filter',
                            'Super Slow Roll-Off Filter',
                          ],
                          selectedIndex: 0,
                        ),
                      );
                      break;

                    case 4:
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
