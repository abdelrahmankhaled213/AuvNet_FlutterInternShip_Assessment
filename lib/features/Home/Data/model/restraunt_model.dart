class Restaurant {
  final int id;
  final String name;
  final String imageUrl;
  final String address;
  final double rating;
  final int deliveryTime;
  final double deliveryFee;
  final bool isOpen;

  Restaurant({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.rating,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.isOpen,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {

    return Restaurant(

      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String,
      address: json['addresss'] as String,
      rating: (json['rating'] as num).toDouble(),
      deliveryTime: json['delivery_time'] as int,
      deliveryFee: (json['delivery_fee'] as num).toDouble(),
      isOpen: json['is_open'] as bool,
    );
  }


}
