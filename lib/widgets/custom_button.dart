import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, this.isLoading = false});
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration:  BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child:  Center(
            child: isLoading?const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                color: Colors.black,

              ),
            ):const Text(
              'Add',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.black
              ),
            ),
          ),
        ),
      ),
    );
  }
}

