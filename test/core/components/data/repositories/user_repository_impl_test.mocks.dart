// Mocks generated by Mockito 5.0.15 from annotations
// in flutter_clean_architecture/test/core/components/data/repositories/user_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:flutter_clean_architecture/core/components/data/datasources/binding/binding_local.dart'
    as _i3;
import 'package:flutter_clean_architecture/core/components/data/datasources/binding/binding_remote.dart'
    as _i7;
import 'package:flutter_clean_architecture/core/components/data/models/request/login_body.dart'
    as _i6;
import 'package:flutter_clean_architecture/core/components/domains/entities/response/login_model_entity.dart'
    as _i5;
import 'package:flutter_clean_architecture/core/storage/local_storage.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeSharedPrefs_0 extends _i1.Fake implements _i2.SharedPrefs {}

/// A class which mocks [BindingLocal].
///
/// See the documentation for Mockito's code generation for more information.
class MockBindingLocal extends _i1.Mock implements _i3.BindingLocal {
  MockBindingLocal() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<_i5.LoginModelEntity> requestLogin(_i6.LoginBody? body) =>
      (super.noSuchMethod(Invocation.method(#requestLogin, [body]),
              returnValue: Stream<_i5.LoginModelEntity>.empty())
          as _i4.Stream<_i5.LoginModelEntity>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [BindingRemote].
///
/// See the documentation for Mockito's code generation for more information.
class MockBindingRemote extends _i1.Mock implements _i7.BindingRemote {
  MockBindingRemote() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.SharedPrefs get prefs => (super.noSuchMethod(Invocation.getter(#prefs),
      returnValue: _FakeSharedPrefs_0()) as _i2.SharedPrefs);
  @override
  set prefs(_i2.SharedPrefs? _prefs) =>
      super.noSuchMethod(Invocation.setter(#prefs, _prefs),
          returnValueForMissingStub: null);
  @override
  _i4.Stream<_i5.LoginModelEntity> requestLogin(_i6.LoginBody? body) =>
      (super.noSuchMethod(Invocation.method(#requestLogin, [body]),
              returnValue: Stream<_i5.LoginModelEntity>.empty())
          as _i4.Stream<_i5.LoginModelEntity>);
  @override
  String toString() => super.toString();
}
