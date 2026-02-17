import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note_model.dart';

/// Local data source for notes operations using SharedPreferences.
class NotesLocalDataSource {
  static const String _notesKey = 'notes_list';
  final SharedPreferences sharedPreferences;

  NotesLocalDataSource(this.sharedPreferences);

  /// Adds a note and persists to SharedPreferences.
  Future<void> addNote(NoteModel note) async {
    final notes = await getNotes();
    notes.add(note);
    await _saveNotes(notes);
  }

  /// Retrieves all notes from SharedPreferences.
  Future<List<NoteModel>> getNotes() async {
    final jsonString = sharedPreferences.getString(_notesKey);
    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => NoteModel.fromJson(json)).toList();
  }

  /// Searches notes by query string.
  /// 
  /// Returns notes where title or description contains the query (case-insensitive).
  Future<List<NoteModel>> searchNotes(String query) async {
    final notes = await getNotes();
    final lowerQuery = query.toLowerCase();
    return notes.where((note) {
      return note.title.toLowerCase().contains(lowerQuery) ||
          note.description.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  /// Saves notes list to SharedPreferences.
  Future<void> _saveNotes(List<NoteModel> notes) async {
    final jsonList = notes.map((note) => note.toJson()).toList();
    final jsonString = json.encode(jsonList);
    await sharedPreferences.setString(_notesKey, jsonString);
  }
}
