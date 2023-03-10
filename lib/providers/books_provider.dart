import 'package:flutter/foundation.dart';
import 'package:bhajan_kirtan_byBasanta/models/book.dart';
import 'package:bhajan_kirtan_byBasanta/repositories/db_repository.dart';

class Books with ChangeNotifier {
  List<Book?>? _recentBooks = [];
  List<Book?>? _libraryBooks = [];

  List<Book?>? get recentBooks {
    return [..._recentBooks!];
  }

  List<Book?>? get libraryBooks {
    return [..._libraryBooks!];
  }

  void addBookRecent(Book? book) {
    _recentBooks!.insert(0, book);
    if (_recentBooks!.length > 6) {
      _recentBooks!.removeLast();
    }
    notifyListeners();
  }

  void addBookLibrary(Book? book) {
    if (_libraryBooks!.length == 10) return;
    _libraryBooks!.add(book);
    notifyListeners();
  }

  Future<void> loadRecentBooks() async {
    List<Book>? _loadedBooks = await DBRepository.fetchBooks(
      orderBy: 'dateTime',
      desc: true,
      limit: 6,
    );
    _recentBooks = _loadedBooks;
    notifyListeners();
  }

  Future<void> loadLibraryBooks() async {
    List<Book>? _loadedBooks = await DBRepository.fetchBooks(limit: 10);
    _libraryBooks = _loadedBooks;
    notifyListeners();
  }

  Future<Book?>? fetchById(String id) async {
    return DBRepository.findById(id);
  }
}
