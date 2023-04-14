import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../widget/button.dart';
import '../widget/custrom_textfield.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

TextEditingController note = TextEditingController();
final ref = FirebaseDatabase.instance.ref('post');

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Custromtextfield(
              label: 'Add note',
              icon: Icons.phone,
              hintText: 'Add comment',
              suffixIcon: false,
              obscureText: false,
              validation: 'Please enter comment',
              controller: note,
            ),
            Button(
              buttonName: 'Add',
              onpress: () {
                // ref.child('1').set({'title': note.text.toString()});
                ref
                    .child('1')
                    .child('title')
                    .set({'name': note.text.toString()});
                // ref.child(DateTime.now().millisecond.toString()).set({'title': note.text.toString()});
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  return ListTile(
                    title: Text(snapshot.child('title').value.toString()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
