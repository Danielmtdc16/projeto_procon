
class Autuacao{
  late int id;
  late String telefone;
  late String cidade;
  late String estado;
  late String cep;
  late String cnpj_cpf;
  late String razaosocial;

  Autuacao(this.telefone, this.cidade, this.estado,
      this.cep, this.cnpj_cpf, this.razaosocial);


  Autuacao.fromJson(Map<String, dynamic> json){
    id = json['id'];
    telefone = json['telefone1'];
    cnpj_cpf = json['cnpj_cpf'];
    cidade = json['cidade'];
    cep = json['cep'];
    estado = json['estado'];
    razaosocial = json['razaosocial'];
  }



}