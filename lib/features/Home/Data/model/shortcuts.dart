class ShortCuts{

  final int id;
  final String name;
  final String image;
  ShortCuts({
    required this.id,
    required this.name,
    required this.image
});

  factory ShortCuts.fromJson(Map<String,dynamic>json){

    return ShortCuts(id: json['id'],name: json['name'], image: json['image_url']);

  }
}