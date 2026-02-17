import '../../domain/entities/note_entity.dart';

/// Data model for Note with JSON serialization.
class NoteModel extends NoteEntity {
  NoteModel({
    required super.id,
    required super.title,
    required super.description,
  });

  /// Creates a NoteModel from JSON.
  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }

  /// Converts NoteModel to JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
