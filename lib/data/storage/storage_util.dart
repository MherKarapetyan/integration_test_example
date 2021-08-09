import 'package:integration_test_example/data/mapper/credentials_mapper.dart';
import 'package:integration_test_example/data/storage/model/user_response.dart';
import 'package:integration_test_example/data/storage/request/credentials_body.dart';
import 'package:integration_test_example/data/storage/service/storage_service.dart';
import 'package:integration_test_example/domain/model/user_credentials.dart';
import 'package:integration_test_example/presentation/widgets/snackbars.dart';

class StorageUtil {
  final StorageService _storageService;
  const StorageUtil(this._storageService);

  ///
  /// [login] function tries to login user with inputted credentials.
  ///
  /// Gets arguments:
  /// * `String email`
  /// * `String password`
  ///
  /// Function returns `UserCredentials` object.
  ///
  Future<UserCredentials> login({
     String email,
     String password,
  }) async {
    final RequestBody body = RequestBody(email: email, password: password);
    final UserResponse result = await _storageService.login(body);
    if (result.error?.isNotEmpty ?? false)
      Snackbars().showMessage(text: result.error);
    return CredentialsMapper().fromStorage(result);
  }

  ///
  /// [setEmailAndPassword] function stores email and password in `StorageService`.
  ///
  /// Gets arguments:
  /// * `String email`
  /// * `String password`
  ///
  /// Function creates `RequestBody` model inside of function and converts to
  /// `UserCredentials` model, after that returns this object.
  ///
  Future<UserCredentials> setEmailAndPassword({
    String email,
    String password,
  }) async {
    final RequestBody body = RequestBody(email: email, password: password);
    final UserResponse result = await _storageService.setEmailAndPassword(body);
    if (result.error?.isNotEmpty ?? false)
      Snackbars().showMessage(text: result.error);
    return CredentialsMapper().fromStorage(result);
  }

  ///
  /// [checkSignedUser] function tries to find signed user's email.
  ///
  Future<UserCredentials> checkSignedUser() async {
    final UserResponse result = await _storageService.checkSignedUser();
    return CredentialsMapper().fromStorage(result);
  }

  ///
  /// [checkSignedUser] function tries to find signed user's email
  /// and remove it.
  ///
  Future<UserCredentials> logout() async {
    final UserResponse result = await _storageService.deleteSignedAccount();
    if (result.error?.isNotEmpty ?? false)
      Snackbars().showMessage(text: result.error);
    return CredentialsMapper().fromStorage(result);
  }
}
