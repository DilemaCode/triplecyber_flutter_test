// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triplecyber_test/modules/movies/data/models/movie.response.model.dart';
import 'package:triplecyber_test/modules/movies/data/models/movie.model.dart';
import 'package:triplecyber_test/modules/movies/data/repository/movies.repository.dart';

enum MoviesState { init, load, loading, failure }

class MoviesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static MoviesController instance = Get.find();
  SharedPreferences? prefs;
  List<MovieModel> movies = [];
  List<int> favoriteMovies = [];
  int page = 0;
  TextEditingController textController = TextEditingController(text: '9');
  MoviesState state = MoviesState.init;
  bool showOnlyFavorites = false;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    getSavedFavorites();
    getMovies();
  }

  getMovies() async {
    updateState(MoviesState.loading);
    try {
      MovieResModel moviesRes = await MoviesRepository().getMovies();
      movies = moviesRes.results;
      setFavorites();
      page = moviesRes.page;
    } catch (e) {
      updateState(MoviesState.failure);
      Get.snackbar('Error!', 'Algo ha fallado, porfavor intente de nuevo');
    }
    updateState(MoviesState.load);
  }

  filterAction() {
    showOnlyFavorites = !showOnlyFavorites;
    update();
  }

  List<MovieModel> get filterdMovies =>
      movies.where((m) => favoriteMovies.contains(m.id)).toList();
  getSavedFavorites() async {
    List saved = json.decode(prefs?.getString('favoriteMovies') ?? '');
    favoriteMovies = saved.cast();
    setFavorites();
    update();
  }

  saveFavorites() async {
    await prefs?.setString('favoriteMovies', json.encode(favoriteMovies));
  }

  setFavorites() {
    for (var i = 0; i < movies.length; i++) {
      MovieModel movie = movies[i];
      if (favoriteMovies.contains(movie.id)) {
        movie.isFavorite = true;
        movies[i] = movie;
      } else {
        if (movie.isFavorite!) {
          movie.isFavorite = false;
          movies[i] = movie;
        }
      }
    }
  }

  addToFavorites(int id) {
    favoriteMovies.add(id);
    saveFavorites();
    setFavorites();
    update();
  }

  removeFromFavorites(int id) {
    favoriteMovies.remove(id);

    update();
    saveFavorites();
    setFavorites();
    update();
  }

  updateState(MoviesState _state) {
    state = _state;
    update();
  }
}
