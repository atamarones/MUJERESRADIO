import 'package:prueba_auth/providers/firebase_provider.dart';
import '../../model/users.dart';
import '../my_user_repository.dart';
import 'dart:io';

class MyUserRepositoryImp extends MyUserRepository {
  final provider = FirebaseProvider();

  @override
  Future<MyUser?> getMyUser() => provider.getMyUser();

  @override
  Future<void> saveMyUser(MyUser user, File? image) =>
      provider.saveMyUser(user, image);
}
