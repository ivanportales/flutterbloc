import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:streamblocproject/blocs/ListaALunosBloc.dart';
import 'package:streamblocproject/model/Aluno.dart';
import 'package:streamblocproject/screens/AlunoScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  ListaAlunosBloc bloc;

  final nameInputController = TextEditingController();

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

  _flatButton(){
    return FlatButton(
      child: Text("Login"),
      onPressed: (){
        Aluno aluno = null;
        bloc.alunos.forEach((it){
          if(it.nome == nameInputController.text){
            aluno = it;
            return;
          }
        });
        if(aluno != null){
          Navigator.push(context,MaterialPageRoute(builder: (context) => AlunoScreen(aluno:aluno)));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    bloc = BlocProvider.getBloc<ListaAlunosBloc>();

    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.book),
          title: Text("Carteirinha digital"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: <Widget>[
              _textFieldTile("Nome:", Icon(Icons.person), nameInputController),
              _flatButton()
            ],
          ),
        ),
    );
  }
}