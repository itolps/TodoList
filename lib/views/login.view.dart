import 'package:app_mobile/utilities/utils.dart';
import 'package:app_mobile/views/home.view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  Widget _buildUsername() {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        validator: Utils.validateName,
        decoration: InputDecoration(
          enabledBorder: new UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(46, 167, 223, 1.0))),
          prefixIcon: Icon(
            Icons.person,
            color: Color.fromRGBO(46, 167, 223, 1.0),
          ),
          hintText: 'Usuário',
        ),
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildPassword() {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        validator: Utils.validatePassword,
        decoration: InputDecoration(
          enabledBorder: new UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(46, 167, 223, 1.0))),
          prefixIcon: Icon(
            Icons.lock,
            color: Color.fromRGBO(46, 167, 223, 1.0),
          ),
          hintText: 'Senha',
        ),
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, 'signupView');
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Não tem uma conta? ',
              style: TextStyle(
                color: Color.fromRGBO(46, 167, 223, 1.0),
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Cadastre-se',
              style: TextStyle(
                color: Color.fromRGBO(46, 167, 223, 1.0),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: 130,
      child: RaisedButton(
        elevation: 10.0,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Navigator.pushReplacementNamed(context, 'homeView');
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Entrar',
          style: TextStyle(
            color: Color.fromRGBO(46, 167, 223, 1.0),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: MediaQuery.of(context).size.height / 18,
              ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 4,
                        child: Image.asset("images/logo.png"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Stack(
                        children: <Widget>[
                          // Borda do Texto.
                          Text(
                            'Todo List',
                            style: TextStyle(
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 6
                                ..color = Color.fromRGBO(46, 167, 223, 1.0),
                            ),
                          ),
                          // Texto.
                          Text(
                            'Todo List',
                            style: TextStyle(
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _buildUsername(),
                      SizedBox(
                        height: 10,
                      ),
                      _buildPassword(),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _buildLoginBtn(),
                      _buildSignupBtn(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
