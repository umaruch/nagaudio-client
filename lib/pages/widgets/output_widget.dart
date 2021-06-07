import 'package:flutter/material.dart';

class OutputWidget extends StatefulWidget {
  OutputWidget({
    Key key,
    @required this.selectedOutput,
    @required this.onSelect,
  }) : super(key: key);

  final Function(String) onSelect;
  final String selectedOutput;

  @override
  _OutputWidgetState createState() => _OutputWidgetState();
}

class _OutputWidgetState extends State<OutputWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(
                'Выходы',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildNumbers('1'),
                    buildNumbers('3'),
                    buildNumbers('5'),
                    buildNumbers('7'),
                    buildNumbers('9'),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildNumbers('2'),
                    buildNumbers('4'),
                    buildNumbers('6'),
                    buildNumbers('8'),
                    buildNumbers('10'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNumbers(String title) {
    var isSelected = title == widget.selectedOutput;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: InkWell(
          onTap: () {
            widget.onSelect(title);
          },
          child: Container(
            height: 40,
            color: isSelected ? Colors.green[300] : Colors.grey,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
