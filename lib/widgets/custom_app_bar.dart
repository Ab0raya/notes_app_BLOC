import 'package:flutter/material.dart';

import 'add_note_bottom_sheet.dart';
import 'custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Notes',
            style: TextStyle(
              fontSize: 38,
            ),
          ),
          Row(
            children: [
              CustomIcon(
                icon: Icons.add,
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    context: context,
                    builder: (context) {
                      return const AddNoteBottomSheet();
                    },
                  );
                },
              ),
              CustomIcon(
                icon: Icons.search_outlined,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}


