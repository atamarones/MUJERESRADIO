import '../model/users.dart';
import 'dart:io';

abstract class MyUserRepository {
  Future<MyUser?> getMyUser();

  Future<void> saveMyUser(MyUser user, File? image);
}
