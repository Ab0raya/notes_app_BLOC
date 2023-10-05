import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_icon.dart';

class EditNoteAppBar extends StatelessWidget {
  const EditNoteAppBar({super.key, required this.onTap});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Row(
            children: [
              IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios,size: 35,)),
              const Text(
                'Edit Note',
                style: TextStyle(
                  fontSize: 38,
                ),
              ),
            ],
          ),
          Row(
            children: [
              CustomIcon(
                icon: Icons.check,
                onTap:onTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
