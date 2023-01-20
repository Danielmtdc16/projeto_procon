import 'package:flutter/material.dart';
import '../constantes/constantes.dart';

class MeuTextField extends StatelessWidget {

  final String hintTextInput;

  const MeuTextField({Key? key, required this.hintTextInput}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: hintTextInput,
          hintStyle: const TextStyle(color: Colors.black54),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(
            color: Colors.transparent
          ),),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(
            color: Colors.transparent
          ),),
          fillColor: kCinzaMuitoClaro,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: const TextStyle(
        color: Colors.black54,
      ),
    );
  }
}
