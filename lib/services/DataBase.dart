import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:streamblocproject/model/Aluno.dart';

class DataBase extends Disposable{

  Completer<Box> completer = Completer<Box>();

  DataBase(){
    _initDb();
  }

  void _initDb() async {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    final box = Hive.openBox('alunos');
    completer.complete(box);
  }

  Future<List<Aluno>> getAll() async {
    final box = await completer.future;
    return box.values.map((item) => Aluno.fromJson(item)).toList();
  }

  add(Aluno aluno) async {
    final box = await completer.future;
    aluno.id = box.values.length;
    await box.put(aluno.nome, aluno.toJson());
    return aluno;
  }

  update(Aluno aluno) async {
    final box = await completer.future;
    await box.put(aluno.nome, aluno.toJson());
  }

  remove(String chave) async {
    final box = await completer.future;
    await box.delete(chave);
  }

  @override
  void dispose() async{
    var box = await completer.future;
    box.close();
  }
}