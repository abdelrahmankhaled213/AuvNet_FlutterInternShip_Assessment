 import 'package:flutter_task_internship/features/Home/Data/model/profile.dart';
import 'package:flutter_task_internship/features/Home/Data/model/restraunt_model.dart';
import 'package:flutter_task_internship/features/Home/Domain/Entity/profile_entity.dart';
import 'package:flutter_task_internship/features/Home/Domain/Entity/rest_entity.dart';

ProfileEntity toProfileEntity(Profile profile){

  return ProfileEntity(image: profile.image, name: profile.name);
}

RestEntity toRestEntity(Restaurant restraunt){
  return RestEntity(name: restraunt.name, image: restraunt.imageUrl, id:restraunt.id, delvieryTime:restraunt.deliveryTime
      , isOpen: restraunt.isOpen);
}