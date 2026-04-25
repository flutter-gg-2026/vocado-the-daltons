// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewTaskModel {

 String get task; String get assignee; DateTime get dueDate;
/// Create a copy of NewTaskModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewTaskModelCopyWith<NewTaskModel> get copyWith => _$NewTaskModelCopyWithImpl<NewTaskModel>(this as NewTaskModel, _$identity);

  /// Serializes this NewTaskModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewTaskModel&&(identical(other.task, task) || other.task == task)&&(identical(other.assignee, assignee) || other.assignee == assignee)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,task,assignee,dueDate);

@override
String toString() {
  return 'NewTaskModel(task: $task, assignee: $assignee, dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class $NewTaskModelCopyWith<$Res>  {
  factory $NewTaskModelCopyWith(NewTaskModel value, $Res Function(NewTaskModel) _then) = _$NewTaskModelCopyWithImpl;
@useResult
$Res call({
 String task, String assignee, DateTime dueDate
});




}
/// @nodoc
class _$NewTaskModelCopyWithImpl<$Res>
    implements $NewTaskModelCopyWith<$Res> {
  _$NewTaskModelCopyWithImpl(this._self, this._then);

  final NewTaskModel _self;
  final $Res Function(NewTaskModel) _then;

/// Create a copy of NewTaskModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? task = null,Object? assignee = null,Object? dueDate = null,}) {
  return _then(_self.copyWith(
task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as String,assignee: null == assignee ? _self.assignee : assignee // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [NewTaskModel].
extension NewTaskModelPatterns on NewTaskModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewTaskModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewTaskModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewTaskModel value)  $default,){
final _that = this;
switch (_that) {
case _NewTaskModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewTaskModel value)?  $default,){
final _that = this;
switch (_that) {
case _NewTaskModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String task,  String assignee,  DateTime dueDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewTaskModel() when $default != null:
return $default(_that.task,_that.assignee,_that.dueDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String task,  String assignee,  DateTime dueDate)  $default,) {final _that = this;
switch (_that) {
case _NewTaskModel():
return $default(_that.task,_that.assignee,_that.dueDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String task,  String assignee,  DateTime dueDate)?  $default,) {final _that = this;
switch (_that) {
case _NewTaskModel() when $default != null:
return $default(_that.task,_that.assignee,_that.dueDate);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _NewTaskModel implements NewTaskModel {
  const _NewTaskModel({required this.task, required this.assignee, required this.dueDate});
  factory _NewTaskModel.fromJson(Map<String, dynamic> json) => _$NewTaskModelFromJson(json);

@override final  String task;
@override final  String assignee;
@override final  DateTime dueDate;

/// Create a copy of NewTaskModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewTaskModelCopyWith<_NewTaskModel> get copyWith => __$NewTaskModelCopyWithImpl<_NewTaskModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewTaskModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewTaskModel&&(identical(other.task, task) || other.task == task)&&(identical(other.assignee, assignee) || other.assignee == assignee)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,task,assignee,dueDate);

@override
String toString() {
  return 'NewTaskModel(task: $task, assignee: $assignee, dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class _$NewTaskModelCopyWith<$Res> implements $NewTaskModelCopyWith<$Res> {
  factory _$NewTaskModelCopyWith(_NewTaskModel value, $Res Function(_NewTaskModel) _then) = __$NewTaskModelCopyWithImpl;
@override @useResult
$Res call({
 String task, String assignee, DateTime dueDate
});




}
/// @nodoc
class __$NewTaskModelCopyWithImpl<$Res>
    implements _$NewTaskModelCopyWith<$Res> {
  __$NewTaskModelCopyWithImpl(this._self, this._then);

  final _NewTaskModel _self;
  final $Res Function(_NewTaskModel) _then;

/// Create a copy of NewTaskModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? task = null,Object? assignee = null,Object? dueDate = null,}) {
  return _then(_NewTaskModel(
task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as String,assignee: null == assignee ? _self.assignee : assignee // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
