import 'package:flutter_task_internship/features/Home/Data/model/profile.dart';
import 'package:hive/hive.dart';

part 'cached_profile_model.g.dart';

@HiveType(typeId: 0)
class CachedProfileModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String? imageUrl;

  CachedProfileModel({
    required this.id,
    required this.name,
    required this.email,
    this.imageUrl,
  });

  factory CachedProfileModel.formProfile(Profile profile){
    return CachedProfileModel(id: profile.id, name:profile.name, email: profile.email,imageUrl: profile.image);
  }

  Profile toProfile(){

    return Profile(email: email, name: name, id: id, image: imageUrl!);

  }
}

