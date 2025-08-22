import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/book_provider.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookProvider>();
    final books = provider.books;

    return Scaffold(
      appBar: AppBar(title: const Text('My Library')),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text('${book.author} — ${book.isbn}'),
            trailing: book.available
                ? ElevatedButton(
                    onPressed: () async {
                      try {
                        provider.borrow(book.isbn);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Borrow requested')));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Borrow failed: $e')));
                      }
                    },
                    child: const Text('Borrow'),
                  )
                : ElevatedButton(
                    onPressed: () async {
                      try {
                        provider.returnBook(book.isbn);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Return requested')));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Return failed: $e')));
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    child: const Text('Return'),
                  ),
          );
        },
      ),
    );
  }
}
