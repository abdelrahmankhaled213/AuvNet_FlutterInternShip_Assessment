class SignUpRequest {
  final String? id;
  final String email;
  final String password;
  final String name;
  final String urlImage;

  SignUpRequest({
    this.id,
    required this.name,
    required this.urlImage,
    required this.password,
    required this.email,
  });

  SignUpRequest copyWith({
    String? id,
    String? email,
    String? password,
    String? name,
    String? urlImage,
  }) {
    return SignUpRequest(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      urlImage: urlImage ?? this.urlImage,
    );
  }



Map<String,dynamic>toJson(){

  return {
        'name':name,
    'image_url':urlImage,
    'email':email,

  };

}
}