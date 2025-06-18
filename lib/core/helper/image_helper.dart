import 'package:image_picker/image_picker.dart';

class ImageHelper{

  ImageHelper._();

  static final ImageHelper instance=ImageHelper._();


  Future<XFile?>uploadImage(ImageSource imageType)async{

    final data=await ImagePicker().pickImage(source: imageType,);
    return data;

  }
}