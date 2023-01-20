import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_procon/constantes/constantes.dart';
import '../widgets/text_field.dart';
import '../widgets/container_personalizado.dart';
import '../widgets/select_estados.dart';
import '../widgets/select_tipos_inscricao.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Novo Auto"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MeuTextField(hintTextInput: "Razão Social", style: kTextosDosInputsTelaCadastro,),
                SizedBox(height: 10,),
                MeuTextField(hintTextInput: "Nome de Fantasia", style: kTextosDosInputsTelaCadastro,),
                SizedBox(height: 10,),
                MeuTextField(hintTextInput: "Atividade", style: kTextosDosInputsTelaCadastro,),
                SizedBox(height: 10,),
                MeuTextField(hintTextInput: "CNPJ/CPF", style: kTextosDosInputsTelaCadastro,),
                SizedBox(height: 10,),
                SelectTipoInscricao(),
                SizedBox(height: 10,),
                MeuTextField(hintTextInput: "FAX", style: kTextosDosInputsTelaCadastro,),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: MeuTextField(hintTextInput: "CEP", style: kTextosDosInputsTelaCadastro,),),
                    SizedBox(width: 5,),
                    Expanded(child: MeuTextField(hintTextInput: "Logradouro", style: kTextosDosInputsTelaCadastro,),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: MeuTextField(hintTextInput: "Bairro", style: kTextosDosInputsTelaCadastro,),),
                    SizedBox(width: 5,),
                    Expanded(child: SelectEstados()),
                  ],
                ),
                SizedBox(height: 10,),
                MeuTextField(hintTextInput: "Cidade", style: kTextosDosInputsTelaCadastro,),
                SizedBox(height: 20,),
                Divider(color: kCinzaClaro, height: 30, thickness: 2,),
                SizedBox(height: 5,),
                Text("Dados do Responsável", style: kTextosPrincipaisTelaCadastro,),
                SizedBox(height: 10,),
                MeuTextField(hintTextInput: "Nome", style: kTextosDosInputsTelaCadastro,),
                SizedBox(height: 10,),
                MeuTextField(hintTextInput: "CPF/RG", style: kTextosDosInputsTelaCadastro,),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: MeuTextField(hintTextInput: "CEP", style: kTextosDosInputsTelaCadastro,),),
                    SizedBox(width: 5,),
                    Expanded(child: MeuTextField(hintTextInput: "Logradouro", style: kTextosDosInputsTelaCadastro,),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: MeuTextField(hintTextInput: "Bairro", style: kTextosDosInputsTelaCadastro,),),
                    SizedBox(width: 5,),
                    Expanded(child: SelectEstados()),
                  ],
                ),
                SizedBox(height: 10,), 
                MeuTextField(hintTextInput: "Cidade", style: kTextosDosInputsTelaCadastro,),
                SizedBox(height: 10,),
                MeuTextField(hintTextInput: "Telefone", style: kTextosDosInputsTelaCadastro,),
                SizedBox(height: 20,),
                Divider(color: kCinzaClaro, height: 30, thickness: 2,),
                SizedBox(height: 5,),
                Text("Local de Autuação", style: kTextosPrincipaisTelaCadastro),
                SizedBox(height: 10,),
                MeuTextField(hintTextInput: 'Local de Autuação', style: kTextosDosInputsTelaCadastro),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: ContainerPersonalizado(
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
                        style: kEstiloTextoContainerPersonalizado.copyWith(fontSize: 14),
                      ),
                    ),),
                    SizedBox(width: 5,),
                    Expanded(child: ContainerPersonalizado(
                      aoPressionar: () async {
                        final newDate = await obterData(context);

                        if (newDate == null) return;

                        setState(() {
                          dataLocalAutuacao = DateFormat('dd/MM/yyyy').format(newDate);
                        });
                      },
                      cor: kAzulClaro,
                      filhoContainer: Text(
                        dataLocalAutuacao,
                        style: kEstiloTextoContainerPersonalizado.copyWith(fontSize: 14),
                      ),
                    ),),
                  ],
                ),
                SizedBox(height: 20,),
                Divider(color: kCinzaClaro, height: 30, thickness: 2,),
                SizedBox(height: 5,),
                Text("Cominação Legal", style: kTextosPrincipaisTelaCadastro),

                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(child: ContainerPersonalizado(
                      aoPressionar: () async {
                        TimeOfDay? newTime = await obterHora(context);

                        if (newTime == null) return;

                        setState(() {
                          timeCominacaoLegal = newTime.toString();
                        });
                      },
                      cor: kAzulClaro,
                      filhoContainer: Text(
                        timeCominacaoLegal,
                        style: kEstiloTextoContainerPersonalizado.copyWith(fontSize: 14),
                      ),
                    ),),
                    SizedBox(width: 5,),
                    Expanded(child: ContainerPersonalizado(
                      aoPressionar: () async {
                        final newDate = await obterData(context);

                        if (newDate == null) return;

                        setState(() {
                          dataCominacaoLegal = DateFormat('dd/MM/yyyy').format(newDate);
                        });
                      },
                      cor: kAzulClaro,
                      filhoContainer: Text(
                        dataCominacaoLegal,
                        style: kEstiloTextoContainerPersonalizado.copyWith(fontSize: 14),
                      ),
                    ),),
                  ],
                ),
                SizedBox(height: 20,),
                Text("Irregularidade Constatada:", style: kTextosPrincipaisTelaCadastro.copyWith(fontSize: 16),),
                SizedBox(height: 3,),
                TextFormField(
                  decoration: kDecoracaoDeCampos.copyWith(
                      hintText: 'Descreva aqui',
                      hintStyle: kTextosPrincipaisTelaCadastro.copyWith(fontSize: 14)
                  ),
                  maxLines: 10,
                ),
                SizedBox(height: 20,),
                Divider(color: kCinzaClaro, height: 30, thickness: 2,),
                SizedBox(height: 5,),

                Text('Autuante', style: kTextosPrincipaisTelaCadastro,),
                SizedBox(height: 20,),
                MeuTextField(hintTextInput: 'Nome do Autuante', style: kTextosDosInputsTelaCadastro),
                SizedBox(height: 10,),
                MeuTextField(hintTextInput: 'Cargo', style: kTextosDosInputsTelaCadastro),

                SizedBox(height: 20,),
                Divider(color: kCinzaClaro, height: 30, thickness: 2,),
                SizedBox(height: 5,),

                Text('Autuado', style: kTextosPrincipaisTelaCadastro,),
                SizedBox(height: 20,),
                MeuTextField(hintTextInput: 'Nome do Autuado', style: kTextosDosInputsTelaCadastro),
                SizedBox(height: 10,),
                Text('Recebi a 3º via nesta Data:', style: kTextosPrincipaisTelaCadastro.copyWith(fontSize: 15),),
                SizedBox(height: 5,),
                ContainerPersonalizado(
                  aoPressionar: () async {
                    final newDate = await obterData(context);

                    if (newDate == null) return;

                    setState(() {
                      data3via = DateFormat('dd/MM/yyyy').format(newDate);
                    });
                  },
                  cor: kAzulClaro,
                  filhoContainer: Text(
                    data3via,
                    style: kEstiloTextoContainerPersonalizado.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<DateTime?> obterData(BuildContext context) async{
  return showDatePicker(
      context: context,
      locale: const Locale("pt", "BR"),
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100)
  );
}

Future<TimeOfDay?> obterHora(BuildContext context) async {
  return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 20, minute: 20)
  );
}

