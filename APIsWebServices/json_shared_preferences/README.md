# json_shared_preferences

A new Flutter project.


Shared Preferences ( Armazenamento Interno do Aplicativo )

Armazenamento Chave -> Valor
              "config" -> "Texto" texto em formato Json

O que é um Texto em formato Json -> 
[
    config:{
        "NomedoUsuario" : "nome do usuário",
        "IdadedoUsuario" : 25,
        "TemaEscuro" : true
    }
]

dart -> Linguagem de Programação do Flutter não le Json
     ->converter  => converter (json.decode => convert Texto:Json em Map:Dart)
                  => converter (json.encode => convert Map:Dart em Texto:Json)

