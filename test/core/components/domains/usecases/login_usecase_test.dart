import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/components/data/models/request/login_body.dart';
import 'package:flutter_clean_architecture/core/components/data/models/response/user_model.dart';
import 'package:flutter_clean_architecture/core/components/domains/entities/response/login_model_entity.dart';
import 'package:flutter_clean_architecture/core/components/domains/repository/user_repository.dart';
import 'package:flutter_clean_architecture/core/components/domains/usecases/login_usecase.dart';
import 'package:flutter_clean_architecture/core/exceptions/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_usecase_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  final mockUserRepository = MockUserRepository();
  group("Testing Login", () {
    final useCase = LoginUseCase(mockUserRepository);
    final body = LoginBody(email: "email@zian.com", password: "12345678");

    test("Should get success a data", () {
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

      // arrange
      when(mockUserRepository.requestLogin(body))
          .thenAnswer((_) => Stream.fromIterable([Right(response)]));

      // act
      final result = useCase.execute(body);

      // assert
      expect(result, emitsInOrder([Right(response), emitsDone]));
      verify(mockUserRepository.requestLogin(body));
      verifyNoMoreInteractions(mockUserRepository);
    });

    test("Should get failure a data", () {
      final response = ServerFailure(message: "Server fail");

      // arrange
      when(mockUserRepository.requestLogin(body))
          .thenAnswer((_) => Stream.fromIterable([Left(response)]));

      // act
      final result = useCase.execute(body);

      // assert
      expect(result, emitsInOrder([Left(response), emitsDone]));
      verify(mockUserRepository.requestLogin(body));
      verifyNoMoreInteractions(mockUserRepository);
    });
  });
}
