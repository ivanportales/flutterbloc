import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:streamblocproject/model/Aluno.dart';

class FilaAlunosBloc extends BlocBase{

  List<Aluno> alunos = <Aluno>[];
  
  final StreamController<List<Aluno>> _streamController = StreamController<List<Aluno>>.broadcast();

  Sink get input => _streamController.sink;
  Stream<List<Aluno>> get output => _streamController.stream;

  addAluno(Aluno aluno){
    alunos.add(aluno);
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