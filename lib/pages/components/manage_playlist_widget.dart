import 'package:flutter/material.dart';

class ManageQueueWidget extends StatelessWidget {
  // Управление воспроизведением текущего плейлиста
  final int random, repeat, single;

  ManageQueueWidget(this.random, this.repeat, this.single);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 15
      ),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[
          Text(
            "На очереди", 
            style: Theme.of(context).textTheme.headline1
          ),
          Container(
            height: 30,

            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.shuffle,
                    size: 21,
                    color: random==1?Colors.green:Colors.grey
                  ),
                  onPressed: (){
                    print("Произошло нажатие на кнопку");
                  }
                ),
                IconButton(
                  icon: Icon(
                    repeat==1&&single==1?Icons.repeat_one:Icons.repeat,
                    size: 21,
                    color: repeat==1||single==1?Colors.green:Colors.grey
                  ),
                  onPressed: (){
                    print("Произошло нажатие на кнопку");
                  }
                ),
                IconButton(
                  icon: Icon(
                    Icons.save,
                    size: 21,
                    color: Colors.grey
                  ), 
                  onPressed: (){
                    _showSaveDialog(context);
                  }
                ),
              ],
            ),
          )
        ],
      ),     
    );
  }

  Future _showSaveDialog(context) {
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
                    'Создать плейлист',
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
                            vertical: 1, horizontal: 5),
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
                        hintText: 'Имя плейлиста',
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