import '../entities/note_entity.dart';

/// Repository contract for notes operations.
abstract class NotesRepository {
  /// Adds a new note.
  Future<void> addNote(NoteEntity note);
  
  /// Retrieves all notes.
  Future<List<NoteEntity>> getNotes();
  
  /// Searches notes by query string.
  /// 
  /// Searches both title and description fields.
  Future<List<NoteEntity>> searchNotes(String query);
}
