class Profile{

  final String id;
  final String name;
  final String image;
  final String email;

  Profile(
  {
    required this.email,
    required this.name,
     required this.id,
    required this.image
});

  factory Profile.fromJson(Map<String,dynamic>json){

    return Profile(email: json['email']
        , name: json['name'],

id: json['id']
        , image:json['image_url']);

  }
}