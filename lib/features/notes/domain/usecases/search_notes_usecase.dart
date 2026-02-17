import '../entities/note_entity.dart';
import '../repositories/notes_repository.dart';

/// Use case for searching notes.
/// 
/// Searches notes by query string in both title and description.
class SearchNotesUseCase {
  final NotesRepository repository;

  SearchNotesUseCase(this.repository);

  /// Executes the search with the given query.
  /// 
  /// Returns a list of notes matching the search query.
  Future<List<NoteEntity>> call(String query) async {
    if (query.trim().isEmpty) {
      return repository.getNotes();
    }
    return repository.searchNotes(query);
  }
}
