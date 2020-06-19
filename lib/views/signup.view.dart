import 'package:app_mobile/models/user.dart';
import 'package:app_mobile/utilities/global.scaffold.dart';
import 'package:app_mobile/utilities/utils.dart';
import 'package:flutter/material.dart';

import 'home.view.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void onClickSnackbar() {
    final snackbar = SnackBar(
      backgroundColor: Color.fromRGBO(46, 167, 223, 1.0),
      duration: Duration(seconds: 3),
      content: Row(
        children: <Widget>[
          Icon(Icons.thumb_up),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              "Bem Vindo!",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
    GlobalScaffold.instance.showSnackbar(snackbar);
  }

  String selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = "";
  }

  setSelectedRadio(String val) {
    setState(() {
      selectedRadio = val;
      genderController.text = this.selectedRadio;
    });
  }

  add() {
    //setState(() {
    //   listUsers.add(User(
    //       name: nameController.text,
    //       password: passwordController.text,
    //       gender: genderController.text));
    // });
  }

  Widget _buildUsername() {
    return Container(
      child: TextFormField(
        controller: nameController,
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
        controller: passwordController,
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
            User user = User(
                name: nameController.text,
                password: passwordController.text,
                gender: genderController.text);
            print(user.name);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeView(user: user)),
            );
            onClickSnackbar();
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
                            value: "M",
                            groupValue: selectedRadio,
                            title: Text("Masculino"),
                            onChanged: (val) {
                              print("pressionado $val");
                              setSelectedRadio(val);
                            },
                          ),
                          RadioListTile(
                            value: "F",
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
