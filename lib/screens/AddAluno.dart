import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'package:streamblocproject/blocs/ListaALunosBloc.dart';

class AddAluno extends StatelessWidget{

  final bloc = BlocProvider.getBloc<ListaAlunosBloc>();

  final nameInputController = TextEditingController();
  final cursoInputController = TextEditingController();
  final turnoInputController = TextEditingController();
  final instituicaoInputController = TextEditingController();

  _textFieldTile(String label,Icon icon,TextEditingController control){
    return TextField(
      decoration: InputDecoration(
      icon: icon,
        labelText: label,
        errorText: null,        
      ),
      controller: control,
      textCapitalization: TextCapitalization.words,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Aluno"),
        ),
        body: Padding(
          padding: EdgeInsets.all(13.0),
            child: Column(
              children: <Widget>[
               /* CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 48.0,
                  child: Icon(Icons.person_add),
                ),*/
                _textFieldTile("Nome:", Icon(Icons.person), nameInputController),
                _textFieldTile("Curso:", Icon(Icons.school), cursoInputController),
                _textFieldTile("Turno:", Icon(Icons.access_time), turnoInputController),
                _textFieldTile("Instituição:", Icon(Icons.home), instituicaoInputController),
               
              ],
            ),
          ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            String nome = nameInputController.text;
            String curso = cursoInputController.text;
            String turno = turnoInputController.text;
            String instituicao = instituicaoInputController.text;
            if(nome.isNotEmpty && curso.isNotEmpty && turno.isNotEmpty && instituicao.isNotEmpty){
              bloc.addAluno(nome,curso,turno,instituicao);
              Navigator.pop(context);
            }
          },
        )
    );
  }
}