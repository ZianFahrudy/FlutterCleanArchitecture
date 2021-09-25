import 'dart:convert';

import 'package:flutter_clean_architecture/core/components/data/models/response/login_model.dart';
import 'package:flutter_clean_architecture/core/components/data/models/response/meta_model.dart';
import 'package:flutter_clean_architecture/core/components/data/models/response/user_model.dart';
import 'package:flutter_clean_architecture/core/components/domains/entities/response/login_model_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final LoginModel loginModel = LoginModel(
      meta: MetaModel(code: 200, message: "Authenticated", status: "success"),
      data: DataLoginModel(
          accessToken: "sdsdw43434",
          tokenType: "sjdhjshd",
          user: UserModel(
              address: "alaska",
              city: "labuan",
              createdAt: 2021,
              currentTeamId: "team",
              email: "example",
              emailVerifiedAt: "sdsd",
              houseNumber: "23",
              id: 1213,
              name: "zian",
              phoneNumber: "0886876",
              profilePhotoPath: "jhsdjhsd",
              profilePhotoUrl: "jashdjsd",
              roles: "student",
              updatedAt: 2021)));

  group('Testing LoginModel', () {
    test('should be a subclass LoginModelEntity', () {
      expect(loginModel, isA<LoginModelEntity>());
    });

    test('fromJson, should return a valid model', () {
      /// Arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('login_resp.json'));

      /// Act
      final result = LoginModel.fromJson(jsonMap);

      /// Assert
      expect(result, loginModel);
    });
  });
}
