import 'package:flutter/material.dart';
import 'package:miocardio/util/const.dart' as Constant;

class Dashboard extends StatefulWidget{
  DashboardState createState() => DashboardState();

}

class DashboardState extends State<Dashboard>{
List<String> vetTeste=["Miguela","Alice","Julia","Gabriel","Laura"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constant.BG_COLOR,
        appBar: AppBar(
          title: const Text('Teste de appbar'),
          backgroundColor: Constant.BG_COLOR,
        ),
        body:  Column(
            children: <Widget>[
              
              Expanded(
                child:ListView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  itemCount: altura(vetTeste.length),
                  itemBuilder: (BuildContext context,int index){
                      //return Text('${(index+1)*2}');
                      if(((index+1)*2) < vetTeste.length+1){    
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[ 
                          Padding(
                            padding: EdgeInsets.only(left: 2,top: 6,right: 10,bottom: 2),
                            child: Container(
                              height: 100,
                              width: 100,
                              color:Colors.pink[100],
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Container(
                                  color:Colors.pink[50],
                                  child: Center(
                                    child: Text('${vetTeste[index*2]}', ),
                                  )
                                ),

                              ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10,top: 6,right: 2,bottom: 2),
                          child:Container(
                              height: 100,
                              width: 100,
                              color:Colors.pink[100],
                              child: Padding(padding: EdgeInsets.all(4.0),
                                child: Container(color:Colors.pink[50],
                                  child: Center(
                                    child: Text('${vetTeste[index*2+1]}',
                                    )
                                  
                                  ),

                                ),

                             ),
                            ),
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
                            child: Container(
                              height: 100,
                              width: 100,
                            
                              color:Colors.pink[100],
                              child: Padding(padding: EdgeInsets.all(4.0),
                                child: Container(color:Colors.pink[50],
                                  child: Center(
                                  child: Text('${vetTeste[index*2]}',),
                                  )
                                ),

                              ),
                            ),
                          ),
                          Padding(
                             padding: EdgeInsets.only(left: 10,top: 6,right: 2,bottom: 2),
                            child: Container(
                              height: 100,
                              width: 100,
                              child:Icon(Icons.add,
                                  color: Colors.pink,
                                  size: 50.0,
                              )
                            )
                          )
                        ]
                        );
                      }
                      else{
                        return Padding(
                             padding: EdgeInsets.only(left: 0,top: 6,right: 120,bottom: 2),
                              child: Icon(Icons.add,
                                color: Colors.pink,
                                size: 50.0,
                              )
                        );

                      }
                  },
                
                ),
              ),
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



}


