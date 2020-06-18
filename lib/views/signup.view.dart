import 'package:app_mobile/utilities/utils.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();

  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

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
          'Cadsatrar',
          style: TextStyle(
            color: Color.fromRGBO(46, 167, 223, 1.0),
            letterSpacing: 1.5,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildBackLoginBtn() {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'loginView');
        },
        padding: EdgeInsets.only(left: 5.0),
        child: Text(
          'Voltar para Login',
          style: TextStyle(
            color: Color.fromRGBO(46, 167, 223, 1.0),
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
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
                      _buildUsername(),
                      SizedBox(
                        height: 10,
                      ),
                      _buildPassword(),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RadioListTile(
                            value: 1,
                            groupValue: selectedRadio,
                            title: Text("Masculino"),
                            onChanged: (val) {
                              print("pressionado $val");
                              setSelectedRadio(val);
                            },
                          ),
                          RadioListTile(                          
                            value: 2,
                            groupValue: selectedRadio,
                            title: Text("Feminino"),
                            onChanged: (val) {
                              print("pressionado $val");
                              setSelectedRadio(val);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      _buildSignupBtn(),
                      SizedBox(
                        height: 5,
                      ),
                      _buildBackLoginBtn()
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
