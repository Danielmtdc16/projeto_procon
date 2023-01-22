import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_procon/constantes/constantes.dart';
import 'package:projeto_procon/models/autuacao.dart';
import 'package:projeto_procon/pages/tela_principal.dart';
import 'package:projeto_procon/util/ConsultaApi.dart';
import 'package:projeto_procon/util/messages.dart';
import 'package:projeto_procon/util/nav.dart';
import 'package:projeto_procon/widgets/menu_user.dart';
import '../widgets/text_field.dart';
import '../widgets/container_personalizado.dart';
import '../widgets/select_estados.dart';
import '../widgets/select_tipos_inscricao.dart';
import '../util/consultaCEP.dart';

class TelaCadastroAuto extends StatefulWidget {
  const TelaCadastroAuto({Key? key}) : super(key: key);

  @override
  State<TelaCadastroAuto> createState() => _TelaCadastroAutoState();
}

class _TelaCadastroAutoState extends State<TelaCadastroAuto> {
  String dataLocalAutuacao = "Data da Infração";
  String timeLocalAutuacao = "Horário da Infração";

  String dataCominacaoLegal = "Data da Infração";
  String timeCominacaoLegal = "Horário da Infração";

  String data3via = "Selecione a Data";

  final _razaoSocialController = TextEditingController();
  final _nomeFantasiaController = TextEditingController();
  final _atividadeController = TextEditingController();
  final _cnpjCpfController = TextEditingController();
  final _cepEmpresaController = TextEditingController();
  final _logradouroEmpresaController = TextEditingController();
  final _bairroEmpresaController = TextEditingController();
  final _cidadeEmpresaController = TextEditingController();
  final _nomeResponsavelController = TextEditingController();
  final _cpfRgResponsavelController = TextEditingController();
  final _cepResponsavelController = TextEditingController();
  final _logradouroResponsavelController = TextEditingController();
  final _numeroResponsavelController = TextEditingController();
  final _bairroResponsavelController = TextEditingController();
  final _cidadeResponsavelController = TextEditingController();
  final _telefoneResponsavelController = TextEditingController();
  final _localAutuacaoController = TextEditingController();
  final _irregularidadeController = TextEditingController();
  final _nomeAutuanteController = TextEditingController();
  final _cargoAutuanteController = TextEditingController();
  final _nomeAutuadoController = TextEditingController();

  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  final _formKey = GlobalKey<FormState>();

  final dropValueEmpresa = ValueNotifier('');
  final dropValueResponsavel = ValueNotifier('');
  final dropValueTipoInscricao = ValueNotifier('');

  late String estadoEmpresa;
  late String estadoResponsavel;
  late String tipoInscricao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro Novo Auto"),
        centerTitle: true,
        backgroundColor: Colors.black,
          actions: <Widget>[
            MenuUser()
          ]
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text("Dados da Empresa", style: kTextosPrincipaisTelaCadastro),

