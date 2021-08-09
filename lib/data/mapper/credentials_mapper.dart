import 'package:integration_test_example/data/storage/model/user_response.dart';
import 'package:integration_test_example/domain/model/user_credentials.dart';

///
/// [CredentialsMapper] class is responsible for converting data models.
///
class CredentialsMapper {
  ///
  /// [fromStorage] function is responsible for converting `UserResponse`
  /// object to `UserCredentials`.
  ///
  UserCredentials fromStorage(UserResponse response) => UserCredentials(
        email: response.email,
        password: response.password,
      );
}
