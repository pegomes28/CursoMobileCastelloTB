//Tela Inicial da Aplicação

import 'dart:io';

import 'package:cine_favorite/controllers/favorite_movie_controller.dart';
import 'package:cine_favorite/models/favorite_movie.dart';
import 'package:cine_favorite/views/search_movie_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  final _favMovieController = FavoriteMovieController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Filmes Favoritos"),
        actions: [
          IconButton(
            onPressed: FirebaseAuth.instance.signOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      //a construção da Tela vai depender do conteudo da lista de favoritos
      body: StreamBuilder<List<FavoriteMovie>>(
        //buscar a lista de favoritos no firebasfirestore
        stream: _favMovieController.getFavoriteMovies(),
        builder: (context, snapshot) {
          // se deu erro ao carregar a lista
          if (snapshot.hasError) {
            return Center(child: Text("Erro ao Carregar a Lista de Favoritos"));
          }
          // enquanto está conectando com o firestore
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          // quando a lista está vazia
          if (snapshot.data!.isEmpty) {
            return Center(child: Text("Nenhum Filme Adicionado aos Favoritos"));
          }
          final favoriteMovies = snapshot.data!;
          return Expanded(
            //constainer que permite o scroll da tela
            child: GridView.builder(
              padding: EdgeInsets.all(
                8,
              ), //espaçamento do grid em relação a borda da tela de 8px
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8, //espaçametno vertical
                mainAxisSpacing: 8,
                childAspectRatio: 0.7, //espaçamento horizontal
              ),
              itemCount: favoriteMovies.length,
              itemBuilder: (context, index) {
                // criar um obj de favMovie
                final movie = favoriteMovies[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        
                        child: Image.file(File(movie.posterPath), fit: BoxFit.cover,)),
                        Center(child: Text(movie.title),),
                        
                        Center(child: Text("Nota do Filme: ${movie.rating}"),)
                       
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchMovieView())),
      child: Icon(Icons.search),),
    );
  }
}
