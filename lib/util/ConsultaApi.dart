import 'dart:convert' as convert;

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
        var jsonResponse = convert.jsonDecode(response.body);
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
        var autuacaoesJson = convert.jsonDecode(response.body);
        for(var autuacaoJson in autuacaoesJson){
          _autuacoes.add(Autuacao.fromJson(autuacaoJson));
        }
      }
    }catch(e){
    }
    return _autuacoes;
  }

  static Future<int> salvar_auto(Autuacao autuacao, context) async {
    print("servidor:");
    var params = convert.jsonEncode({
      'notaauto': autuacao.toJson()});
    int idAuto = 0;
    try {
      Map<String, String> headers = {"Content-Type":  "application/json; charset=UTF-8"  };
      var response = await http.post(
          Uri.parse(url_webservice+"/savenotaauto"),headers: headers, body: params);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        print(jsonResponse);
        idAuto = Autuacao
            .fromJson(jsonResponse)
            .id;
      }
    }catch(e){
      return 0;
    }
    return idAuto;
  }
}