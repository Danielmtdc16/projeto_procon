
class Autuacao{
  late int id;
  late String razaosocial;
  late String nome_fantasia;
  late String atividade;
  late String cnpj_cpf;
  late String tipo_inscricao;
  late String telefone1;
  late String cep;
  late String logradouro;
  late String cidade;
  late String estado;
  late String responsavel;
  late String cpf_rg;
  late String cep_responsavel;
  late String logradouro_responsavel;
  late String numero_responsavel;
  late String bairro_responsavel;
  late String cidade_responsavel;
  late String estado_responsavel;
  late String telefone_responsavel;
  late String local_autuacao;
  late DateTime  data_autuacao;
  late DateTime  hora;
  late String comunicacao_legal;
  late int user_id;
  late int inicialpreenchimento_id;
  late int assinado;
  late String email_autuado;


  Autuacao({
      required this.id,
      this.razaosocial = "",
      this.nome_fantasia = "",
      this.atividade= "",
      this.cnpj_cpf= "",
      this.tipo_inscricao= "",
      this.telefone1= "",
      this.cep= "",
      this.logradouro= "",
      this.cidade= "",
      this.estado= "",
      this.responsavel = "",
      this.cpf_rg= "",
      this.cep_responsavel= "",
      this.logradouro_responsavel= "",
      this.numero_responsavel= "",
      this.bairro_responsavel= "",
      this.cidade_responsavel= "",
      this.estado_responsavel= "",
      this.telefone_responsavel= "",
      this.local_autuacao= "",
      required this.data_autuacao,
      required  this.hora,
      this.comunicacao_legal= "",
      required this.user_id,
      required this.inicialpreenchimento_id,
      required this.assinado,
      this.email_autuado= ""});

  Autuacao.fromJson(Map<String, dynamic> json){
    id = json['id'];
    razaosocial = json['razaosocial'];
    nome_fantasia = json['nome_fantasia'];
    atividade = json['atividade'];
    cnpj_cpf = json['cnpj_cpf'];
    tipo_inscricao = json['tipo_inscricao'];
    telefone1 = json['telefone1'];
    cep = json['cep'];
    logradouro = json['logradouro'];
    cidade = json['cidade'];
    estado = json['estado'];
    responsavel = json['responsavel'];
    cpf_rg = json['cpf_rg'];
    cep_responsavel = json['cep_responsavel'];
    logradouro_responsavel = json['logradouro_responsavel'];
    numero_responsavel = json['numero_responsavel'];
    bairro_responsavel = json['bairro_responsavel'];
    cidade_responsavel = json['cidade_responsavel'];
    estado_responsavel = json['estado_responsavel'];
    telefone_responsavel = json['telefone_responsavel'];
    local_autuacao = json['local_autuacao'];
    data_autuacao = DateTime.parse(json['data_autuacao']);
    hora = DateTime.parse(json['hora']);
    comunicacao_legal = json['comunicacao_legal'];
    user_id = json['user_id'];
    inicialpreenchimento_id = json['inicialpreenchimento_id'];
    assinado = json['assinado'] != null ? json['assinado'] : 0;
    email_autuado = json['email_autuado'];
  }

  Map toJson() =>
      {
        "id": id,
        "razaosocial":razaosocial,
        "nome_fantasia": nome_fantasia,
        "atividade": atividade,
        "cnpj_cpf": cnpj_cpf,
        "tipo_inscricao": tipo_inscricao,
        "telefone1": telefone1,
        "cep": cep,
        "logradouro": logradouro,
        "cidade": cidade,
        "estado": estado,
        "responsavel": responsavel,
        "cpf_rg": cpf_rg,
        "cep_responsavel": cep_responsavel,
        "logradouro_responsavel": logradouro_responsavel,
        "numero_responsavel": numero_responsavel,
        "bairro_responsavel": bairro_responsavel,
        "cidade_responsavel": cidade_responsavel,
        "estado_responsavel":  estado_responsavel,
        "telefone_responsavel": telefone_responsavel,
        "local_autuacao": local_autuacao,
        "data_autuacao": data_autuacao.toString(),
        "hora": hora.toString(),
        "comunicacao_legal": comunicacao_legal,
        "user_id": user_id,
        "inicialpreenchimento_id": inicialpreenchimento_id,
        "assinado": assinado,
        "email_autuado": email_autuado
      };



}