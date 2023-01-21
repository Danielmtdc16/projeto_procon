import 'package:flutter/material.dart';
import '../constantes/constantes.dart';

class ContainerPersonalizado extends StatelessWidget {

  final Color cor;
  final Widget filhoContainer;
  final VoidCallback? aoPressionar;
  Function()? function;

  ContainerPersonalizado({
    Key? key, this.aoPressionar, required this.cor,
    required this.filhoContainer, this.function
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        height: kalturaContainerPersonalizado,
        width: double.infinity,
        decoration: BoxDecoration(
          color: cor,
          borderRadius: const BorderRadius.all(Radius.circular(4))
        ),
        child: filhoContainer,
      ),
    );
  }
}
