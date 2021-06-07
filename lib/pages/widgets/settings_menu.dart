import 'package:flutter/material.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nagaudio/pages/widgets/dac_profiles_menu.dart';
import 'package:provider/provider.dart';

import 'package:nagaudio/data.dart';

class SettingsMenuWidget extends StatelessWidget {

  show(BuildContext context){
    showMaterialModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => this
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,

      padding: EdgeInsets.only(bottom: 30),

      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 3),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: <Widget>[
            // Заголовок окна
            ListTile(
              dense: true,
              title: Text(
                Provider.of<Data>(context, listen: false).currentDevice.name,
                style: Theme.of(context).textTheme.headline3
              ),
            ),

            // Сведения об устройстве
            ListTile(
                dense: true,
                title: Text(
                    "Сведения об устройстве",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                leading: Icon(
                  Icons.dvr,
                  color: Colors.grey,
                  size: 21,
                ),
                onTap: (){
                  Navigator.pushNamed(context, "/device");
                },
              ),

            // Настройки сети
            ListTile(
                dense: true,
                title: Text(
                    "Настройки сети",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                leading: Icon(
                  Icons.network_wifi,
                  color: Colors.grey,
                  size: 21,
                ),
              ),

            // ЦАП фильтры
            ListTile(
                dense: true,
                title: Text(
                    "ЦАП фильтры",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                leading: Icon(
                  Icons.drag_indicator,
                  color: Colors.grey,
                  size: 21,
                ),
                onTap: (){
                  Navigator.pop(context);
                  DACProfileWidget().show(context);
                },
              ),
            
            // Поиск другого устройства
            ListTile(
                dense: true,
                title: Text(
                    "Сменить устройство",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.grey,
                  size: 21,
                ),
              )
          ],
        ),
      ),
    );
  }
}