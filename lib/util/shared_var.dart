import 'package:projeto_procon/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedVar {

  static Future<void> setNome(String nome) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("nomeUser", nome);
  }

  static Future<String> getNome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('nomeUser') ?? "";
  }

  static Future<bool> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('idUser');
  }

  static Future<bool> removeNome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('nomeUser');
  }

  static Future<void> setUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("idUser", user.id.toString());
    prefs.setString("nomeUser", user.nome);
    prefs.setString("emailUser", user.email);
    prefs.setString("passwordUser", user.password);
  }

  static Future<void> removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("idUser");
    prefs.remove("nomeUser");
    prefs.remove("emailUser");
    prefs.remove("passwordUser");
  }

  static Future<User> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('idUser') ?? "";
    String nome = prefs.getString('nomeUser') ?? "";
    String email = prefs.getString('emailUser') ?? "";
    String password = prefs.getString('passwordUser') ?? "";
    return User(int.parse(id), nome, email, password);
  }

  static Future<void> setAutos(String json) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("autos", json);
  }

  static Future<String> getAutos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('autos') ?? "";
  }

  static Future<void> setOffline(String offline) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("offline", offline);
  }

  static Future<String> getOffline() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('offline') ?? "";
  }


}