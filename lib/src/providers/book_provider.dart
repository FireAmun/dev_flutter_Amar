import 'package:flutter/foundation.dart';
import '../models/book.dart';
import '../repository/book_repository.dart';

String _ts() => DateTime.now().toIso8601String();

class BookProvider extends ChangeNotifier {
  final BookRepository repository;

  BookProvider({required this.repository});

  List<Book> get books => repository.getAll();

  void borrow(String isbn) {
    // Log request
    debugPrint('[BookProvider] ${_ts()} - borrow requested: $isbn');
    try {
      repository.borrowBook(isbn);
      debugPrint('[BookProvider] ${_ts()} - borrow success: ${repository.getByIsbn(isbn)?.title ?? isbn}');
      notifyListeners();
    } catch (e) {
      debugPrint('[BookProvider] ${_ts()} - borrow failed: $e');
      rethrow;
    }
  }

  void returnBook(String isbn) {
    debugPrint('[BookProvider] ${_ts()} - return requested: $isbn');
    try {
      repository.returnBook(isbn);
      debugPrint('[BookProvider] ${_ts()} - return success: ${repository.getByIsbn(isbn)?.title ?? isbn}');
      notifyListeners();
    } catch (e) {
      debugPrint('[BookProvider] ${_ts()} - return failed: $e');
      rethrow;
    }
  }
}
