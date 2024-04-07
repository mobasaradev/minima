import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minima/models/note.dart';
import 'package:minima/modules/home/cubit/note/note_cubit.dart';
import 'package:minima/modules/home/views/views.dart';
import 'package:minima/utils/utils.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
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
                  title: const Text("Minima Note"),
                  centerTitle: true,
                  pinned: true,
                  floating: true,
                  snap: true,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  scrolledUnderElevation: 0,
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
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Opacity(
                          opacity: 0.8,
                          child: Image.asset(
                            "assets/images/add_notes.png",
                            height: 300,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Add your new plan",
                          style: AppThemes.lightTheme.textTheme.titleMedium
                              ?.copyWith(
                            fontSize: 32,
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    )
                  : Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/add_notes.png",
                          ),
                          opacity: .1,
                        ),
                      ),
                      child: TabBarView(
                        children: [for (final e in _viewMap.entries) e.value],
                      ),
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
