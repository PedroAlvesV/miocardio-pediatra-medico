import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
	Widget build(BuildContext context) {
		return Scaffold(
		/*appBar: AppBar(
			title:Text("Login"),
			centerTitle: true,
			actions: <Widget>[
				FlatButton(
					child: Text(
					"CRIAR CONTA",
					style: TextStyle(
							fontSize: 15.0
						)
					),
					textColor: Colors.white,
					onPressed:(){}

				)

			],			

		),*/
		backgroundColor:Colors.pink[100],
		body:


			
			
			//Text("miocadio"),
			//SizedBox(height:80.0),
			 Form(
			child:ListView(
				padding: EdgeInsets.all(20),
				children:<Widget>[
					SizedBox(height:70.0),
					Center(
						child:Text("Miocardio",
							style: TextStyle(fontWeight: FontWeight.bold,
								fontSize: 50
							),
							
						)
					),
					Center(
						child:Text("pediatra",
							style: TextStyle(
							fontWeight: FontWeight.bold,
							fontSize: 40
							),
							
						)
					),
					SizedBox(height:90.0),
					
						

					TextFormField(
					
						decoration: InputDecoration(
							hintText: "E-mail",
						),
						keyboardType:TextInputType.emailAddress,
					),
					
					SizedBox(height:17.0),
					TextFormField(
					decoration: InputDecoration(
						hintText: "Senha",
					),
					obscureText: true,
					
					),
					
					
					SizedBox(height:17.0),
					Container(
						
						padding:EdgeInsets.only(left: 50,right:50 ),
						
						child: RaisedButton(
							child: Text("Entrar",
								style:TextStyle(
								fontSize:15.0,
								)						
							),
							textColor: Colors.white,
							color: Colors.pink[200],
							onPressed:(){}
						),
						
					),
					Align(
						alignment:Alignment.center,
						child: FlatButton(
							onPressed: (){},
							child:Text("Esqueci minha senha"),
							
						)
					),
				],
			)
			
		

		),
		);

	}


}
