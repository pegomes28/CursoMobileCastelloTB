//Tela Inicial da Aplicação

import 'dart:io';

import 'package:cine_favorite/controllers/favorite_movie_controller.dart';
import 'package:cine_favorite/models/favorite_movie.dart';
import 'package:cine_favorite/views/search_movie_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
        title: Text("Meus Filmes Favoritos"),
        actions: [
          IconButton(
            onPressed: FirebaseAuth.instance.signOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder<List<FavoriteMovie>>(
        stream: _favMovieController.getFavoriteMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Erro ao Carregar a Lista de Favoritos"));
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.isEmpty) {
            return Center(child: Text("Nenhum Filme Adicionado aos Favoritos"));
          }

          final favoriteMovies = snapshot.data!;

          return GridView.builder(
            padding: EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.7,
            ),
            itemCount: favoriteMovies.length,
            itemBuilder: (context, index) {
              final movie = favoriteMovies[index];
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onLongPress: () {
                          _favMovieController.removeFavorite(movie.id);
                        },
                        child: Image.file(
                          File(movie.posterPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Center(
                      child: Text(
                        movie.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    GestureDetector(
                      onTap: () async {
                        double newRating = movie.rating.toDouble();
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Alterar nota"),
                              content: StatefulBuilder(
                                builder: (context, setState) {
                                  return Slider(
                                    value: newRating,
                                    min: 0,
                                    max: 10,
                                    divisions: 10,
                                    label: newRating.toString(),
                                    onChanged: (value) {
                                      setState(() {
                                        newRating = value;
                                      });
                                    },
                                  );
                                },
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancelar"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _favMovieController.updateRating(
                                        movie.id, newRating);
                                    Navigator.pop(context);
                                  },
                                  child: Text("Salvar"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Center(
                        child: Text("Nota do Filme: ${movie.rating}"),
                      ),
                    ),
                    Center(
                      child: RatingBar.builder(
                        initialRating: movie.rating.toDouble(),
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 24,
                        itemBuilder: (context, _) =>
                            Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (rating) {
                          _favMovieController.updateRating(movie.id, rating);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchMovieView()),
        ),
        child: Icon(Icons.search),
      ),
    );
  }
}
