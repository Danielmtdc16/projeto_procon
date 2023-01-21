import 'package:http/http.dart' as http;
import 'package:projeto_procon/models/result_cep.dart';

class ConsultaCEP {

  late String cep;
  static Future<ResultCep> fetchCep({cep}) async {
    final response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

    if (response.statusCode == 200){
      return ResultCep.fromJson(response.body);
    } else {
      throw Exception('Requisição Inválida');
    }

  }

}