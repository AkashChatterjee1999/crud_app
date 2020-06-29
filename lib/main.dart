import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'crud.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body:new form_page(),
      )
    );
  }
}
class form_page extends StatefulWidget {
  @override
  _form_pageState createState() => _form_pageState();
}

class _form_pageState extends State<form_page> {
  @override
  var Controller = [];
  final _user = new TextEditingController();
  final _mail = new TextEditingController();
  final _phno = new TextEditingController();
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
      children: <Widget>[
        __build_form__(),
      ],
    );
  }
  Widget __build_form__(){
    CRUD ob = new CRUD();
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child:Container(
        padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
        decoration: BoxDecoration(
          border:Border.all(color:Colors.black,width:3.0),
          borderRadius:BorderRadius.all(Radius.circular(5.0))
        ),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Your name',
                labelText: 'Name',
              ),
              controller: TextEditingController(),
              validator: (value){
                if(value.isEmpty) return "Empty";
                else return null;
              },
            ),
            SizedBox(height:10.0),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Phone no.',
                labelText: 'Phone no',
              ),
              validator: (value){
                return (value.isNotEmpty && value.length!=10)?"Error Ocurred":null;
              },
            ),
            SizedBox(height:10.0),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.mail),
                hintText: 'Your Email',
                labelText: 'Email',
              ),
              validator: (value){
                return (!value.contains('@gmail.com') && value.length!=10)?"Error Ocurred":null;
              },
            ),
            SizedBox(height:15.0),
            GestureDetector(
              onTap: (){
                String name = "Akash";
                String phno = "8768559623";
                String mail = "akashchatterjee1000@gmail.com";
                Map<String,dynamic> Data = new Map();
                Data['Name'] = name;
                Data['Phone'] = phno;
                Data['email'] = mail;
                print(name.toString()+" "+phno.toString()+" "+mail.toString());
                ob.addData(Data).then((result){
                  print("Added");
                }).catchError((e){
                  print(e);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                child:Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width:8.0),
                    Text("Add Record",style:TextStyle(fontSize:12.0))
                  ]
                )
              ),
            )
          ],
        ),
      )
    );
  }
}




