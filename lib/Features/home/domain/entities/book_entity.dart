import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? image;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? authorName;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final String bookId;
  @HiveField(5)
  final String previewLink;
  @HiveField(6)
  final String category;

  const BookEntity({
    required this.image,
    required this.title,
    required this.authorName,
    required this.name,
    required this.previewLink,
    required this.bookId,
    required this.category,
  });
}
