import 'entity.dart';

class Book extends LibraryEntity {
  final String title;
  final String author;
  final String isbn;
  bool available;

  Book({required String id, required this.title, required this.author, required this.isbn, this.available = true}) : super(id);

  Book copyWith({String? title, String? author, String? isbn, bool? available}) {
    return Book(
      id: id,
      title: title ?? this.title,
      author: author ?? this.author,
      isbn: isbn ?? this.isbn,
      available: available ?? this.available,
    );
  }
}
