import 'package:flutter/material.dart';
import '../constantes/constantes.dart';

// ignore: camel_case_types
class DropdownButton_Estados extends StatefulWidget {
  const DropdownButton_Estados({Key? key}) : super(key: key);

  @override
  State<DropdownButton_Estados> createState() => _DropdownButton_EstadosState();
}

// ignore: camel_case_types
class _DropdownButton_EstadosState extends State<DropdownButton_Estados> {

  String dropdownValue = klistaDeEstados.first;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: DropdownButtonFormField<String>(
          menuMaxHeight: 500,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          decoration: kDecoracaoDeCampos,
          isExpanded: true,
          hint: const Text('Selecione o Estado'),
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          elevation: 20,
          onChanged: (String? value){
            setState(() {
              dropdownValue = value!;
            });
          },
          items: klistaDeEstados.map<DropdownMenuItem<String>>((String value){
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
      ),
    );
  }
}


