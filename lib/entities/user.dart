

class User{
  late int id;
  late String nome;
  late String email;
  late String password;


  User(this.id, this.nome, this.email, this.password);


  User.fromJson(Map<String, dynamic> json, String password_user){
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    password = password_user;
  }
}