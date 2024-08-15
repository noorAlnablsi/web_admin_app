import 'dart:convert';

class Image {
  int? id;
  String? modelType;
  int? modelId;
  String? url;
  DateTime? createdAt;
  DateTime? updatedAt;

  Image({
    this.id,
    this.modelType,
    this.modelId,
    this.url,
    this.createdAt,
    this.updatedAt,
  });

  factory Image.fromMap(Map<String, dynamic> data) => Image(
        id: data['id'] as int?,
        modelType: data['model_type'] as String?,
        modelId: data['model_id'] as int?,
        url: data['url'] as String?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'model_type': modelType,
        'model_id': modelId,
        'url': url,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Image].
  factory Image.fromJson(String data) {
    return Image.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Image] to a JSON string.
  String toJson() => json.encode(toMap());
}
