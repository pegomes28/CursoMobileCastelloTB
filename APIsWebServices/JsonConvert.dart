//Teste de Conversão Json <-> Dart // Stream Pinkpantheress
// 0010101001001011011101110101111010101010101

import 'dart:convert'; // Biblioteca nativa -> não precisa baixar para o pubspec

void main() {
  // um texto em formato de Json 
  String UsuarioJson = '''{
                            "id": "1ab2",
                            "user": "usuario1",
                            "nome": "Emilie",
                            "idade": 25, 
                            "cadastrado": true
                      }''';
    // Para manipular o texto
    // Converter(decode) JSON em MAP
  Map<String, dynamic> usuario = json.decode(UsuarioJson);
    // Manipulando informações do JSON -> MAP
  print(usuario["idade"]);
  usuario["idade"] = 26;
    // Converter(encode) novamente de MAP -> JSON
  UsuarioJson = json.encode(usuario);
    // Tenho novamente o JSON em formato de Texto
  print(UsuarioJson);
}