                  const SizedBox(
                    height: 10,
                  ),
                  MeuTextField(
                    hintTextInput: "Razão Social",
                    style: kTextosDosInputsTelaCadastro,
                    controller: _razaoSocialController,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  MeuTextField(
                    hintTextInput: "Nome de Fantasia",
                    style: kTextosDosInputsTelaCadastro,
                    controller: _nomeFantasiaController,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  MeuTextField(
                    hintTextInput: "Atividade",
                    style: kTextosDosInputsTelaCadastro,
                    controller: _atividadeController,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  MeuTextField(
                    hintTextInput: "CNPJ/CPF",
                    style: kTextosDosInputsTelaCadastro,
                    controller: _cnpjCpfController,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                ValueListenableBuilder(
                  valueListenable: dropValueTipoInscricao,
                  builder: (BuildContext context, String value, _){
                    return SizedBox(
                      height: 60,
                      child: DropdownButtonFormField<String>(
                        menuMaxHeight: 500,
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                        decoration: kDecoracaoDeCampos,
                        isExpanded: true,
                        hint: const Text('Tipo de Inscrição', style: kTextosDosInputsTelaCadastro,),
                        value: value.isEmpty ? null : value,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 20,
                        onChanged: (escolha) {
                          dropValueTipoInscricao.value = escolha.toString();
                          setState(() {
                            tipoInscricao = escolha.toString();
                          });
                        },
                        items: klistaTiposInscricao.map((op){
                          return DropdownMenuItem(
                            value: op,
                            child: Text(op, style: kTextosDosInputsTelaCadastro,),
                          );
                        }).toList(),
                      ),
                    );
                  },),

                  const SizedBox(
                    height: 10,
                  ),
                  const MeuTextField(
                    hintTextInput: "FAX",
                    style: kTextosDosInputsTelaCadastro,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MeuTextField(
                          hintTextInput: "CEP",
                          style: kTextosDosInputsTelaCadastro,
                          controller: _cepEmpresaController,
                        ),
                      ),

                      const SizedBox(
                        width: 5,
                      ),

                      Expanded(
                          child: ContainerPersonalizado(
                        cor: kAzulClaro,
                        filhoContainer: Text(
                          "Consultar CEP",
                          style: kEstiloTextoContainerPersonalizado.copyWith(
                              fontSize: 15),
                        ),
                        aoPressionar: _searchCep,
                      )),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  MeuTextField(
                    hintTextInput: "Logradouro",
                    style: kTextosDosInputsTelaCadastro,
                    controller: _logradouroEmpresaController,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: MeuTextField(
                          hintTextInput: "Número",
                          style: kTextosDosInputsTelaCadastro,
                          controller: _logradouroEmpresaController,
                          ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: MeuTextField(
                          hintTextInput: "Bairro",
                          style: kTextosDosInputsTelaCadastro,
                          controller: _bairroEmpresaController,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                       Expanded(
                          child: MeuTextField(
                            hintTextInput: "Cidade",
                            style: kTextosDosInputsTelaCadastro,
                            controller: _cidadeEmpresaController,
                          ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(child: ValueListenableBuilder(
                        valueListenable: dropValueEmpresa,
                        builder: (BuildContext context, String value, _){
                          return SizedBox(
                            height: 60,
                            child: DropdownButtonFormField<String>(
                              menuMaxHeight: 500,
                              borderRadius: const BorderRadius.all(Radius.circular(4)),
                              decoration: kDecoracaoDeCampos,
                              isExpanded: true,
                              hint: const Text('Estados', style: kTextosDosInputsTelaCadastro,),
                              value: value.isEmpty ? null : value,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 20,
                              onChanged: (escolha){
                                setState(() {
                                  estadoEmpresa = escolha.toString();
                                  print(estadoEmpresa);
                                });
                                dropValueEmpresa.value = escolha.toString();
                              },
                              items: klistaDeEstados.map((op){
                                return DropdownMenuItem(
                                  value: op,
                                  child: Text(op, style: kTextosDosInputsTelaCadastro,),
                                );
                              }).toList(),
                              validator: (value) => value == null ? "Campo Obrigatório" : null,
                            ),
                          );
                        },
                      ),),
                  ]
                ),

                  const SizedBox(
                    height: 20,
                  ),

                  const Divider(
                    color: kCinzaClaro,
                    height: 30,
                    thickness: 2,
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  const Text(
                    "Dados do Responsável",
                    style: kTextosPrincipaisTelaCadastro,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  MeuTextField(
                    hintTextInput: "Nome",
                    style: kTextosDosInputsTelaCadastro,
                    controller: _nomeResponsavelController,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  MeuTextField(
                    hintTextInput: "CPF/RG",
                    style: kTextosDosInputsTelaCadastro,
                    controller: _cpfRgResponsavelController,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: MeuTextField(
                          hintTextInput: "CEP",
                          style: kTextosDosInputsTelaCadastro,
                          controller: _cepResponsavelController,
                        ),
                      ),

                      const SizedBox(
                        width: 5,
                      ),

                      Expanded(
                        child: MeuTextField(
                          hintTextInput: "Logradouro",
                          style: kTextosDosInputsTelaCadastro,
                          controller: _logradouroResponsavelController,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MeuTextField(
                          hintTextInput: "Número",
                          style: kTextosDosInputsTelaCadastro,
                          controller: _numeroResponsavelController,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: MeuTextField(
                          hintTextInput: "Bairro",
                          style: kTextosDosInputsTelaCadastro,
                          controller: _bairroResponsavelController,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                      children: [
                        Expanded(
                          child: MeuTextField(
                            hintTextInput: "Cidade",
                            style: kTextosDosInputsTelaCadastro,
                            controller: _cidadeResponsavelController,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(child: ValueListenableBuilder(
                          valueListenable: dropValueResponsavel,
                          builder: (BuildContext context, String value, _){
                            return SizedBox(
                              height: 60,
                              child: DropdownButtonFormField<String>(
                                menuMaxHeight: 500,
                                borderRadius: const BorderRadius.all(Radius.circular(4)),
                                decoration: kDecoracaoDeCampos,
                                isExpanded: true,
                                hint: const Text('Estados', style: kTextosDosInputsTelaCadastro,),
                                value: value.isEmpty ? null : value,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 20,
                                onChanged: (escolha){
                                  setState(() {
                                    estadoResponsavel = escolha.toString();
                                    print(estadoResponsavel);
                                  });
                                  dropValueResponsavel.value = escolha.toString();
                                },
                                items: klistaDeEstados.map((op){
                                  return DropdownMenuItem(
                                    value: op,
                                    child: Text(op, style: kTextosDosInputsTelaCadastro,),
                                  );
                                }).toList(),
                                validator: (value) => value == null ? "Campo Obrigatório" : null,
                              ),
                            );
                          },
                        ),),
                      ]
                  ),


                  const SizedBox(
                    height: 10,
                  ),

                  MeuTextField(
                    hintTextInput: "Telefone",
                    style: kTextosDosInputsTelaCadastro,
                    controller: _telefoneResponsavelController,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  const Divider(
                    color: kCinzaClaro,
                    height: 30,
                    thickness: 2,
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  const Text("Local de Autuação", style: kTextosPrincipaisTelaCadastro),

                  const SizedBox(
                    height: 10,
                  ),

                  MeuTextField(
                      hintTextInput: 'Local de Autuação',
                      style: kTextosDosInputsTelaCadastro,
                      controller: _localAutuacaoController,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: ContainerPersonalizado(
                          aoPressionar: () async {
                            TimeOfDay? newTime = await obterHora(context);

                            if (newTime == null) return;

                            setState(() {
                              timeLocalAutuacao = newTime.toString();
                            });
                          },
                          cor: kAzulClaro,
                          filhoContainer: Text(
                            timeLocalAutuacao,
                            style: kEstiloTextoContainerPersonalizado.copyWith(
                                fontSize: 14),
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 5,
                      ),

                      Expanded(
                        child: ContainerPersonalizado(
                          aoPressionar: () async {
                            final newDate = await obterData(context);

                            if (newDate == null) return;

                            setState(() {
                              dataLocalAutuacao =
                                  DateFormat('dd/MM/yyyy').format(newDate);
                            });
                          },
                          cor: kAzulClaro,
                          filhoContainer: Text(
                            dataLocalAutuacao,
                            style: kEstiloTextoContainerPersonalizado.copyWith(
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  const Divider(
                    color: kCinzaClaro,
                    height: 30,
                    thickness: 2,
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  const Text("Cominação Legal", style: kTextosPrincipaisTelaCadastro),

                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Irregularidade Constatada:",
                    style: kTextosPrincipaisTelaCadastro.copyWith(fontSize: 16),
                  ),

                  const SizedBox(
                    height: 3,
                  ),

                  MeuTextField(
                    hintTextInput: 'Descreva aqui',
                    style: kTextosDosInputsTelaCadastro,
                    controller: _irregularidadeController,
                    maxLines: 10,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  const Divider(
                    color: kCinzaClaro,
                    height: 30,
                    thickness: 2,
                  ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kAzulClaro,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  "Salvar Auto",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()){
                    _onClickSalvar(context);
                  }
                },
              ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

  void _onClickSalvar(context) async {
    if(verificar_campos()){
      Messages.showLoadingDialog(context, _keyLoader);
      Autuacao autuacao = Autuacao(id: 0,
          razaosocial: _razaoSocialController.text,
          nome_fantasia: _nomeFantasiaController.text,
          atividade: _atividadeController.text,
          cnpj_cpf: _cnpjCpfController.text,
          tipo_inscricao: tipoInscricao,
          telefone1: _telefoneResponsavelController.text,
          cep: _cepEmpresaController.text,
          logradouro: _logradouroEmpresaController.text,
          cidade: _cidadeEmpresaController.text,
          estado: estadoEmpresa,
          responsavel: _nomeResponsavelController.text,
          cpf_rg: _cpfRgResponsavelController.text,
          cep_responsavel: _cepResponsavelController.text,
          logradouro_responsavel: _logradouroResponsavelController.text,
          numero_responsavel: _numeroResponsavelController.text,
          bairro_responsavel: _bairroResponsavelController.text,
          cidade_responsavel: _cidadeResponsavelController.text,
          estado_responsavel: estadoResponsavel,
          telefone_responsavel: _telefoneResponsavelController.text,
          local_autuacao: _localAutuacaoController.text,
          data_autuacao:  DateTime.now(),
          hora:  DateTime.now(),
          comunicacao_legal: _irregularidadeController.text,
          user_id: 1,
          inicialpreenchimento_id: 1,
          assinado: 0,
          email_autuado: "a",
          );
      int resp = await ConsultaApi.salvar_auto(autuacao, context);
      Navigator.of(context,rootNavigator: true).pop();//close the dialoge;
      if (resp != 0) {
        pushAndRemoveUntil(context, TelaPrincipal());
      }else{
        Messages().msgErro("Sem acesso ao servidor!"+resp.toString(), context);
      }
    }
  }

  bool verificar_campos(){

    return true;
  }

  bool verificar_campo(TextEditingController textController, FocusNode focusNode, String campo){
    if(textController.text.toString().trim() == ""){
      focusNode.requestFocus();
      Messages().msgInfor("Preencha "+campo+"!", context);
      return false;
    }
    return true;
  }


  Future _searchCep() async {
    final cep = _cepEmpresaController.text;

    final resultCep = await ConsultaCEP.fetchCep(cep: cep);

    setState(() {
      _cepEmpresaController.text = resultCep.cep;
      _logradouroEmpresaController.text = resultCep.logradouro;
      _bairroEmpresaController.text = resultCep.bairro;
      _cidadeEmpresaController.text = resultCep.localidade;
    });
  }
}

Future<DateTime?> obterData(BuildContext context) async {
  return showDatePicker(
      context: context,
      locale: const Locale("pt", "BR"),
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));
}

Future<TimeOfDay?> obterHora(BuildContext context) async {
  return showTimePicker(
      context: context, initialTime: const TimeOfDay(hour: 20, minute: 20));
}
