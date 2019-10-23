import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:streamblocproject/model/Aluno.dart';

class ListaAlunosBloc extends BlocBase{

  List<Aluno> alunos = <Aluno>[];
  
  final StreamController<List<Aluno>> _streamController = StreamController<List<Aluno>>.broadcast();

  Sink get input => _streamController.sink;
  Stream<List<Aluno>> get output => _streamController.stream;

  addAluno(String name,String curso,String turno,String instituicao){
    alunos.add(Aluno(nome: name,curso: curso,turno: turno,instituicao: instituicao));
    input.add(alunos);
  }

  getAluno(int index){
    return alunos[index];
  }

  removeAluno(int index){
    alunos.removeAt(index);
    input.add(alunos);
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}