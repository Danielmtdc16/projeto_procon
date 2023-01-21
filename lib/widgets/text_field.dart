import 'package:flutter/material.dart';
import '../constantes/constantes.dart';

class MeuTextField extends StatelessWidget {

  final String hintTextInput;
  final TextStyle style;
  final TextEditingController? controller;
  final int? maxLines;

  const MeuTextField({Key? key, required this.hintTextInput, required this.style, this.controller, this.maxLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      style: style,
      controller: controller,
      maxLines: maxLines,
    );
  }
}
