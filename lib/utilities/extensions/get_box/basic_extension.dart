import 'package:get_storage/get_storage.dart';
import 'package:kkv/common/constants.dart';

extension BasicBoxExtension on GetStorage {
  Future<void> setRole(String role) async {
    await this.write(StoredDetails.ROLE, role);
  }

  String getRole() {
    return this.read(StoredDetails.ROLE);
  }

  String? getUid() {
    return this.read(StoredDetails.USER_ID);
  }

  Future<void> setUid(String uid) async {
    return await this.write(StoredDetails.USER_ID, uid);
  }
}
