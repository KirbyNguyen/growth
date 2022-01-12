// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bottom_tab_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BottomTabItemTearOff {
  const _$BottomTabItemTearOff();

  _BottomTabItem call(
      {required String pageName,
      required IconData iconData,
      required Navigator navigator,
      required GlobalKey<NavigatorState> navigatorKey}) {
    return _BottomTabItem(
      pageName: pageName,
      iconData: iconData,
      navigator: navigator,
      navigatorKey: navigatorKey,
    );
  }
}

/// @nodoc
const $BottomTabItem = _$BottomTabItemTearOff();

/// @nodoc
mixin _$BottomTabItem {
  String get pageName => throw _privateConstructorUsedError;
  IconData get iconData => throw _privateConstructorUsedError;
  Navigator get navigator => throw _privateConstructorUsedError;
  GlobalKey<NavigatorState> get navigatorKey =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BottomTabItemCopyWith<BottomTabItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomTabItemCopyWith<$Res> {
  factory $BottomTabItemCopyWith(
          BottomTabItem value, $Res Function(BottomTabItem) then) =
      _$BottomTabItemCopyWithImpl<$Res>;
  $Res call(
      {String pageName,
      IconData iconData,
      Navigator navigator,
      GlobalKey<NavigatorState> navigatorKey});
}

/// @nodoc
class _$BottomTabItemCopyWithImpl<$Res>
    implements $BottomTabItemCopyWith<$Res> {
  _$BottomTabItemCopyWithImpl(this._value, this._then);

  final BottomTabItem _value;
  // ignore: unused_field
  final $Res Function(BottomTabItem) _then;

  @override
  $Res call({
    Object? pageName = freezed,
    Object? iconData = freezed,
    Object? navigator = freezed,
    Object? navigatorKey = freezed,
  }) {
    return _then(_value.copyWith(
      pageName: pageName == freezed
          ? _value.pageName
          : pageName // ignore: cast_nullable_to_non_nullable
              as String,
      iconData: iconData == freezed
          ? _value.iconData
          : iconData // ignore: cast_nullable_to_non_nullable
              as IconData,
      navigator: navigator == freezed
          ? _value.navigator
          : navigator // ignore: cast_nullable_to_non_nullable
              as Navigator,
      navigatorKey: navigatorKey == freezed
          ? _value.navigatorKey
          : navigatorKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<NavigatorState>,
    ));
  }
}

/// @nodoc
abstract class _$BottomTabItemCopyWith<$Res>
    implements $BottomTabItemCopyWith<$Res> {
  factory _$BottomTabItemCopyWith(
          _BottomTabItem value, $Res Function(_BottomTabItem) then) =
      __$BottomTabItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String pageName,
      IconData iconData,
      Navigator navigator,
      GlobalKey<NavigatorState> navigatorKey});
}

/// @nodoc
class __$BottomTabItemCopyWithImpl<$Res>
    extends _$BottomTabItemCopyWithImpl<$Res>
    implements _$BottomTabItemCopyWith<$Res> {
  __$BottomTabItemCopyWithImpl(
      _BottomTabItem _value, $Res Function(_BottomTabItem) _then)
      : super(_value, (v) => _then(v as _BottomTabItem));

  @override
  _BottomTabItem get _value => super._value as _BottomTabItem;

  @override
  $Res call({
    Object? pageName = freezed,
    Object? iconData = freezed,
    Object? navigator = freezed,
    Object? navigatorKey = freezed,
  }) {
    return _then(_BottomTabItem(
      pageName: pageName == freezed
          ? _value.pageName
          : pageName // ignore: cast_nullable_to_non_nullable
              as String,
      iconData: iconData == freezed
          ? _value.iconData
          : iconData // ignore: cast_nullable_to_non_nullable
              as IconData,
      navigator: navigator == freezed
          ? _value.navigator
          : navigator // ignore: cast_nullable_to_non_nullable
              as Navigator,
      navigatorKey: navigatorKey == freezed
          ? _value.navigatorKey
          : navigatorKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<NavigatorState>,
    ));
  }
}

/// @nodoc

class _$_BottomTabItem implements _BottomTabItem {
  _$_BottomTabItem(
      {required this.pageName,
      required this.iconData,
      required this.navigator,
      required this.navigatorKey});

  @override
  final String pageName;
  @override
  final IconData iconData;
  @override
  final Navigator navigator;
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  String toString() {
    return 'BottomTabItem(pageName: $pageName, iconData: $iconData, navigator: $navigator, navigatorKey: $navigatorKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BottomTabItem &&
            const DeepCollectionEquality().equals(other.pageName, pageName) &&
            const DeepCollectionEquality().equals(other.iconData, iconData) &&
            const DeepCollectionEquality().equals(other.navigator, navigator) &&
            const DeepCollectionEquality()
                .equals(other.navigatorKey, navigatorKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pageName),
      const DeepCollectionEquality().hash(iconData),
      const DeepCollectionEquality().hash(navigator),
      const DeepCollectionEquality().hash(navigatorKey));

  @JsonKey(ignore: true)
  @override
  _$BottomTabItemCopyWith<_BottomTabItem> get copyWith =>
      __$BottomTabItemCopyWithImpl<_BottomTabItem>(this, _$identity);
}

abstract class _BottomTabItem implements BottomTabItem {
  factory _BottomTabItem(
      {required String pageName,
      required IconData iconData,
      required Navigator navigator,
      required GlobalKey<NavigatorState> navigatorKey}) = _$_BottomTabItem;

  @override
  String get pageName;
  @override
  IconData get iconData;
  @override
  Navigator get navigator;
  @override
  GlobalKey<NavigatorState> get navigatorKey;
  @override
  @JsonKey(ignore: true)
  _$BottomTabItemCopyWith<_BottomTabItem> get copyWith =>
      throw _privateConstructorUsedError;
}
