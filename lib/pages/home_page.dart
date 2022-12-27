import 'package:counter_app/controller/note_controller.dart';
import 'package:counter_app/pages/pages.dart';
import 'package:counter_app/utils/utils.dart';
import 'package:counter_app/widgets/note_card.dart';
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
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: NoteColor.secondaryTextColor,
          ),
          centerTitle: true,
          title: const Text(
            "My Notes",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: NoteColor.primaryTextColor,
            ),
          ),
          backgroundColor: NoteColor.transparentColor,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_circle),
            ),
          ],
        ),
        body: SizedBox(
          child: (noteProvider.notes.isNotEmpty)
              ? const NoteCard()
              : const Center(
                  child: Text("Create your new notes"),
                ),
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
          backgroundColor: NoteColor.primaryColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
