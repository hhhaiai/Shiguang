// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localAccountRepositoryHash() =>
    r'93fdb491238f7cba5ee28d2cb3cc21a91a7ebf00';

/// See also [localAccountRepository].
@ProviderFor(localAccountRepository)
final localAccountRepositoryProvider =
    AutoDisposeProvider<LocalAccountRepository>.internal(
      localAccountRepository,
      name: r'localAccountRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$localAccountRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocalAccountRepositoryRef =
    AutoDisposeProviderRef<LocalAccountRepository>;
String _$authHash() => r'0cd7541e4010ee01a67fa9aca9bec19d6aebe53f';

/// See also [Auth].
@ProviderFor(Auth)
final authProvider = AutoDisposeNotifierProvider<Auth, int?>.internal(
  Auth.new,
  name: r'authProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Auth = AutoDisposeNotifier<int?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
