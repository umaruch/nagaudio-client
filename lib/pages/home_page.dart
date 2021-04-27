import 'package:flutter/material.dart';
import 'package:nagaudio/pages/delay_page.dart';
import 'package:nagaudio/pages/equalizer_page.dart';
import 'package:nagaudio/pages/mixer_page.dart';
import 'filters_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    MixerPage(),
    FiltersPage(),
    EqualizerPage(),
    DelayPage(),
  ]; //Container()];

  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedTabIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedTabIndex,
        selectedItemColor: Colors.green[300],
        elevation: 0,
        backgroundColor: Colors.grey[900],
        onTap: (index) {
          setState(() {
            selectedTabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image(
              height: 30,
              image: AssetImage('assets/icons/dsp_mixer.png'),
            ),
            activeIcon: Image(
              color: Colors.green[300],
              height: 30,
              image: AssetImage('assets/icons/dsp_mixer_active.png'),
            ),
            label: 'Миксер',
          ),
          BottomNavigationBarItem(
            icon: Image(
              height: 30,
              image: AssetImage('assets/icons/dsp_filter.png'),
            ),
            activeIcon: Image(
              color: Colors.green[300],
              height: 30,
              image: AssetImage('assets/icons/dsp_filter_active.png'),
            ),
            label: 'Фильтры',
          ),
          BottomNavigationBarItem(
            icon: Image(
              height: 30,
              image: AssetImage('assets/icons/dsp_eq.png'),
            ),
            activeIcon: Image(
              color: Colors.green[300],
              height: 30,
              image: AssetImage('assets/icons/dsp_eq_active.png'),
            ),
            label: 'Эквалайзер',
          ),
          BottomNavigationBarItem(
            icon: Image(
              height: 30,
              image: AssetImage('assets/icons/dsp_delay.png'),
            ),
            activeIcon: Image(
              color: Colors.green[300],
              image: AssetImage('assets/icons/dsp_delay_active.png'),
              height: 30,
            ),
            label: 'Задержка',
          ),
        ],
      ),
    );
  }
}
