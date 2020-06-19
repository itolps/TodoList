import 'package:app_mobile/models/todo.dart';
import 'package:app_mobile/models/user.dart';
import 'package:flutter/material.dart';

import '../user_list.dart';

class HomeView extends StatefulWidget {
  var todos = new List<Todo>();
  List<User> listUsers = usersList;

  User user = User();

  HomeView({this.user});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController todoController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool clicked = false;
  bool clicked1 = false;

//Método de Adicionar Tarefa
  void add() {
    setState(() {
      widget.todos.add(
        Todo(
          title: todoController.text,
          done: false,
        ),
      );
      todoController.text = "";
    });
  }

  Widget _buildTodo() {
    return ListView.builder(
        itemCount: widget.todos.length,
        itemBuilder: (BuildContext context, int index) {
          final todo = widget.todos[index];
          return Container(
            margin: EdgeInsets.only(top: 10),
            child: Card(
              color: Color.fromRGBO(46, 167, 223, 1.0),
              child: CheckboxListTile(
                title: Text(
                  todo.title,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                controlAffinity: ListTileControlAffinity.platform,
                value: todo.done,
                onChanged: (value) {
                  setState(() {
                    todo.done = value;
                  });
                },
                activeColor: Colors.green,
                checkColor: Colors.white,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    print("Nome: " + this.widget.user.name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(46, 167, 223, 1.0),
        centerTitle: false,
        title: Text('Lista de Tarefas'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(this.widget.user.name),
              currentAccountPicture: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/proxy/jcT6r7C5yKH-2Vk7VqSUbeH_0XVOLkMLJ5Tm9G1Bb7Z-lDvXA-ARiHM8vlNe8VwtDVDQ7zmz4OuTpKgn4tiS40IlQ6aDOrLf7Zg6Rl3k2KCtk-fhi75ZuqF8K_-5SUEOWKTlSUG03XDKTqf8sXfg16_CoCutDCVW_g0Rb41u'),
                backgroundColor: Colors.transparent,
              ),
            ),
            // child: Container(
            //   child: Column(
            //     children: <Widget>[
            //       Material(
            //         color: Colors.blue[200],
            //         borderRadius: BorderRadius.all(Radius.circular(30.0)),
            //         child: Padding(
            //             padding: EdgeInsets.all(8.0),
            //             child: Image.asset(
            //               'images/logo.png',
            //               width: MediaQuery.of(context).size.width,
            //               height: 100,
            //             )),
            //       )
            //     ],
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'signupView');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(Icons.settings_power)),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Sair",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: todoController,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                      decoration: InputDecoration(
                        hintText: "Digite uma nova tarefa aqui...",
                        hintStyle: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return 'Campo de texto vazio';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: RaisedButton(
                      child: Icon(
                        Icons.add,
                        size: 20,
                      ),
                      onPressed: add,
                      color: Color.fromRGBO(46, 167, 223, 1.0),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: _buildTodo())
          ],
        ),
      ),
    );
  }
}
