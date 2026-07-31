import 'package:go_router/go_router.dart';
import 'package:navigation_flutter/noteapp/noteappscreens/details_screen.dart';
import 'package:navigation_flutter/noteapp/noteappscreens/note_list.dart';
import 'package:navigation_flutter/noteapp/noteappscreens/notes_edit_screen.dart';
import 'package:navigation_flutter/noteapp/noteappscreens/notesnavibar.dart';
import 'package:navigation_flutter/noteapp/noteappscreens/setting_screen.dart';

final GoRouter notesAppRouters = GoRouter(
  initialLocation: '/noteslist',
  routes: [
    GoRoute(
      path: '/detailedScreen',
      name: 'detailedScreen',
      builder: (context, state) {
        final notesText = state.extra as String;
        return DetailsScreen(notesText: notesText);
      },
    ),
    GoRoute(
      path: '/editingScreen',
      name: 'editingScreen',
      builder: (context, state) {
        final notesText = state.extra as String;
        return NotesEditScreen(notesText: notesText);
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NotesNaviBar(naviShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(path: '/noteslist', name: 'notesList', builder: (context, state) => NoteList()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: '/settings', builder: (context, state) => SettingScreen()),
        ]),
      ],
    ),
  ],
);