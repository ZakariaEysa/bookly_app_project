class BookEntity {
  final String image;
  final String title;
  final String authorName;
  final String name;

  final String price;

  BookEntity(
      {required this.image,
      required this.title,
      required this.authorName,
      required this.price,
      required this.name});
}
