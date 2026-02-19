import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'objectbox_service.dart';

part 'objectbox_providers.g.dart';

@Riverpod(keepAlive: true)
ObjectBoxService objectBoxService(Ref ref) {
  throw UnimplementedError('ObjectBoxService must be overridden in main');
}
