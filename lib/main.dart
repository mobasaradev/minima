import 'package:counter_app/Note_app.dart';
import 'package:counter_app/modules/home/cubit/note/note_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider<NoteCubit>(
      create: (context) => NoteCubit(),
      child: const NoteApp(),
    ),
  );
}
