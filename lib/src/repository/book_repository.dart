import '../models/book.dart';

abstract class BookRepository {
  List<Book> getAll();
  Book? getByIsbn(String isbn);
  void borrowBook(String isbn);
  void returnBook(String isbn);
}

class InMemoryBookRepository implements BookRepository {
  final List<Book> _books = [
  Book(id: '9780451524935', title: '1984', author: 'George Orwell', isbn: '9780451524935'),
  Book(id: '9780060850524', title: 'Brave New World', author: 'Aldous Huxley', isbn: '9780060850524'),
  Book(id: '9781451673319', title: 'Fahrenheit 451', author: 'Ray Bradbury', isbn: '9781451673319'),
  ];

  @override
  List<Book> getAll() => List.unmodifiable(_books);

  @override
  Book? getByIsbn(String isbn) {
    try {
      return _books.firstWhere((b) => b.isbn == isbn);
    } catch (_) {
      return null;
    }
  }

  @override
  void borrowBook(String isbn) {
    final book = getByIsbn(isbn);
    if (book == null) throw StateError('Book not found');
    if (!book.available) throw StateError('Book already borrowed');
    book.available = false;
  }

  @override
  void returnBook(String isbn) {
    final book = getByIsbn(isbn);
    if (book == null) throw StateError('Book not found');
    if (book.available) throw StateError('Book is not borrowed');
    book.available = true;
  }
}
