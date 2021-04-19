import 'package:flutter/material.dart';
import 'package:nagaudio/widgets/output_widget.dart';

class FiltersPage extends StatefulWidget {
  FiltersPage({Key key}) : super(key: key);

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  int selectedTabIndex = 1;
  String title = '80%';
  String selectedOutput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Фильтры'),
        // elevation: 4,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildPhaseButton('Phase'),
                            buildOutputButton(),
                            buildPhaseButton('Mute'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            'Volume',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 350,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 50,
                            child: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.grey,
                                size: 80,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 130,
                            top: 15,
                            child: Container(
                              height: 40,
                              width: 80,
                              color: Colors.black,
                              child: Center(
                                child: Text(
                                  title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 40,
                            child: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: 80,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            'HPF',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildPhaseButton('Bessel'),
                            buildPhaseButton('10 Hz'),
                            buildPhaseButton('12 db/Oct'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            'LPF',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildPhaseButton('Link-Ril'),
                            buildPhaseButton('OFF'),
                            buildPhaseButton('12 db/Oct'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            OutputWidget(
              selectedOutput: selectedOutput,
              onSelect: (value) {
                setState(() {
                  selectedOutput = value;
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Padding buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: BottomNavigationBar(
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

  Container buildOutputButton() {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Row(
          children: [
            Text(
              'Output 1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
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
                                'Имя выхода',
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
              child: Icon(
                Icons.edit,
                color: Colors.grey,
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildPhaseButton(String title) {
    return Container(
      height: 30,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
