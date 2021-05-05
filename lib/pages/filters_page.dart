import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nagaudio/widgets/alert_textfield_widget.dart';
import 'package:nagaudio/widgets/output_widget.dart';

import '../widgets/radio_sheet_widget.dart';

class FiltersPage extends StatefulWidget {
  FiltersPage({Key key}) : super(key: key);

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  String title = '80%';
  String selectedOutput = '1';

  var selectedInputItem = 'Bessel';
  final inputItemsBessel = [
    'Bessel',
    'Link-Ril',
    'Butter-W',
  ];

  var selectedInputScore = '12';
  final inputItemsScores = [
    '12',
    '18',
    '24',
    '30',
    '36',
    '42',
  ];

  bool select1 = true;
  bool select2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Фильтры'),
        // elevation: 5,
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
                    SizedBox(
                      height: 70,
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
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                // backgroundColor: Colors.transparent,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ), //this right here
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
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
                                              'HPF',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Flexible(
                                                  child: Icon(
                                                    Icons.arrow_back_ios,
                                                    size: 25,
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                    height: 30,
                                                    width: 100,
                                                    child: TextField(
                                                      textAlign:
                                                          TextAlign.center,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 5,
                                                                horizontal: 5),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .grey[900],
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .grey[900],
                                                          ),
                                                        ),
                                                        filled: true,
                                                        hintText: '10',
                                                        hintStyle: TextStyle(
                                                            color: Colors.grey),
                                                        fillColor:
                                                            Colors.grey[900],
                                                      ),
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 25,
                                                  ),
                                                ),
                                              ],
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
                                                        fontWeight:
                                                            FontWeight.bold,
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
                            child: Text(
                              'HPF',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
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
                            InkWell(
                                onTap: () {
                                  RadioSheetWidget(
                                    title: 'Тип фильтра',
                                    items: inputItemsBessel,
                                    selectedItem: selectedInputItem,
                                    onChanged: (value) {
                                      selectedInputItem = value;
                                    },
                                  ).show(context);
                                },
                                child: buildPhaseButton('Bessel')),
                            buildPhaseButton('10 Hz'),
                            InkWell(
                                onTap: () {
                                  RadioSheetWidget(
                                    title: 'db/Oct',
                                    items: inputItemsScores,
                                    selectedItem: selectedInputScore,
                                    onChanged: (value) {
                                      selectedInputItem = value;
                                    },
                                  ).show(context);
                                },
                                child: buildPhaseButton('12 db/Oct')),
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

  Widget buildPhaseButton(String title) {
    return Container(
      height: 31,
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
