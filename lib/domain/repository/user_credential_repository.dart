import 'package:integration_test_example/domain/model/user_credentials.dart';

abstract class UserCredentialsRepository {
  Future<UserCredentials> login({
    String email,
    String password,
  });
  Future<UserCredentials> logout();
  Future<UserCredentials> checkSignedUser();
  Future<UserCredentials> setEmailAndPassword({
    String email,
    String password,
  });
}
