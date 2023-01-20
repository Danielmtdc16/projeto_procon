import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../constantes/constantes.dart';

class SelectTipoInscricao extends StatefulWidget {
  const SelectTipoInscricao({Key? key}) : super(key: key);

  @override
  State<SelectTipoInscricao> createState() => _SelectTipoInscricaoState();
}

class _SelectTipoInscricaoState extends State<SelectTipoInscricao> {

  final dropValue = ValueNotifier('');
  String dropdownValue = klistaTiposInscricao.first;

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
            hint: const Text('Tipo de Inscrição', style: kTextosDosInputsTelaCadastro,),
            value: value.isEmpty ? null : value,
            icon: const Icon(Icons.arrow_downward),
            elevation: 20,
            onChanged: (escolha) => dropValue.value = escolha.toString(),
            items: klistaTiposInscricao.map((op){
              return DropdownMenuItem(
                value: op,
                child: Text(op, style: kTextosDosInputsTelaCadastro,),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
