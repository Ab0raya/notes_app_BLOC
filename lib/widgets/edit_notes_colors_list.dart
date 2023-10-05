import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/note_model.dart';
import 'note_colors_list.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});

  final NoteModel note;
  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {

  late int currentIndex ;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: SizedBox(
        height: 70,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: kColors.length,
            itemBuilder: (context,index){
              return GestureDetector(
                  onTap: (){
                    currentIndex = index ;
                    widget.note.color = kColors[index].value;
                    setState(() {});
                  },
                  child: ColorCircle(isActive:currentIndex == index, color: kColors[index] ,));
            }
        ),
      ),
    );
  }
}

