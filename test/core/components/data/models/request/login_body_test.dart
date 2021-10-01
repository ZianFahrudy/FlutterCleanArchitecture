import 'dart:convert';

import 'package:flutter_clean_architecture/core/components/data/models/request/login_body.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final body = LoginBody(email: "zian@example.co", password: "12345678");

  group("ToJson", () {
    test("should return json map containing a proper data", () {
      // Arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture("login_req.json"));

      // Act
      final result = body.toJson();

      //Assert
      expect(jsonMap, result);
    });
  });
}
