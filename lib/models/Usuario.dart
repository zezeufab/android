class Usuario {
  int codigo;
  String nome;
  String image;
  String email;
  String senha;

  Usuario(this.codigo, this.nome, this.email, this.senha, this.image);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'CODIGO': codigo,
      'NOME': nome,
      'EMAIL': email,
      'SENHA': senha,
      'IMAGE': image
    };
    return map;
  }

  Usuario.fromMap(Map<String, dynamic> map) {
    codigo = map['CODIGO'];
    nome = map['NOME'];
    email = map['EMAIL'];
    senha = map['SENHA'];
    image = map['IMAGE'];
  }
}
