import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_model.freezed.dart';

@freezed
class PhotoModel with _$PhotoModel {
  factory PhotoModel({
    required int id,
    required String tags,
    @JsonKey(name: 'previewURL') required String previewURL,
  }) = _PhotoModel;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => _$PhotoModelFromJson(json);
}

// part 'photo_model.g.dart';

// @JsonSerializable()
// class PhotoModel extends Equatable {
//   final int id;
//   final String tags;
//   @JsonKey(name: 'previewURL')
//   final String previewUrl;
//
//   const PhotoModel({
//     required this.id,
//     required this.tags,
//     required this.previewUrl,
//   });
//
//   factory PhotoModel.fromJson(Map<String, dynamic> json) => _$PhotoModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
//
//   @override
//   List<Object?> get props => [id];
// }
