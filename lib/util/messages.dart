import 'package:flutter/material.dart';

class Messages {
  void msgErro(String msg, BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Erro"),
          backgroundColor: Colors.green,
          content: Text(msg),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }

  void msgInfor(String msg, BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Informação"),
          backgroundColor: Colors.green,
          content: Text(msg),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }

  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: const [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Processando....",style: TextStyle(color: Colors.blueAccent),)
                      ]),
                    )
                  ]));
        });
  }
}