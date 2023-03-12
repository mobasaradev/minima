import 'package:counter_app/models/note.dart';
import 'package:counter_app/modules/home/cubit/note/note_cubit.dart';
import 'package:counter_app/modules/home/views/views.dart';
import 'package:counter_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyNotePage extends StatelessWidget {
  MyNotePage({super.key});
  final Map<String, Widget> _viewMap = {
    'Recent Notes': const RecentNotes(),
    'All Notes': const AllNotes(),
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _viewMap.length,
      child: Scaffold(
        body: BlocSelector<NoteCubit, NoteState, List<Note>>(
          selector: (state) => state.notes,
          builder: (context, notes) {
            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  title: const Text("My Notes"),
                  centerTitle: true,
                  pinned: true,
                  floating: true,
                  snap: true,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  scrolledUnderElevation: 2.5,
                  shape: const Border(
                    bottom: BorderSide(
                      color: AppColors.transparent,
                      width: 0,
                    ),
                  ),
                  bottom: notes.isEmpty
                      ? null
                      : TabBar(
                          tabs: [
                            for (final e in _viewMap.entries)
                              Tab(
                                child: Text(e.key),
                              ),
                          ],
                        ),
                ),
              ],
              body: notes.isEmpty
                  ? const Center(
                      child: FlutterLogo(size: 75),
                    )
                  : TabBarView(
                      children: [for (final e in _viewMap.entries) e.value],
                    ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text("New"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewNote(),
              ),
            );
          },
          icon: const Icon(
            Icons.edit_calendar_outlined,
          ),
        ),
      ),
    );
  }
}
