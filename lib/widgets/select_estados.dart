import 'package:flutter/material.dart';
import '../constantes/constantes.dart';

class SelectEstados extends StatefulWidget {

  const SelectEstados({Key? key}) : super(key: key);

  @override
  State<SelectEstados> createState() => _SelectEstadosState();
}

class _SelectEstadosState extends State<SelectEstados> {

  final dropValue = ValueNotifier('');
  String dropdownValue = klistaDeEstados.first;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dropValue,
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
            onChanged: (escolha) => dropValue.value = escolha.toString(),
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
    );
  }
}
