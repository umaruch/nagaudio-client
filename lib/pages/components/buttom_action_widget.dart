import 'package:flutter/material.dart';

import '../widgets/inputs_menu.dart';
import '../widgets/settings_menu.dart';

class ButtomActionPanel extends StatelessWidget {
  // Панель с выбором вкладок для главной страницы

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 10,
        left: 22,
        right: 22
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[
          // Кнопка открытия меню работы с плейлистами
          IconButton(
            icon: Icon(
              Icons.format_list_bulleted,
              size: 28,
              color: Colors.grey,
            ), 
            onPressed: (){
              Navigator.pushNamed(context, "/library");
            }
          ),
          // Кнопка открытия меню выбора входа
          IconButton(
            icon: Icon(
              Icons.settings_input_component,
              size: 28,
              color: Colors.grey,
            ), 
            onPressed: (){
              InputWidget().show(context);
            }
          ),
          // Кнопка меню выбора фильтра ЦАП
          IconButton(
            icon: Icon(
              Icons.equalizer,
              size: 28,
              color: Colors.grey,
            ), 
            onPressed: (){
              // Navigator.pushNamed(context, "/mixer");
            }
          ),
          // Кнопка меню настроек
          IconButton(
            icon: Icon(
              Icons.settings,
              size: 28,
              color: Colors.grey,
            ),  
            onPressed: (){
              SettingsMenuWidget().show(context);
            }
          ),
        ],
      )
    );
  }
}