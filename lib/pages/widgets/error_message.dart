// Стандартные модули
import 'package:flutter/material.dart';

SnackBar generateErrorMessage(String message){
  return SnackBar(
    content: Text(
      message,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18
      ),
    ),
    backgroundColor: Colors.grey[850],
    action: SnackBarAction(
      label: "ОК",
      onPressed: (){},
    ),
  );
}