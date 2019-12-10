import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:streamblocproject/blocs/FilaAlunosBloc.dart';

import 'package:streamblocproject/blocs/ListaALunosBloc.dart';
import 'package:streamblocproject/model/Aluno.dart';
import 'AddAluno.dart';
import 'AlunoScreen.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'ConfirmaAlunoScreen.dart';

class FilaScreen extends StatelessWidget{

  FilaAlunosBloc listaBloc;
  ListaAlunosBloc cadastradosBloc;

  _buildList(List<Aluno> alunos){
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: alunos.length,
      itemBuilder: (BuildContext context, int index) {
          return _buildTile(alunos[index],index,context);
      }
    );  
  }

  _buildTile(Aluno aluno,int index, BuildContext context){
    return ListTile(
      leading: CircleAvatar(
        child: Text("$index",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.lightBlue,
        ),
      title: Text("${aluno.nome}",textAlign: TextAlign.center,),
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => AlunoScreen(aluno: aluno)));
      },
      onLongPress: (){
        listaBloc.removeAluno(index);
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    listaBloc = BlocProvider.getBloc<FilaAlunosBloc>();
    cadastradosBloc = BlocProvider.getBloc<ListaAlunosBloc>();
    print("ta rebuildando o build do home");
    
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.book),
        title: Text("Fila de Alunos "),
      ),
      body: StreamBuilder<List<Aluno>>(
        stream: listaBloc.output,
        initialData: listaBloc.alunos,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<Aluno> list = snapshot.data;
            return _buildList(list);
          }else{
            return Text("Carregando...");
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: (){
          Future<String> i =  FlutterBarcodeScanner.scanBarcode("#004297", "Cancel", true);
          i.then((value){
            if(value.isNotEmpty){
              Aluno aluno = null;
              cadastradosBloc.alunos.forEach((it){
                if(it.nome == value){
                  aluno = it;
                  return;
                }
              });
              if(aluno != null){
                Navigator.push(context,MaterialPageRoute(builder: (context) => ConfirmaAlunoScreen(aluno: aluno)));
              }
            }
          });        
        },
      ),
    );
  }
}