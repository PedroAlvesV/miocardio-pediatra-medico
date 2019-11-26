import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
class FileArquivo{
  
  
  Future<File> CriaArquivo() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.jason");
  }
  
  Future<File> SaveData(List lista) async{
    String data = json.encode(lista);
    final file = await CriaArquivo();
    return file.writeAsString(data);


  }
  
  Future <String> ReadData() async{
  try{
    final file = await CriaArquivo();
    return file.readAsString();

  }
  catch(e){
    return null;

  }

  }

}
