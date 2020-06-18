import 'package:app_mobile/models/todo.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  var todos = new List<Todo>();

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
                  style: TextStyle(color: Colors.white, fontSize: 15),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(46, 167, 223, 1.0),
        centerTitle: false,
        title: Text('Lista de Tarefas'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[200],
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/logo.png',
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                          )),
                    )
                  ],
                ),
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
                        Icon(Icons.person_add),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Cadastrar",
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
