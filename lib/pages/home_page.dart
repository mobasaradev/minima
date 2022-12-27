import 'package:counter_app/controller/note_controller.dart';
import 'package:counter_app/pages/pages.dart';
import 'package:counter_app/utils/utils.dart';
import 'package:counter_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    NoteProvider noteProvider = Provider.of<NoteProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: NoteColor.backGroundColor,
        // custom app bar
        appBar: const NoteAppBar(),
        //body
        body: Column(
          children: [
            const CustomTopBar(),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: (noteProvider.notes.isNotEmpty)
                  ? const NoteCard()
                  : const EmptyBackGroundImage(),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (context) => const AddNewNote(
                  isUpdate: false,
                ),
              ),
            );
          },
          backgroundColor: NoteColor.purpleColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}




// body: SizedBox(
//           child: (noteProvider.notes.isNotEmpty)
//               ? const NoteCard()
//               : const EmptyBackGroundImage(),
//         ),