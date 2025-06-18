class RestEntity{
  final int id;
  final String name;
  final int delvieryTime;
  final String image;
  final bool isOpen;

  RestEntity({
    required this.name,
    required this.image,
    required this.id,
    required this.delvieryTime,
    required this.isOpen
});

}