import 'package:flutter/material.dart';

class UsersView extends StatefulWidget {
  @override
  _UsersViewState createState() => _UsersViewState();
}

final String user = "user";
final String email = "email@gmail.com";

Widget _buildListView() {
  final users = List<String>.generate(30, (i) => "Usuário $i");
  final emails = List<String>.generate(30, (i) => "email@gmail.com $i");
  return ListView.builder(
    itemCount: users.length,
    itemBuilder: (context, index) {
      return Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 1.0),
                title: Text('${users[index]}'),
                subtitle: Text('${emails[index]}'),
                leading: CircleAvatar(
                  child: Icon(Icons.perm_identity),
                  radius: 20,
                ),
                onTap: () {},
              )
            ],
          ),
        ),
      );
    },
  );
}

class _UsersViewState extends State<UsersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Usuários"),
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
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: _buildListView(),
      ),
    );
  }
}
