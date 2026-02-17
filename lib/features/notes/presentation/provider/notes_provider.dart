import 'package:flutter/material.dart';
import '../../domain/entities/note_entity.dart';
import '../../domain/usecases/add_note_usecase.dart';
import '../../domain/usecases/get_notes_usecase.dart';
import '../../domain/usecases/search_notes_usecase.dart';
import 'package:uuid/uuid.dart';

/// Provider for managing notes state.
class NotesProvider extends ChangeNotifier {
  final AddNoteUseCase addNoteUseCase;
  final GetNotesUseCase getNotesUseCase;
  final SearchNotesUseCase searchNotesUseCase;

  NotesProvider(
    this.addNoteUseCase,
    this.getNotesUseCase,
    this.searchNotesUseCase,
  );

  List<NoteEntity> notes = [];
  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  /// Loads all notes.
  Future<void> loadNotes() async {
    notes = await getNotesUseCase();
    notifyListeners();
  }

  /// Adds a new note.
  Future<void> addNote(String title, String description) async {
    final note = NoteEntity(
      id: const Uuid().v4(),
      title: title,
      description: description,
    );

    await addNoteUseCase(note);
    await loadNotes();
  }

  /// Searches notes by query.
  Future<void> searchNotes(String query) async {
    _searchQuery = query;
    notes = await searchNotesUseCase(query);
    notifyListeners();
  }

  /// Clears the search and loads all notes.
  Future<void> clearSearch() async {
    _searchQuery = '';
    await loadNotes();
  }
}
