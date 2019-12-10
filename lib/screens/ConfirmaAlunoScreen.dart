import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:streamblocproject/blocs/FilaAlunosBloc.dart';
import 'package:streamblocproject/model/Aluno.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ConfirmaAlunoScreen extends StatelessWidget{
  final Aluno aluno;

  ConfirmaAlunoScreen({this.aluno});

  _informationTile(String data,Icon icon){
    return ListTile(
      title: Text("$data",style: TextStyle(fontSize: 20.0,),textAlign: TextAlign.center,),
      leading: icon,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    var listaBloc = BlocProvider.getBloc<FilaAlunosBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Aluno"),
        leading: Icon(Icons.perm_identity),
        
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: (){
          listaBloc.addAluno(aluno);  
          Navigator.pop(context);
        },
      ),
    );
  }
}