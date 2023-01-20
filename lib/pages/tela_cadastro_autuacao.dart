import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_procon/constantes/constantes.dart';
import '../widgets/text_field.dart';
import '../widgets/container_personalizado.dart';
import '../widgets/dropdownButton_Estados.dart';

class TelaCadastroAuto extends StatefulWidget {
  const TelaCadastroAuto({Key? key}) : super(key: key);

  @override
  State<TelaCadastroAuto> createState() => _TelaCadastroAutoState();
}

class _TelaCadastroAutoState extends State<TelaCadastroAuto> {

  String date = "Data da Infração";
  String time = "Horário da Infração";

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
                MeuTextField(hintTextInput: "Razão Social"),
                SizedBox(height: 10,),
                MeuTextField(hintTextInput: "Nome de Fantasia"),
                SizedBox(height: 10,),
                MeuTextField(hintTextInput: "Atividade"),
                SizedBox(height: 10,),
                MeuTextField(hintTextInput: "CNPJ/CPF"),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value){}),
                    Text("I.M."),
                    Checkbox(value: true, onChanged: (value){}),
                    Text("I.E.")
                  ],
                ),
                SizedBox(height: 10,),
                MeuTextField(hintTextInput: "FAX"),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: MeuTextField(hintTextInput: "CEP"),),
                    SizedBox(width: 5,),
                    Expanded(child: MeuTextField(hintTextInput: "Logradouro"),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: MeuTextField(hintTextInput: "Bairro"),),
                    SizedBox(width: 5,),
                    Expanded(child: DropdownButton_Estados()),
                  ],
                ),
                SizedBox(height: 10,),
                MeuTextField(hintTextInput: "Cidade"),
                SizedBox(height: 10,),
                Text("Dados do Responsável"),
                MeuTextField(hintTextInput: "Nome"),
                SizedBox(height: 10,),
                MeuTextField(hintTextInput: "CPF/RG"),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: MeuTextField(hintTextInput: "CEP"),),
                    SizedBox(width: 5,),
                    Expanded(child: MeuTextField(hintTextInput: "Logradouro"),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: MeuTextField(hintTextInput: "Bairro"),),
                    SizedBox(width: 5,),
                    Expanded(child: DropdownButton_Estados()),
                  ],
                ),
                SizedBox(height: 10,), 
                MeuTextField(hintTextInput: "Cidade"),
                SizedBox(height: 10,),
                MeuTextField(hintTextInput: "Telefone"),
                SizedBox(height: 10,),
                Text("Local de Autuação"),
                Row(
                  children: [
                    Expanded(child: MeuTextField(hintTextInput: "Data"),),
                    SizedBox(width: 5,),
                    Expanded(child: MeuTextField(hintTextInput: "Hora"),)
                  ],
                ),
                SizedBox(height: 10,),
                Text("Cominação Legal"),
                Text("Preencha os campos abaixo:"),
                Row(
                  children: [
                    Expanded(child: ContainerPersonalizado(
                      aoPressionar: () async {
                        TimeOfDay? newTime = await obterHora(context);

                        if (newTime == null) return;

                        setState(() {
                          time = newTime.toString();
                        });
                      },
                      cor: kAzulClaro,
                      filhoContainer: Text(
                        time,
                        style: kEstiloTextoContainerPersonalizado.copyWith(fontSize: 14),
                      ),
                    ),),
                    SizedBox(width: 5,),
                    Expanded(child: ContainerPersonalizado(
                      aoPressionar: () async {
                        final newDate = await obterData(context);

                        if (newDate == null) return;

                        setState(() {
                          date = DateFormat('dd/MM/yyyy').format(newDate);
                        });
                      },
                      cor: kAzulClaro,
                      filhoContainer: Text(
                        date,
                        style: kEstiloTextoContainerPersonalizado.copyWith(fontSize: 14),
                      ),
                    ),),
                  ],
                ),
                SizedBox(height: 10,),
                Text("Irregularidade Constatada:"),
                SizedBox(height: 3,),
                TextFormField(
                  decoration: kDecoracaoDeCampos,
                  maxLines: 20,
                )
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

