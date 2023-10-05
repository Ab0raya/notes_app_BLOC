import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import '../constants.dart';


class ColorsCirclesList extends StatefulWidget {
  const ColorsCirclesList({super.key});

  @override
  State<ColorsCirclesList> createState() => _ColorsCirclesListState();
}

class _ColorsCirclesListState extends State<ColorsCirclesList> {

  int currentIndex = 0 ;
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
                      BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
                  },
                  child: ColorCircle(isActive:currentIndex == index, color: kColors[index] ,));
            }
        ),
      ),
    );
  }
}


class ColorCircle extends StatelessWidget {
  const ColorCircle({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: isActive?  CircleAvatar(
        radius: 35,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 30,
          backgroundColor: color,
        ),
      ): CircleAvatar(
        radius: 35,
        backgroundColor: color,
      ),
    );
  }
}


