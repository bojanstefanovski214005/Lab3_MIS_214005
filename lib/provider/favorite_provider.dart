import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  List<String> _jokes = [];
  List<String> get jokes => _jokes;

  void toggleFavorite(String joke) {
    final isExist = _jokes.contains(joke);
    if (isExist) {
      _jokes.remove(joke);
    } else {
      _jokes.add(joke);
    }
    notifyListeners();
  }

  bool isExist(String joke) {
    final isExist = _jokes.contains(joke);
    return isExist;
  }

  void clearFavorite() {
    _jokes = [];
    notifyListeners();
  }

  static FavoriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
