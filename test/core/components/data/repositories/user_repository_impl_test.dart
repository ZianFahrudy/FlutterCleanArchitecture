import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/components/data/datasources/binding/binding_local.dart';
import 'package:flutter_clean_architecture/core/components/data/datasources/binding/binding_remote.dart';
import 'package:flutter_clean_architecture/core/components/data/datasources/common/base_datasource_factory.dart';
import 'package:flutter_clean_architecture/core/components/data/datasources/common/datasource_factory.dart';
import 'package:flutter_clean_architecture/core/components/data/models/request/login_body.dart';
import 'package:flutter_clean_architecture/core/components/data/models/response/user_model.dart';
import 'package:flutter_clean_architecture/core/components/data/repositories/user_repository_impl.dart';
import 'package:flutter_clean_architecture/core/components/domains/entities/response/login_model_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_repository_impl_test.mocks.dart';

@GenerateMocks([BindingLocal, BindingRemote])
void main() {
  final mockBindingLocal = MockBindingLocal();
  final mockBindingRemote = MockBindingRemote();

  final bindingDataSourceFactory = BindingDataSourceFactory(
      bindingRemote: mockBindingRemote, bindingLocal: mockBindingLocal);

  final userRepositoryImpl = UserRepositoryImpl(bindingDataSourceFactory);

  group("Testing [login]", () {
    final response = LoginModelEntity(
        data: DataLoginModelEntity(
            accessToken: "accessToken",
            tokenType: "Bearer",
            user: UserModel(
                address: "akasia",
                city: "labuan",
                createdAt: 2021,
                currentTeamId: "ccd",
                email: "email@s",
                emailVerifiedAt: "verf",
                houseNumber: "21",
                id: 33,
                name: "zian",
                phoneNumber: "081323",
                profilePhotoPath: "profil",
                profilePhotoUrl: "photoo",
                roles: "admin",
                updatedAt: 1232)));
    final body = LoginBody(email: "zian@email", password: "22323");
    test("Should return data when success", () {
      // arrange
      when(bindingDataSourceFactory
              .createData(DataSourceState.network)!
              .requestLogin(body))
          .thenAnswer((_) => Stream.fromIterable([response]));
      // act
      final result = userRepositoryImpl.requestLogin(body);

      // assert
      verify(bindingDataSourceFactory
          .createData(DataSourceState.network)!
          .requestLogin(body));

      expect(result, emitsInOrder([Right(response), emitsDone]));

      verifyNoMoreInteractions(mockBindingRemote);
    });
  });
}
