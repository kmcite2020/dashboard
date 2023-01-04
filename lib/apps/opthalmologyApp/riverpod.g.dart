// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riverpod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$getBoxHash() => r'2d19cc52a7dbb02caefd681129dd780a2ce2b4f2';

/// See also [getBox].
class GetBoxProvider extends AutoDisposeFutureProvider<Box<dynamic>> {
  GetBoxProvider(
    this.name,
  ) : super(
          (ref) => getBox(
            ref,
            name,
          ),
          from: getBoxProvider,
          name: r'getBoxProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$getBoxHash,
        );

  final String name;

  @override
  bool operator ==(Object other) {
    return other is GetBoxProvider && other.name == name;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, name.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetBoxRef = AutoDisposeFutureProviderRef<Box<dynamic>>;

/// See also [getBox].
final getBoxProvider = GetBoxFamily();

class GetBoxFamily extends Family<AsyncValue<Box<dynamic>>> {
  GetBoxFamily();

  GetBoxProvider call(
    String name,
  ) {
    return GetBoxProvider(
      name,
    );
  }

  @override
  AutoDisposeFutureProvider<Box<dynamic>> getProviderOverride(
    covariant GetBoxProvider provider,
  ) {
    return call(
      provider.name,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getBoxProvider';
}

String _$getQuestionsHash() => r'6565e3effd045f6064489eea5afee4ddb716d1e3';

/// See also [getQuestions].
final getQuestionsProvider = AutoDisposeProvider<List<Question>>(
  getQuestions,
  name: r'getQuestionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$getQuestionsHash,
);
typedef GetQuestionsRef = AutoDisposeProviderRef<List<Question>>;
