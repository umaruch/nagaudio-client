import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:nagaudio/widgets/output_widget.dart';
import 'package:awesome_slider/awesome_slider.dart';

class EqualizerPage extends StatefulWidget {
  EqualizerPage({Key key}) : super(key: key);

  @override
  _EqualizerPageState createState() => _EqualizerPageState();
}

class _EqualizerPageState extends State<EqualizerPage> {
  double slider1Value = 80;
  double slider2Value = 20;
  double slider3Value = 55;
  double slider4Value = 70;
  double slider5Value = 60;

  String selectedOutput = '1';

  double noiseSliderValue = 0;
  double sinSliderValue = 80;

  bool select1 = true;
  bool select2 = true;
  bool select3 = true;
  bool select4 = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.85;
    return Scaffold(
      appBar: AppBar(
        title: Text('Эквалайзер'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildVoiceButton('Phase', select1, () {
                      setState(() {
                        select1 = !select1;
                      });
                    }),
                    buildOutputButton(),
                    buildVoiceButton('Mute', select2, () {
                      setState(() {
                        select2 = !select2;
                      });
                    }),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: (width - 75) / 2,
                          left: 0,
                          right: 0,
                          child: DottedLine(
                            dashColor: Colors.grey,
                          ),
                        ),
                        Positioned(
                          child: Transform(
                            alignment: FractionalOffset.center,
                            transform: Matrix4.identity()
                              ..rotateZ(90 * 3.1415927 / 180),
                            child: Container(
                              width: width,
                              height: width,
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      awesomeSlider(
                                          slider1Value,
                                          '-8.0 db\n2.215\n14 kHz',
                                          width, (value) {
                                        setState(() {
                                          slider1Value = value;
                                        });
                                      }),
                                      awesomeSlider(
                                          slider2Value,
                                          '-8.0 db\n2.215\n3 kHz',
                                          width, (value) {
                                        setState(() {
                                          slider2Value = value;
                                        });
                                      }),
                                      awesomeSlider(
                                          slider3Value,
                                          '-8.0 db\n2.215\n910 Hz',
                                          width, (value) {
                                        setState(() {
                                          slider3Value = value;
                                        });
                                      }),
                                      awesomeSlider(
                                          slider4Value,
                                          '-8.0 db\n2.215\n230 Hz',
                                          width, (value) {
                                        setState(() {
                                          slider4Value = value;
                                        });
                                      }),
                                      awesomeSlider(
                                          slider5Value,
                                          '-8.0 db\n2.215\n60 Hz',
                                          width, (value) {
                                        setState(() {
                                          slider5Value = value;
                                        });
                                      }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildVoiceButton('Reset', select3, () {
                            setState(() {
                              select3 = !select3;
                            });
                          }),
                          buildVoiceButton('Bypass', select4, () {
                            setState(() {
                              select4 = !select4;
                            });
                          }),
                        ],
                      ),
                    ),
                    SizedBox(
                      // height: 10,
                      height: 80,
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
                    buildSliderValue(Icons.volume_off, noiseSliderValue,
                        (value) {
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
                  ],
                ),
              ),
            ),
            OutputWidget(
              selectedOutput: selectedOutput,
              onSelect: (value) {
                setState(
                  () {
                    selectedOutput = value;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget awesomeSlider(double valueOnTextWidget, String title, double width,
      Function(double) onChanged) {
    return Row(
      children: [
        Container(
          child: AwesomeSlider(
            value: valueOnTextWidget,
            min: 0,
            max: 100,
            sliderWidth: width - 100,
            thumbSize: 30,
            thumbColor: Colors.grey,
            roundedRectangleThumbRadius: 0,
            topLeftShadow: false,
            topLeftShadowColor: Colors.transparent,
            topLeftShadowBlur: MaskFilter.blur(BlurStyle.normal, 8),
            bottomRightShadow: false,
            bottomRightShadowColor: Colors.black.withOpacity(0.5),
            bottomRightShadowBlur: MaskFilter.blur(BlurStyle.normal, 7),
            activeLineStroke: 3,
            activeLineColor: Colors.grey,
            inactiveLineColor: Colors.grey,
            child: Center(
              child: Container(
                color: Colors.green[300],
                height: 20,
                width: 6,
              ),
            ),
            onChanged: onChanged,
          ),
        ),
        Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()..rotateZ(90 * 3.1415927 / 60),
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
      ],
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

  Widget buildVoiceButton(String title, bool selected, Function onChanged) {
    return Container(
      height: 31,
      width: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: selected == true ? Colors.grey : Colors.green[300]),
      child: TextButton(
        onPressed: () {
          onChanged();
        },
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
