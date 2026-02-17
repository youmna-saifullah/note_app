import '../models/note_model.dart';

/// Local data source for notes operations.
class NotesLocalDataSource {
  final List<NoteModel> _notes = [];

  Future<void> addNote(NoteModel note) async {
    _notes.add(note);
  }

  Future<List<NoteModel>> getNotes() async {
    return _notes;
  }

  /// Searches notes by query string.
  /// 
  /// Returns notes where title or description contains the query (case-insensitive).
  Future<List<NoteModel>> searchNotes(String query) async {
    final lowerQuery = query.toLowerCase();
    return _notes.where((note) {
      return note.title.toLowerCase().contains(lowerQuery) ||
          note.description.toLowerCase().contains(lowerQuery);
    }).toList();
  }
}
