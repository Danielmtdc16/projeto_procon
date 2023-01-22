import 'dart:convert';

import 'package:projeto_procon/models/autuacao.dart';
import 'package:projeto_procon/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_procon/util/shared_var.dart';

class ConsultaApi {
  static var url_webservice = 'http://apiprocon.inforpiaui.app.br/apinota';
  static var url_login = url_webservice + '/loginapi';

  static Future<int> login(String username, String password, context) async {
    try{
      var response = await http.get(Uri.parse(url_login+"/"+username.trim()+"/"+password));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['id'] != null) {
          User user = User.fromJson(jsonResponse, password);
          await SharedVar.setUser(user);
          return 1;
        }
        return 2;
      } else {
        return 0;
      }
    }catch(e){
      return 3;
    }
  }

  Future<List<Autuacao>> getAutuacoes() async{

    var _autuacoes = <Autuacao>[];
    try{
      var url = Uri.parse(ConsultaApi.url_webservice+"/listanotaautos/0/0/0");
      var response = await http.get(url);
      if(response.statusCode == 200){
        var autuacaoesJson = json.decode(response.body);
        for(var autuacaoJson in autuacaoesJson){
          _autuacoes.add(Autuacao.fromJson(autuacaoJson));
        }
      }
    }catch(e){
    }
    return _autuacoes;
  }
}