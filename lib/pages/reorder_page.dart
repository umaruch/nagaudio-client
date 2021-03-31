import 'package:flutter/material.dart';

class ReorderPage extends StatefulWidget {
  ReorderPage({Key key}) : super(key: key);

  @override
  _ReorderPageState createState() => _ReorderPageState();
}

class _ReorderPageState extends State<ReorderPage> {
  List<String> _products =
      List.generate(100, (index) => "Product ${index.toString()}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kindacode.com'),
      ),
      body: ReorderableListView.builder(
          itemCount: _products.length,
          itemBuilder: (context, index) {
            final String productName = _products[index];
            return Card(
              key: ValueKey(productName),
              color: Colors.amberAccent,
              elevation: 1,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                contentPadding: EdgeInsets.all(25),
                title: Text(
                  productName,
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(Icons.drag_handle),
                onTap: () {/* Do something else */},
              ),
            );
          },
          // The reorder function
          onReorder: (oldIndex, newIndex) {
            setState(
              () {
                if (newIndex > oldIndex) {
                  newIndex = newIndex - 1;
                }
                final element = _products.removeAt(oldIndex);
                _products.insert(newIndex, element);
              },
            );
          }),
    );
  }
}
