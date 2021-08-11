import 'dart:convert' show base64UrlEncode;
import 'dart:math' show Random;

import 'package:integration_test_example/internal/core/regexp.dart';

class Generate {
  static String email() {
    var random = Random.secure();
    var prefixValues = List<int>.generate(3, (i) => random.nextInt(255));
    var hostValues = List<int>.generate(3, (i) => random.nextInt(255));
    var domainValues = List<int>.generate(2, (i) => random.nextInt(255));
    String _prefix = base64UrlEncode(prefixValues)
        .replaceAll(RegularExpressions.characters, '');
    String _host = base64UrlEncode(hostValues)
        .replaceAll(RegularExpressions.characters, '');
    String _domain = base64UrlEncode(domainValues)
        .replaceAll(RegularExpressions.characters, '')
        .replaceAll(RegularExpressions.digits, '')
        .replaceAll('_', '');
    return 'A$_prefix@A$_host.A$_domain';
  }
}
