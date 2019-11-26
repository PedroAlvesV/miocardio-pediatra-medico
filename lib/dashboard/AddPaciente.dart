import 'package:flutter/material.dart';
import 'package:miocardio/util/const.dart';
import 'package:miocardio/login/authentication.dart';
import 'package:path_provider/path_provider.dart';
import 'FileArquivo.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';

class AddPaciente extends StatefulWidget{
  List vetTeste;
  AddPaciente(this.vetTeste);

  AddPacienteState createState() => AddPacienteState(this.vetTeste);

}

class AddPacienteState extends State<AddPaciente>{
  List vetTeste;
  Map<String,dynamic> teste = Map();
  AddPacienteState(this.vetTeste);
  TextEditingController nomeController = TextEditingController();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*teste["nome"]= "Leonardo";
    teste["tipo"] = "masculino";
    vetTeste.add(teste);
    teste = Map();
     teste["nome"]= "pedro";
    teste["tipo"] = "masculino";
    vetTeste.add(teste);
    teste = Map();
    teste["nome"]= "juliana";
    teste["tipo"] = "feminina";
    vetTeste.add(teste);
    FileArquivo a =  new FileArquivo();
    a.CriaArquivo();
    a.SaveData(vetTeste);
    */
    
    
    

  }

  void salvarDados(){
    teste = Map();
    teste["nome"] = nomeController.text;
    vetTeste.add(teste);
    FileArquivo a =  new FileArquivo();
    a.CriaArquivo();
    a.SaveData(vetTeste);
     nomeController.text = "";


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: APPColors().background,
        appBar: AppBar(
          title: const Text('MiocardioPediatra'),
          backgroundColor: APPColors().loginButton,
          leading: BackButton(),
          centerTitle: true,
        ),
        body:  SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
          child:Column(        
            children: <Widget>[
              TextField(keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "nome",
                  labelStyle: TextStyle(color: Colors.pink[200]),
                  
                ),
                style: TextStyle(color: Colors.pink[200],fontSize: 20.0),
                controller: nomeController,
              ),
              RaisedButton(
                onPressed: (){
                  salvarDados();
                  Navigator.pop(context);
                  },
                child: Text("Salvar"),
                color: Colors.pink[100],
                
              )
              
              
           ],
          )  
    )
    );
  }
  




  



}




