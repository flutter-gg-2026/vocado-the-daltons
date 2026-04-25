// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_viewer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskViewerModel {

 String get id; String get title;@JsonKey(name: 'assignee_id') String get assigneeId;@JsonKey(name: 'due_date') String get dueDate; String get status;@JsonKey(name: 'created_by') String get createdBy;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of TaskViewerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskViewerModelCopyWith<TaskViewerModel> get copyWith => _$TaskViewerModelCopyWithImpl<TaskViewerModel>(this as TaskViewerModel, _$identity);

  /// Serializes this TaskViewerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskViewerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.assigneeId, assigneeId) || other.assigneeId == assigneeId)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,assigneeId,dueDate,status,createdBy,createdAt);

@override
String toString() {
  return 'TaskViewerModel(id: $id, title: $title, assigneeId: $assigneeId, dueDate: $dueDate, status: $status, createdBy: $createdBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TaskViewerModelCopyWith<$Res>  {
  factory $TaskViewerModelCopyWith(TaskViewerModel value, $Res Function(TaskViewerModel) _then) = _$TaskViewerModelCopyWithImpl;
@useResult
$Res call({
 String id, String title,@JsonKey(name: 'assignee_id') String assigneeId,@JsonKey(name: 'due_date') String dueDate, String status,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$TaskViewerModelCopyWithImpl<$Res>
    implements $TaskViewerModelCopyWith<$Res> {
  _$TaskViewerModelCopyWithImpl(this._self, this._then);

  final TaskViewerModel _self;
  final $Res Function(TaskViewerModel) _then;

/// Create a copy of TaskViewerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? assigneeId = null,Object? dueDate = null,Object? status = null,Object? createdBy = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,assigneeId: null == assigneeId ? _self.assigneeId : assigneeId // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskViewerModel].
extension TaskViewerModelPatterns on TaskViewerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskViewerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskViewerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskViewerModel value)  $default,){
final _that = this;
switch (_that) {
case _TaskViewerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskViewerModel value)?  $default,){
final _that = this;
switch (_that) {
case _TaskViewerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'assignee_id')  String assigneeId, @JsonKey(name: 'due_date')  String dueDate,  String status, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskViewerModel() when $default != null:
return $default(_that.id,_that.title,_that.assigneeId,_that.dueDate,_that.status,_that.createdBy,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'assignee_id')  String assigneeId, @JsonKey(name: 'due_date')  String dueDate,  String status, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _TaskViewerModel():
return $default(_that.id,_that.title,_that.assigneeId,_that.dueDate,_that.status,_that.createdBy,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @JsonKey(name: 'assignee_id')  String assigneeId, @JsonKey(name: 'due_date')  String dueDate,  String status, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TaskViewerModel() when $default != null:
return $default(_that.id,_that.title,_that.assigneeId,_that.dueDate,_that.status,_that.createdBy,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskViewerModel implements TaskViewerModel {
  const _TaskViewerModel({required this.id, required this.title, @JsonKey(name: 'assignee_id') required this.assigneeId, @JsonKey(name: 'due_date') required this.dueDate, required this.status, @JsonKey(name: 'created_by') required this.createdBy, @JsonKey(name: 'created_at') required this.createdAt});
  factory _TaskViewerModel.fromJson(Map<String, dynamic> json) => _$TaskViewerModelFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey(name: 'assignee_id') final  String assigneeId;
@override@JsonKey(name: 'due_date') final  String dueDate;
@override final  String status;
@override@JsonKey(name: 'created_by') final  String createdBy;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of TaskViewerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskViewerModelCopyWith<_TaskViewerModel> get copyWith => __$TaskViewerModelCopyWithImpl<_TaskViewerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskViewerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskViewerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.assigneeId, assigneeId) || other.assigneeId == assigneeId)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,assigneeId,dueDate,status,createdBy,createdAt);

@override
String toString() {
  return 'TaskViewerModel(id: $id, title: $title, assigneeId: $assigneeId, dueDate: $dueDate, status: $status, createdBy: $createdBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TaskViewerModelCopyWith<$Res> implements $TaskViewerModelCopyWith<$Res> {
  factory _$TaskViewerModelCopyWith(_TaskViewerModel value, $Res Function(_TaskViewerModel) _then) = __$TaskViewerModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@JsonKey(name: 'assignee_id') String assigneeId,@JsonKey(name: 'due_date') String dueDate, String status,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$TaskViewerModelCopyWithImpl<$Res>
    implements _$TaskViewerModelCopyWith<$Res> {
  __$TaskViewerModelCopyWithImpl(this._self, this._then);

  final _TaskViewerModel _self;
  final $Res Function(_TaskViewerModel) _then;

/// Create a copy of TaskViewerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? assigneeId = null,Object? dueDate = null,Object? status = null,Object? createdBy = null,Object? createdAt = null,}) {
  return _then(_TaskViewerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,assigneeId: null == assigneeId ? _self.assigneeId : assigneeId // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
