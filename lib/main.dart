import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/providers/book_provider.dart';
import 'src/repository/book_repository.dart';
import 'src/ui/book_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final InMemoryBookRepository repository;
  MyApp({super.key, InMemoryBookRepository? repository}) : repository = repository ?? InMemoryBookRepository();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
  create: (_) => BookProvider(repository: repository),
      child: MaterialApp(
        title: 'Book Rental System',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const BookListScreen(),
      ),
    );
  }
}
