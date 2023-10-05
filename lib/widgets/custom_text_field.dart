import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, this.lines = 1, this.onSaved, this.onChanged, this.initialValue});
  final String hint;
  final int lines;
  final void Function(String?)? onSaved ;
  final void Function(String)? onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 12),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        validator: (value){
          if(value?.isEmpty ?? true){
            return "field is required";
          }else{
            return null ;
          }
        },
        onSaved: onSaved,
        maxLines: lines,
        decoration: InputDecoration(
          hintText: hint,
          border: buildOutlineInputBorder(Colors.blueAccent),
          focusedBorder: buildOutlineInputBorder(Colors.blueAccent),
          enabledBorder: buildOutlineInputBorder(),
        ),
      ),
    );
  }
  OutlineInputBorder buildOutlineInputBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color:color ?? Colors.white)
    );
  }
}
