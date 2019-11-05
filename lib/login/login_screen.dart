import 'package:flutter/material.dart';
import 'package:miocardio/util/const.dart';
import 'package:miocardio/login/authentication.dart';

class Login extends StatefulWidget{
	final BaseAuth auth;
	final VoidCallback loginCallback;

	Login({this.auth, this.loginCallback});

	LoginState createState() => LoginState();

}
class LoginState extends State<Login>{
	String _email;
	String _password;
	String _errorMessage;

	bool _isLoginForm;
	bool _isLoading;

	final _formKey = new GlobalKey<FormState>();

	bool validateAndSave() {
		final form = _formKey.currentState;
		if (form.validate()) {
			form.save();
			return true;
		}
		return false;
	}

	void validateAndSubmit() async {
		setState(() {
			_errorMessage = "";
			_isLoading = true;
		});
		if (validateAndSave()) {
			String userId = "";
			try {
				if (_isLoginForm) {
					userId = await widget.auth.signIn(_email, _password);
					print('Signed in: $userId');
				} else {
					userId = await widget.auth.signUp(_email, _password);
					//widget.auth.sendEmailVerification();
					//_showVerifyEmailSentDialog();
					print('Signed up user: $userId');
				}
				setState(() {
					_isLoading = false;
				});

				if (userId.length > 0 && userId != null && _isLoginForm) {
					widget.loginCallback();
				}
			} catch (e) {
				print('Error: $e');
				setState(() {
					_isLoading = false;
					_errorMessage = e.message;
					_formKey.currentState.reset();
				});
			}
		}
	}

	@override
	void initState() {
		_errorMessage = "";
		_isLoading = false;
		_isLoginForm = true;
		super.initState();
	}

	void resetForm() {
		_formKey.currentState.reset();
		_errorMessage = "";
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: APPColors().background,
			body: Container(
				padding: EdgeInsets.all(30),
				child: Form(
					key: _formKey,
					child: ListView(
						shrinkWrap: true,
						children: <Widget>[
							showLogo(),
							showEmail(),
							showPassword(),
							showSaveButton(),
							showSecondaryButton()
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
				validator: (value) => value.isEmpty ? 'Email deve ser preenchido' : null,
				onSaved: (value) => _email = value.trim(),
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
				validator: (value) => value.isEmpty ? 'Senha deve ser preenchida' : null,
				onSaved: (value) => _password = value.trim(),
			);
	}

	Widget showSaveButton() {
		return Padding(
			padding: EdgeInsets.only(top: 40.0),
			child: FlatButton(
					padding: EdgeInsets.only(top: 0.0),
					shape: Border.all(width: 0.5, color: Colors.red),
					color: APPColors().loginButton,
					child: Text(_isLoginForm ? 'Login' : 'Criar conta',
						style: new TextStyle(fontSize: 20.0, color: Colors.white),
					),
					onPressed: validateAndSubmit
			)
		);
	}

	Widget showRoundedButton() {
		return new Padding(
				padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
				child: SizedBox(
					height: 40.0,
					child: new RaisedButton(
						elevation: 5.0,
						shape: new RoundedRectangleBorder(
								borderRadius: new BorderRadius.circular(30.0)),
						color: APPColors().loginButton,
						child: Text(_isLoginForm ? 'Login' : 'Criar conta',
								style: new TextStyle(fontSize: 20.0, color: Colors.white)),
						onPressed: validateAndSubmit,
					),
				));
	}

	Widget showSecondaryButton() {
		return new FlatButton(
				child: new Text(
						_isLoginForm ? 'Não possui conta? Crie sua conta agora' : 'Possui uma conta? Faça login',
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

	Widget showErrorMessage() {
		if (_errorMessage.length > 0 && _errorMessage != null) {
			return Text(
				_errorMessage,
				style: TextStyle(
						fontSize: 13.0,
						color: Colors.red,
						height: 1.0,
						fontWeight: FontWeight.w300),
			);
		} else {
			Container(
				height: 0.0,
			);
		}
	}
}