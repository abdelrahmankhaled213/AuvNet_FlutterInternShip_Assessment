import 'package:hive_flutter/hive_flutter.dart';

import '../../features/Home/Data/model/cached_profile_model.dart';

class HiveHelper {

  HiveHelper._();

  static final HiveHelper instance=HiveHelper._();

    final String _profileBoxName = 'profileBox';

   Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProfileModelAdapter());
    await Hive.openBox<CachedProfileModel>(_profileBoxName);
  }

  Future<void> saveProfile(CachedProfileModel profile) async {
    final box = Hive.box<CachedProfileModel>(_profileBoxName);
    await box.put('profile', profile);
  }

   CachedProfileModel? getProfile() {
    final box = Hive.box<CachedProfileModel>(_profileBoxName);
    return box.get('profile');
  }

   Future<void> clearProfile() async {
    final box = Hive.box<CachedProfileModel>(_profileBoxName);
    await box.delete('profile');
  }
}
