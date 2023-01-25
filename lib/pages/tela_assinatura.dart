import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:projeto_procon/pages/tela_cadastro_autuacao.dart';
import 'dart:ui' as ui;
import 'package:signature/signature.dart';
import 'package:projeto_procon/constantes/constantes.dart';
import 'package:projeto_procon/models/autuacao.dart';

class TelaAssinatura extends StatefulWidget {

  const TelaAssinatura({Key? key}) : super(key: key);

  @override
  State<TelaAssinatura> createState() => _TelaAssinaturaState();
}

class _TelaAssinaturaState extends State<TelaAssinatura> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  final SignatureController _assinaturaController = SignatureController(
      penStrokeWidth: 5,
      penColor: Color(0xFF282828),
      exportBackgroundColor: kCinzaMuitoClaro);

  late String path_assinatura = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assinatura"),
        backgroundColor: Colors.black,
        actions: <Widget>[
          TextButton(
            onPressed: () => _assinaturaController.clear(),
            child: const Text(
              "Limpar",
              style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          TextButton(
            onPressed: obterImagemAssinatura,
            child: const Text(
              "Salvar",
              style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Signature(
                controller: _assinaturaController,
                width: double.infinity,
                height: 200,
                backgroundColor: kCinzaMuitoClaro,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future obterImagemAssinatura() async {
    showImage();
  }

  String formattedDate() {
    DateTime dateTime = DateTime.now();
    String dateTimeString = 'Signature_' +
        dateTime.year.toString() +
        dateTime.month.toString() +
        dateTime.day.toString() +
        dateTime.hour.toString() +
        ':' + dateTime.minute.toString() +
        ':' + dateTime.second.toString() +
        ':' + dateTime.millisecond.toString() +
        ':' + dateTime.microsecond.toString();
    return dateTimeString;
  }

  Future<String> createFolder(String cow) async {
    final folderName = cow;
    final path = Directory(folderName);
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    if ((await path.exists())) {
      return path.path;
    } else {
      path.create();
      return path.path;
    }
  }

  Future showImage() async {
    var imagemAssinatura = await _assinaturaController.toImage();
    var pngBytes = await imagemAssinatura!.toByteData(format: ui.ImageByteFormat.png);
    // Use plugin [path_provider] to export image to storage
    Directory directory = (await getExternalStorageDirectory()) as Directory;
    String path = directory.path;
    const directoryName = 'Signature';
    String pasta = await createFolder('$path/$directoryName');
    String caminho = '$pasta/${formattedDate()}.png';
    File(caminho)
        .writeAsBytesSync(pngBytes!.buffer.asInt8List());
    setState(() {
      path_assinatura = caminho;
      Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadastroAuto(path_assinatura: path_assinatura)));
    });
    return showDialog<Null>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Salvo a assinatura',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).primaryColor,
                  letterSpacing: 1.1
              ),
            ),
            content: Image.memory(Uint8List.view(pngBytes.buffer)),
          );
        }
    );
  }
}
