import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:nagaudio/data.dart';
import 'package:nagaudio/models/device.dart';

class DeviceProperties extends StatelessWidget {

  Widget build(BuildContext context) {
    Device item = Provider.of<Data>(context).currentDevice;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Сведения об устройстве',
          style: Theme.of(context).textTheme.headline1
        ),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 800),

          child: SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 20,
                  ),
                  child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Имя устройства:',
                            style: Theme.of(context).textTheme.headline2
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                item.name,
                                style: Theme.of(context).textTheme.subtitle1
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              InkWell(
                                onTap: () {
                                  showEditNameDialog(context);
                                },
                                child: Icon(
                                  Icons.edit,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 20,
                  ),
                  child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Текущий профиль:',
                            style: Theme.of(context).textTheme.headline2
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Example1.xml",
                                style: Theme.of(context).textTheme.subtitle1
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              InkWell(
                                onTap: () {

                                },
                                child: Icon(
                                  Icons.edit,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                ),
                buildRowWidget(context, 'Авторов:', 3.toString()),
                buildRowWidget(context, 'Альбомов', 3.toString()),
                buildRowWidget(context, 'Песен', 3.toString()),
                buildRowWidget(context, 'Время проигрывания', "12:34:21"),
                buildRowWidget(context, 'Время работы сервера', "0:12:04"),
                buildRowWidget(context, 'Общее время проигрывания треков', "56:32:12"),
                buildRowWidget(context, 'Последнее обновление базы данных', "12.12.2012"),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      Container(
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                          child: TextButton(
                            onPressed: () {
                            },
                            child: Text(
                              'Обновить БД',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                          child: TextButton(
                            onPressed: () {
                            },
                            child: Text(
                              'Перезагрузить устройство',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future showEditNameDialog(BuildContext context) {
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
                    'Имя устройства',
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

  Padding buildRowWidget(BuildContext context, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline2
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                description,
                style: Theme.of(context).textTheme.subtitle1
              ),
            ],
          ),
        ],
      ),
    );
  }
}
