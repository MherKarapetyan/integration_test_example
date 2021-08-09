import 'package:integration_test_example/data/storage/service/storage_service.dart';
import 'package:integration_test_example/data/storage/storage_util.dart';

///
/// [StorageModule] class unites separated Storage services.
///
/// `StorageModule().storageUtil` function creates `StorageUtil`
/// instance, that contains `StorageService`'s methods.
///
class StorageModule {
  static StorageUtil _storageUtil;

  static StorageUtil storageUtil() {
    if (_storageUtil == null) _storageUtil = StorageUtil(StorageService());
    return _storageUtil;
  }
}
