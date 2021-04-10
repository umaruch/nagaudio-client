import 'package:flutter/material.dart';
import 'package:nagaudio/pages/menu_page.dart';

class MixerPage extends StatefulWidget {
  MixerPage({
    Key key,
  }) : super(key: key);

  @override
  _MixerPageState createState() => _MixerPageState();
}

class _MixerPageState extends State<MixerPage> {
  int selectedTabIndex = 0;
  int selected = 1;
  bool isActive = true;
  double playerValue = 80;
  double pdifOneValue = 50;
  double pdifTwoValue = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
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
                            MaterialPageRoute(builder: (context) => MenuPage()),
                          );
                        },
                      ),
                      Text(
                        'Миксер',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: isActive == true ? Colors.green[300] : Colors.grey,
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isActive = !isActive;
                        });
                      },
                      child: Text(
                        'Active',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'HD Player',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  InkWell(
                    onTap: () {
                      showEditDialog(context);
                    },
                    child: Icon(
                      Icons.edit,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    'HD-Player',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.volume_up,
                    color: Colors.white,
                    size: 25,
                  ),
                  Expanded(
                    child: Slider(
                      value: playerValue,
                      min: 0,
                      max: 100,
                      activeColor: Colors.green[300],
                      inactiveColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          playerValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    'S/PDIF-1',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.volume_up,
                    color: Colors.white,
                    size: 25,
                  ),
                  Expanded(
                    child: Slider(
                      value: pdifOneValue,
                      min: 0,
                      max: 100,
                      activeColor: Colors.green[300],
                      inactiveColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          pdifOneValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    'S/PDIF-2',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.volume_up,
                    color: Colors.white,
                    size: 25,
                  ),
                  Expanded(
                    child: Slider(
                      value: pdifTwoValue,
                      min: 0,
                      max: 100,
                      activeColor: Colors.green[300],
                      inactiveColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          pdifTwoValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Пресеты входов',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 1;
                        });
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                          color:
                              selected == 1 ? Colors.green[300] : Colors.grey,
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 2;
                        });
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color:
                              selected == 2 ? Colors.green[300] : Colors.grey,
                        ),
                        child: Center(
                          child: Text(
                            '2',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 3;
                        });
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            color: selected == 3
                                ? Colors.green[300]
                                : Colors.grey),
                        child: Center(
                          child: Text(
                            '3',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedTabIndex,
        selectedItemColor: Colors.green,
        elevation: 0,
        backgroundColor: Colors.grey[900],
        onTap: (value) {
          setState(() {
            selectedTabIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image(
              height: 30,
              image: AssetImage('assets/icons/dsp_mixer.png'),
            ),
            activeIcon: Image(
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
            activeIcon: Image.asset(
              'assets/icons/dsp_delay_active.png',
              height: 30,
            ),
            label: 'Задержка',
          )
        ],
      ),
    );
  }

  Future showEditDialog(BuildContext context) {
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
                    'Имя пресета',
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
                            vertical: 5, horizontal: 5),
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
                        hintText: 'Текущее имя',
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
}
