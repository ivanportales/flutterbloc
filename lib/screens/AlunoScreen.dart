import 'package:flutter/material.dart';
import 'package:streamblocproject/model/Aluno.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:streamblocproject/screens/FilaScreen.dart';
import 'package:streamblocproject/screens/HomePage.dart';

import 'AddAluno.dart';

class AlunoScreen extends StatelessWidget{
  final Aluno aluno;

  AlunoScreen({this.aluno});

  _informationTile(String data,Icon icon){
    return ListTile(
      title: Text("$data",style: TextStyle(fontSize: 20.0,),textAlign: TextAlign.center,),
      leading: icon,
    );
  }
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Aluno"),
        leading: Icon(Icons.perm_identity),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.view_list ,color: Colors.white,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>HomePage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.library_add ,color: Colors.white,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>FilaScreen()));
            },
          ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _informationTile(aluno.nome, Icon(Icons.person)),
              _informationTile(aluno.curso, Icon(Icons.school)),
              _informationTile(aluno.turno, Icon(Icons.access_time)),
              _informationTile(aluno.instituicao, Icon(Icons.home)),
              QrImage(
                data: aluno.nome,
                version: QrVersions.auto,
                size: 130.0,
              ),
            ],
          ),
        ),
    );
  }
}