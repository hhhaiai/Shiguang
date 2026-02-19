// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vectorDiaryRepositoryHash() =>
    r'4d8e97f58aae5f7c245be069e85cbff75b4b2539';

/// See also [vectorDiaryRepository].
@ProviderFor(vectorDiaryRepository)
final vectorDiaryRepositoryProvider =
    AutoDisposeProvider<VectorDiaryRepository>.internal(
      vectorDiaryRepository,
      name: r'vectorDiaryRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$vectorDiaryRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VectorDiaryRepositoryRef =
    AutoDisposeProviderRef<VectorDiaryRepository>;
String _$embeddingServiceHash() => r'3698c205fb96a569d4eae31936655523e20a3f7a';

/// See also [embeddingService].
@ProviderFor(embeddingService)
final embeddingServiceProvider = AutoDisposeProvider<EmbeddingService>.internal(
  embeddingService,
  name: r'embeddingServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$embeddingServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EmbeddingServiceRef = AutoDisposeProviderRef<EmbeddingService>;
String _$timelineHash() => r'7502fcf2e545f21649e4742fc5c7bf29bf06792b';

/// See also [Timeline].
@ProviderFor(Timeline)
final timelineProvider =
    AutoDisposeNotifierProvider<Timeline, List<VectorDiary>>.internal(
      Timeline.new,
      name: r'timelineProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$timelineHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Timeline = AutoDisposeNotifier<List<VectorDiary>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
