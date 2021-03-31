import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  RadioPage({Key key}) : super(key: key);

  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Выберите вход',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AppRadioButton(title: 'Text1', value: _value),
            AppRadioButton(title: 'Text2', value: _value),
            AppRadioButton(title: 'Text3', value: _value),
          ],
        ),
      ),
    );
  }
}

class AppRadioButton extends StatefulWidget {
  const AppRadioButton({
    Key key,
    @required this.value,
    @required this.title,
  }) : super(key: key);

  final String title;
  final int value;

  @override
  _AppRadioButtonState createState() => _AppRadioButtonState();
}

class _AppRadioButtonState extends State<AppRadioButton> {
  int value = 0;
  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: RadioListTile(
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text(widget.title),
        value: value,
        groupValue: value,
        onChanged: (value) {
          setState(() {
            this.value = value;
          });
        },
        // leading: Text(
        //   'HD Player',
        //   style: Theme.of(context)
        //       .textTheme
        //       .subtitle1
        //       .copyWith(color: widget.index == 1 ? Colors.green : Colors.grey),
        // ),
        // title: Radio(
        //   value: widget.index,
        //   groupValue: value,
        //   activeColor: Colors.green,
        //   onChanged: (bool value) {
        //     setState(() {
        //       this.value = value;
        //     });
        //     return false;
        //   },
        // ),
      ),
    );
  }
}
