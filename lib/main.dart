import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:streamblocproject/blocs/FilaAlunosBloc.dart';

import 'package:streamblocproject/blocs/ListaALunosBloc.dart';
import 'package:streamblocproject/screens/LoginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        blocs: [
          Bloc((i) => FilaAlunosBloc()),
          Bloc((i) => ListaAlunosBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.teal
          ),
          title: 'Cdigital',
          home: LoginScreen(),
      ),
    );
  }
}