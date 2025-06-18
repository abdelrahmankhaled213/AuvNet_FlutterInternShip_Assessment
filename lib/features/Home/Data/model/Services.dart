class Services {
  final int id;
  final String name;
  final String discount;
  final String? delivery;
  final String image;

  Services({
    required this.id,
    required this.name,
    required this.discount,
     this.delivery,
    required this.image,
  });

  factory Services.fromJson(Map<String, dynamic> json) {
    return Services(
      id: json['id'] as int,
      name: json['name'] as String,
      discount: json['discount'] as String,
      delivery: json['delivery'] as String?,
      image: json['image_url'] as String,
    );
  }
}
