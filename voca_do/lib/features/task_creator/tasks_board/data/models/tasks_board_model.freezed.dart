// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_board_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TasksBoardModel {

 String get id; String get task; String get status;
/// Create a copy of TasksBoardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksBoardModelCopyWith<TasksBoardModel> get copyWith => _$TasksBoardModelCopyWithImpl<TasksBoardModel>(this as TasksBoardModel, _$identity);

  /// Serializes this TasksBoardModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksBoardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.task, task) || other.task == task)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,task,status);

@override
String toString() {
  return 'TasksBoardModel(id: $id, task: $task, status: $status)';
}


}

/// @nodoc
abstract mixin class $TasksBoardModelCopyWith<$Res>  {
  factory $TasksBoardModelCopyWith(TasksBoardModel value, $Res Function(TasksBoardModel) _then) = _$TasksBoardModelCopyWithImpl;
@useResult
$Res call({
 String id, String task, String status
});




}
/// @nodoc
class _$TasksBoardModelCopyWithImpl<$Res>
    implements $TasksBoardModelCopyWith<$Res> {
  _$TasksBoardModelCopyWithImpl(this._self, this._then);

  final TasksBoardModel _self;
  final $Res Function(TasksBoardModel) _then;

/// Create a copy of TasksBoardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? task = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TasksBoardModel].
extension TasksBoardModelPatterns on TasksBoardModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TasksBoardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TasksBoardModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TasksBoardModel value)  $default,){
final _that = this;
switch (_that) {
case _TasksBoardModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TasksBoardModel value)?  $default,){
final _that = this;
switch (_that) {
case _TasksBoardModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String task,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TasksBoardModel() when $default != null:
return $default(_that.id,_that.task,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String task,  String status)  $default,) {final _that = this;
switch (_that) {
case _TasksBoardModel():
return $default(_that.id,_that.task,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String task,  String status)?  $default,) {final _that = this;
switch (_that) {
case _TasksBoardModel() when $default != null:
return $default(_that.id,_that.task,_that.status);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _TasksBoardModel implements TasksBoardModel {
  const _TasksBoardModel({required this.id, required this.task, required this.status});
  factory _TasksBoardModel.fromJson(Map<String, dynamic> json) => _$TasksBoardModelFromJson(json);

@override final  String id;
@override final  String task;
@override final  String status;

/// Create a copy of TasksBoardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TasksBoardModelCopyWith<_TasksBoardModel> get copyWith => __$TasksBoardModelCopyWithImpl<_TasksBoardModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TasksBoardModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TasksBoardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.task, task) || other.task == task)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,task,status);

@override
String toString() {
  return 'TasksBoardModel(id: $id, task: $task, status: $status)';
}


}

/// @nodoc
abstract mixin class _$TasksBoardModelCopyWith<$Res> implements $TasksBoardModelCopyWith<$Res> {
  factory _$TasksBoardModelCopyWith(_TasksBoardModel value, $Res Function(_TasksBoardModel) _then) = __$TasksBoardModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String task, String status
});




}
/// @nodoc
class __$TasksBoardModelCopyWithImpl<$Res>
    implements _$TasksBoardModelCopyWith<$Res> {
  __$TasksBoardModelCopyWithImpl(this._self, this._then);

  final _TasksBoardModel _self;
  final $Res Function(_TasksBoardModel) _then;

/// Create a copy of TasksBoardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? task = null,Object? status = null,}) {
  return _then(_TasksBoardModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
