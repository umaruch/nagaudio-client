import 'package:flutter/material.dart';
import 'package:nagaudio/widgets/output_widget.dart';

class EqualizerPage extends StatefulWidget {
  EqualizerPage({Key key}) : super(key: key);

  @override
  _EqualizerPageState createState() => _EqualizerPageState();
}

class _EqualizerPageState extends State<EqualizerPage> {
  int selectedTabIndex = 2;
  String selectedOutput;
  double noiseSliderValue = 10;
  double sinSliderValue = 20;
  double val = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Эквалайзер'),
      ),
      body: SafeArea(
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
                      buildVoiceButton('Phase'),
                      buildOutputButton(),
                      buildVoiceButton('Mute'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                color: Colors.red,
                height: 150,
                width: 250,
                child: Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()..rotateZ(90 * 3.1415927 / 180),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.grey,
                          inactiveTrackColor: Colors.grey,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          thumbColor: Colors.grey,
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 15),
                        ),
                        child: Slider(
                          value: val.toDouble(),
                          min: 1,
                          max: 10,
                          label: '$val',
                          onChanged: (double newValue) {
                            setState(() {
                              val = newValue;
                            });
                          },
                        ),
                      ),

                      // buildSliderVertical(),
                      // buildSliderVertical(),
                      // buildSliderVertical(),
                      // buildSliderVertical(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text('aas'),
              Text('aas'),
              Text('aas'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildVoiceButton('Reset'),
                    buildVoiceButton('Bypass'),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'W. Noise',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${noiseSliderValue.toInt().toString()}%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              buildSliderValue(Icons.volume_off, noiseSliderValue, (value) {
                setState(() {
                  noiseSliderValue = value;
                });
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sin 1kHz',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${sinSliderValue.toInt().toString()}%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              buildSliderValue(Icons.volume_up, sinSliderValue, (value) {
                setState(() {
                  sinSliderValue = value;
                });
              }),
              SizedBox(
                height: 40,
              ),
              OutputWidget(
                  selectedOutput: selectedOutput,
                  onSelect: (value) {
                    setState(() {
                      selectedOutput = value;
                    });
                  }),

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Выходы',
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 4),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(8),
              //     child: Column(
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             buildNumbers('1'),
              //             buildNumbers('3'),
              //             buildNumbers('5'),
              //             buildNumbers('7'),
              //             buildNumbers('9'),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 4,
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             buildNumbers('2'),
              //             buildNumbers('4'),
              //             buildNumbers('6'),
              //             buildNumbers('8'),
              //             buildNumbers('10'),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  // Slider buildSliderVertical() {
  //   SliderTheme(
  //     data: SliderTheme.of(context).copyWith(
  //       activeTrackColor: Colors.white,
  //       thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
  //       overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
  //     ),
  //     child: Slider(
  //       value: val.toDouble(),
  //       min: 1,
  //       max: 50,
  //       label: '$val',
  //       onChanged: (double newValue) {
  //         setState(() {
  //           val = newValue;
  //         });
  //       },
  //     ),
  //   );
  // }

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

  Padding buildSliderValue(
      IconData icon, double value, Function(double) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            value == 0 ? Icons.volume_off : Icons.volume_up,
            color: value == 0 ? Colors.green[300] : Colors.white,
            size: 25,
          ),
          Expanded(
            child: Slider(
              value: value,
              min: 0,
              max: 100,
              activeColor: Colors.green[300],
              inactiveColor: Colors.grey,
              onChanged: onChanged,
            ),
          ),
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

  Container buildVoiceButton(String title) {
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