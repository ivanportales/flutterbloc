class Aluno {
  int id;
  String nome;
  String turno;
  String curso;
  String instituicao;

  Aluno({this.nome,this.curso,this.turno,this.instituicao});

  void setid(int id){
    this.id = id; /* gambiarra por enquanto*/
  }
}