import 'package:flutter/material.dart';
import '../constantes/constantes.dart';
import '../widgets/text_field.dart';
import '../widgets/container_personalizado.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 130,
          bottom: 60,
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
                width: 300,
                child: Image(image: AssetImage('assets/imagens/logo-mppi-procon-2.png'),),
              ),
              const SizedBox(height: 50,),
              const Text("Efetue o Login", style: ktextoLogin),
              const Text("Insira seu Email e Senha nos campos abaixo", style: kdescricao),
              const SizedBox(height: kalturaEspacamento,),
              const MeuTextField(hintTextInput: "Email"),
              const SizedBox(height: 10,),
              const MeuTextField(hintTextInput: "Senha"),
              const SizedBox(height: kalturaEspacamento,),
              ContainerPersonalizado(
                  aoPressionar: (){},
                  cor: kVermelha,
                  filhoContainer: const Text(
                    "Login",
                    style: kEstiloTextoContainerPersonalizado,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


