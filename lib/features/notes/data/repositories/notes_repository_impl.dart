import '../../domain/entities/note_entity.dart';
import '../../domain/repositories/notes_repository.dart';
import '../datasources/notes_local_datasource.dart';
import '../models/note_model.dart';

/// Implementation of NotesRepository.
class NotesRepositoryImpl implements NotesRepository {
  final NotesLocalDataSource localDataSource;

  NotesRepositoryImpl(this.localDataSource);

  @override
  Future<void> addNote(NoteEntity note) async {
    final model = NoteModel(
      id: note.id,
      title: note.title,
      description: note.description,
    );
    await localDataSource.addNote(model);
  }

  @override
  Future<List<NoteEntity>> getNotes() {
    return localDataSource.getNotes();
  }

  @override
  Future<List<NoteEntity>> searchNotes(String query) {
    return localDataSource.searchNotes(query);
  }
}
