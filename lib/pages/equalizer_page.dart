import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:nagaudio/widgets/alert_textfield_widget.dart';
import 'package:nagaudio/widgets/output_widget.dart';

class EqualizerPage extends StatefulWidget {
  EqualizerPage({Key key}) : super(key: key);

  @override
  _EqualizerPageState createState() => _EqualizerPageState();
}

class _EqualizerPageState extends State<EqualizerPage> {
  double slider1Value = 30;
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
                          child: Container(
                            width: width,
                            height: width,
                            child: Row(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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

  Widget awesomeSlider(
      double value, String title, double width, Function(double) onChanged) {
    return Column(
      children: [
        SizedBox(
          height: 280,
          width: width / 5,
          child: FlutterSlider(
            tooltip:
                FlutterSliderTooltip(alwaysShowTooltip: false, disabled: true),
            handlerHeight: 34,
            handlerWidth: 44,
            axis: Axis.vertical,
            values: [value],
            rangeSlider: false,
            max: 100,
            min: 0,
            onDragging: (handlerIndex, lowerValue, upperValue) {
              onChanged(lowerValue);
            },
            handler: FlutterSliderHandler(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(3),
                type: MaterialType.canvas,
                color: Colors.grey,
                elevation: 10,
                child: Container(
                  margin: EdgeInsets.fromLTRB(8, 15, 8, 15),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    // borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            trackBar: FlutterSliderTrackBar(
              inactiveTrackBar: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.grey,
                border: Border.all(width: 3, color: Colors.grey),
              ),
              activeTrackBar: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey,
              ),
            ),
            handlerAnimation: FlutterSliderHandlerAnimation(
                curve: Curves.elasticOut,
                reverseCurve: Curves.bounceIn,
                duration: Duration(milliseconds: 500),
                scale: 1.0),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
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
                AlertTextfieldWidget(
                  title: 'Имя выхода',
                  text: '',
                  hint: 'Текущее имя',
                  onCancel: () {
                    Navigator.of(context).pop();
                  },
                  onSave: (value) {
                    Navigator.of(context).pop();
                  },
                ).show(context);
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
