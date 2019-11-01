import 'package:flutter/material.dart';
import 'package:miocardio/dashboard/home.dart';
import 'package:miocardio/util/const.dart' as Constant;

class Login extends StatefulWidget{
	LoginState createState() => LoginState();

}
class LoginState extends State<Login>{

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Constant.BG_COLOR,
			body: Container(
				padding: EdgeInsets.all(30),
				child: Form(
					child: ListView(
						shrinkWrap: true,
						children: <Widget>[
							showLogo(),
							showEmail(),
							showPassword(),
							showSaveButton(),
						],
					),
				),
			),
		);
	}

	Widget showLogo() {
		return Image(image: AssetImage('assets/logo.png'), width: 400, height: 200);
	}

	Widget showEmail() {
		return
			TextFormField(
					decoration: InputDecoration(
						labelText: 'Email',
						hoverColor: Colors.white,
						icon: new Icon(
							Icons.mail,
							color: Colors.grey,
						)),
				);
	}

	Widget showPassword() {
		return
			TextFormField(
					decoration: InputDecoration(
						labelText: 'Senha',
						hoverColor: Colors.white,
							icon: new Icon(
								Icons.lock,
								color: Colors.grey,
							),
					),
					obscureText: true,
			);
	}

	Widget showSaveButton() {
		return
			FlatButton(
				padding: EdgeInsets.only(top: 0.0),
				shape: Border.all(width: 0.5, color: Colors.red),
				color: Color.fromRGBO(249, 124, 124, 1),
				child: Text('Salvar',
					style: TextStyle(
						color: Colors.white,
					),
				),
				onPressed: (){
					Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
				});
	}
/*
	Widget showRoundedButton() {
		return new Padding(
				padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
				child: SizedBox(
					height: 40.0,
					child: new RaisedButton(
						elevation: 5.0,
						shape: new RoundedRectangleBorder(
								borderRadius: new BorderRadius.circular(30.0)),
						color: Colors.pinkAccent,
						child: new Text(_isLoginForm ? 'Login' : 'Create account',
								style: new TextStyle(fontSize: 20.0, color: Colors.white)),
						onPressed: validateAndSubmit,
					),
				));
	}

	Widget showSecondaryButton() {
		return new FlatButton(
				child: new Text(
						_isLoginForm ? 'Create an account' : 'Have an account? Sign in',
						style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
				onPressed: toggleFormMode);
	}

	Widget showCircularProgress() {
		if (_isLoading) {
			return Center(child: CircularProgressIndicator());
		}
		return Container(
			height: 0.0,
			width: 0.0,
		);
	}

	void toggleFormMode() {
		resetForm();
		setState(() {
			_isLoginForm = !_isLoginForm;
		});
	}
	*/
}