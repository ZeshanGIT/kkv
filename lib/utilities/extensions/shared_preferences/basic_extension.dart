import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/constants.dart';

extension BasicSharedPreferenceExtension on SharedPreferences {
  String? getRole() {
    return this.getString(StoredDetails.ROLE);
  }

  Future<bool?> setRole(String role) async {
    return await this.setString(StoredDetails.ROLE, role);
  }

  String? getUid() {
    return this.getString(StoredDetails.USER_ID);
  }

  Future<bool?> setUid(String uid) async {
    return await this.setString(StoredDetails.USER_ID, uid);
  }
}
