import 'package:get_it/get_it.dart';
import 'package:notes_app/features/notes/data/datasources/notes_local_datasource.dart';
import 'package:notes_app/features/notes/data/repositories/notes_repository_impl.dart';
import 'package:notes_app/features/notes/domain/usecases/add_note_usecase.dart';
import 'package:notes_app/features/notes/domain/usecases/get_notes_usecase.dart';
import 'package:notes_app/features/notes/domain/usecases/search_notes_usecase.dart';
import 'package:notes_app/features/notes/presentation/provider/notes_provider.dart';

/// Initializes dependency injection.
Future<void> init() async {
  final sl = GetIt.instance;
  
  // Data sources
  sl.registerLazySingleton(() => NotesLocalDataSource());
  
  // Repositories
  sl.registerLazySingleton(() => NotesRepositoryImpl(sl()));
  
  // Use cases
  sl.registerLazySingleton(() => AddNoteUseCase(sl()));
  sl.registerLazySingleton(() => GetNotesUseCase(sl()));
  sl.registerLazySingleton(() => SearchNotesUseCase(sl()));

  // Providers
  sl.registerFactory(() => NotesProvider(sl(), sl(), sl()));
}


