import 'package:flutter/material.dart';
import 'package:streamblocproject/model/Aluno.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
      appBar: AppBar(title: Text("Aluno")),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _informationTile(aluno.nome, Icon(Icons.person)),
              _informationTile(aluno.curso, Icon(Icons.school)),
              _informationTile(aluno.turno, Icon(Icons.access_time)),
              _informationTile(aluno.instituicao, Icon(Icons.home)),
              QrImage(
                data: aluno.id.toString(),
                version: QrVersions.auto,
                size: 150.0,
              ),
            ],
          ),
        ),
    );
  }
}