import 'package:app_mobile/models/todo.dart';
import 'package:app_mobile/models/user.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  var todos = new List<Todo>();

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

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    print("Nome: " + this.widget.user.name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(46, 167, 223, 1.0),
        centerTitle: false,
        title: Text('Lista de Tarefas'),
        actions: <Widget>[
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                print(isSwitched);
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: null,
              accountName: Text(this.widget.user.name),
              currentAccountPicture: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://scontent.ffor36-1.fna.fbcdn.net/v/t1.0-9/p960x960/90086451_2971294566290223_5867931705892929536_o.jpg?_nc_cat=110&_nc_sid=85a577&_nc_oc=AQl_DVOMvdpOhkmkdTxhgt0H4Kz2V0N9pqf8frqyqzAwPFjVU_GmMU0pdmfhfFqtVk0&_nc_ht=scontent.ffor36-1.fna&_nc_tp=6&oh=c81880c200f07238c66d43e0579de0fb&oe=5F13E536'),
                backgroundColor: Colors.transparent,
              ),
            ),
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
