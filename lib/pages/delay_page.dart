import 'package:flutter/material.dart';
import 'package:nagaudio/widgets/alert_textfield_widget.dart';
import 'package:nagaudio/widgets/output_widget.dart';

class DelayPage extends StatefulWidget {
  DelayPage({Key key}) : super(key: key);

  @override
  _DelayPageState createState() => _DelayPageState();
}

class _DelayPageState extends State<DelayPage> {
  String title = '10.4 ms';
  String cm = '351.1 cm';
  String inch = '139.4 inch';
  String selectedOutput = '1';

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
                            buildPhaseButton('Phase', select1, () {
                              setState(() {
                                select1 = !select1;
                              });
                            }),
                            buildOutputButton(),
                            buildPhaseButton('Mute', select2, () {
                              setState(() {
                                select2 = !select2;
                              });
                            }),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              cm,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              inch,
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
                                    fontSize: 18,
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
                      height: 50,
                    ),
                  ],
                ),
              ),
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

  Widget buildPhaseButton(String title, bool selected, Function onChanged) {
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
