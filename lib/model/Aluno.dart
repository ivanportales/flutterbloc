class Aluno {
  int id;
  String nome;
  String turno;
  String curso;
  String instituicao;

  Aluno({this.id = 0,this.nome,this.curso,this.turno,this.instituicao});

  toJson(){
    return {
      "nome" : this.nome,
      "turno" : this.turno,
      "curso" : this.curso,
      "instituicao" : this.instituicao
    };
  }

  factory Aluno.fromJson(Map<dynamic,dynamic> json){
    return Aluno(
      nome: json['nome'],
      turno: json['turno'],
      curso: json['curso'],
      instituicao: json['instituicao']
    );
  }

  void setid(int id){
    this.id = id; /* gambiarra por enquanto*/
  }
}