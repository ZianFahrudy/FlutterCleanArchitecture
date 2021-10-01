import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/components/blocs/user/login/login_bloc.dart';
import 'package:flutter_clean_architecture/core/components/data/models/request/login_body.dart';
import 'package:flutter_clean_architecture/core/components/data/models/response/user_model.dart';
import 'package:flutter_clean_architecture/core/components/domains/entities/response/login_model_entity.dart';
import 'package:flutter_clean_architecture/core/components/domains/usecases/login_usecase.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/exceptions/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_bloc_test.mocks.dart';

@GenerateMocks([LoginUseCase])
void main() {
  late MockLoginUseCase mockLoginUseCase;
  late LoginBloc bloc;

  setUp(() async {
    await init();
    mockLoginUseCase = MockLoginUseCase();
    bloc = LoginBloc(mockLoginUseCase);
  });

  tearDown(() async {
    await sl.reset();
  });

  group('Testing LoginBloc', () {
    var response = LoginModelEntity(
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

    var body = LoginBody(email: "zian@email", password: "22323");

    test('initial state should return LoginInitial', () {
      /// Assert
      expect(bloc.state, LoginInitial());
    });

    test('returns correct props', () {
      expect(OnLoginEvent(body).props, []);
    });

    test('should get data from the concrete usecase', () async {
      /// Arrange
      when(mockLoginUseCase.execute(any))
          .thenAnswer((_) => Stream.fromIterable([Right(response)]));

      /// Act
      bloc.add(OnLoginEvent(body));
      await untilCalled(mockLoginUseCase.execute(any));

      /// Assert
      verify(mockLoginUseCase.execute(body));
    });

    blocTest<LoginBloc, LoginState>(
      "should emit[LoginLoading, LoginSuccess] when data is gotten successfully",
      build: () {
        when(mockLoginUseCase.execute(any))
            .thenAnswer((_) => Stream.fromIterable([Right(response)]));
        return bloc;
      },
      act: (bloc) => bloc.add(OnLoginEvent(body)),
      expect: () => [
        LoginLoading(),
        LoginSuccess(),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      "should emit[LoginLoading, LoginFailure] when data is gotten error",
      build: () {
        when(mockLoginUseCase.execute(any)).thenAnswer((_) =>
            Stream.fromIterable(
                [const Left(ServerFailure(message: "server fail"))]));
        return bloc;
      },
      act: (bloc) => bloc.add(OnLoginEvent(body)),
      expect: () => [
        LoginLoading(),
        LoginFailure("server fail"),
      ],
    );
  });
}
