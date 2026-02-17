import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

import '../../features/notes/presentation/screens/notes_list_screen.dart';
import '../../features/notes/presentation/screens/add_note_screen.dart';
import '../../features/notes/presentation/provider/notes_provider.dart';
import 'router_names.dart';

final sl = GetIt.instance;

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: RouterNames.notes,
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => sl<NotesProvider>()..loadNotes(),
          child: const NotesListScreen(),
        );
      },
    ),
    GoRoute(
      path: RouterNames.addNote,
      builder: (context, state) => const AddNoteScreen(),
    ),
  ],
);
