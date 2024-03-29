import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:streamblocproject/model/Aluno.dart';
import 'package:streamblocproject/services/DataBase.dart';

class ListaAlunosBloc extends BlocBase{

  List<Aluno> alunos = <Aluno>[];
  DataBase db;

  final StreamController<List<Aluno>> _streamController = StreamController<List<Aluno>>.broadcast();

  Sink get input => _streamController.sink;
  Stream<List<Aluno>> get output => _streamController.stream;

  ListaAlunosBloc(){
    db = DataBase();
    db.getAll().then((value){
      this.alunos = value;
      input.add(value);
    });
  }

  addAluno(String name,String curso,String turno,String instituicao){
    Aluno aluno = Aluno(nome: name,curso: curso,turno: turno,instituicao: instituicao);
    alunos.add(aluno);
    db.add(aluno);
    input.add(alunos);
  }

  getAluno(int index){
    return alunos[index];
  }

  removeAluno(int index){
    Aluno aluno = alunos.removeAt(index);
    db.remove(aluno.nome);
    input.add(alunos);
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}