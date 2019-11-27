import 'package:flutter/material.dart';
import 'package:miocardio/util/const.dart';
import 'package:miocardio/login/authentication.dart';
import 'package:path_provider/path_provider.dart';
import 'FileArquivo.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'AddPaciente.dart';

class Dashboard extends StatefulWidget{
  String userId;
  final BaseAuth auth;
  final VoidCallback logoutCallback;

  Dashboard({this.userId,this.auth, this.logoutCallback});

  DashboardState createState() => DashboardState();

}

class DashboardState extends State<Dashboard>{
//List<String> vetTeste=["Miguela","Alice","Julia","Gabriel","Laura"];
Map<String,dynamic> teste = Map();
List vetTeste= [];
void initState(){
      
   FileArquivo a =  new FileArquivo();

   a.CriaArquivo();
  
   a.ReadData().then((data){
     setState(() {
       vetTeste = json.decode(data);
    
     });
    
   });
  
    
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
        body:  Column(
            children: <Widget>[
              menuADD(),
              
              
           ],
          )  
    );
  }
  int altura(int NumroElemento ){
    if(((NumroElemento+1) % 2) == 0){
      return (((NumroElemento+1)/2)).toInt();
    }
    else {
      int alt = ((NumroElemento+1)/2).toInt() ;
      return alt +1;
    }


  }

  Widget menuADD(){
    return Expanded(
                child:ListView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  itemCount: altura(vetTeste.length),
                  itemBuilder: (BuildContext context,int index){
                      if(((index+1)*2) < vetTeste.length+1){    
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[ 
                          Padding(
                            padding: EdgeInsets.only(left: 2,top: 6,right: 10,bottom: 2),
                                child: GestureDetector(
                                  onTap: (){menuModalBottomSheet(index*2);},
                                  
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    color:Colors.pink[100],
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Container(
                                        color:Colors.pink[50],

                                        child:  Center(
                                          child: Text('${vetTeste[index*2]["nome"]}', ),
                                        )

                                    ),
                                  )
                                ),
                              ),
                              
                            
                          
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10,top: 6,right: 2,bottom: 2),
                          child: GestureDetector(  
                          onTap: (){menuModalBottomSheet(index*2+1);},
                          child:Container(
                              height: 100,
                              width: 100,
                              color:Colors.pink[100],
                              child: Padding(padding: EdgeInsets.all(4.0),
                                child: Container(color:Colors.pink[50],
                                  child: Center(
                                    child: Text('${vetTeste[index*2+1]["nome"]}',
                                    )
                                  
                                  ),

                                ),

                             ),
                            ),
                          )
                        )
                        ]
                        );
                      }
                       else if(((index+1)*2) == vetTeste.length+1){    
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                           Padding(
                            padding: EdgeInsets.only(left: 2,top: 6,right: 10,bottom: 2),
                            child: GestureDetector(  
                            onTap: (){menuModalBottomSheet(index*2);},
                            child: Container(
                              height: 100,
                              width: 100,
                            
                              color:Colors.pink[100],
                              child: Padding(padding: EdgeInsets.all(4.0),
                                child: Container(color:Colors.pink[50],
                                  child: Center(
                                  child: Text('${vetTeste[index*2]["nome"]}',),
                                  )
                                ),

                              ),
                            ),
                            )
                          ),
                          Padding(
                             padding: EdgeInsets.only(left: 10,top: 6,right: 2,bottom: 2),
                             
                            
                            child: Container(
                              height: 100,
                              width: 100,
                              child: GestureDetector (
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddPaciente(vetTeste)),);
                                },
                                child:Icon(Icons.add,
                                    color: Colors.pink,
                                    size: 50.0,
                                )
                              )
                            )
                            
                          )
                        ]
                        );
                      }
                      else{
                        return Padding(
                             padding: EdgeInsets.only(left: 0,top: 6,right: 120,bottom: 2),
                              child: GestureDetector (
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddPaciente(vetTeste)),);
                                },
                                child:Icon(Icons.add,
                                  color: Colors.pink,
                                  size: 50.0,
                                
                                )
                              )
                         );

                      }
                  },
                
                ),
              );
    



  }
  void menuModalBottomSheet(int posicao) {
    showModalBottomSheet(context:context,builder: (context){
      return Column(children: <Widget>[
        ListTile(
          title: Text("Nome: ${vetTeste[posicao]["nome"]}"),
        ),
         ListTile(
          title: Text("Idade: ${vetTeste[posicao]["idade"]}"),
        ),
        ListTile(
          title: Text("Peso: ${vetTeste[posicao]["peso"]}"),
        ),
      ],);

    });
  }

}
