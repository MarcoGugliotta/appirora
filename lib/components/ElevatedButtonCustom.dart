import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;

  const ElevatedButtonCustom(
      {super.key, required this.title, required this.onPressed});

  @override
  _ElevatedButtonCustomState createState() => _ElevatedButtonCustomState();
}

class _ElevatedButtonCustomState extends State<ElevatedButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 1))),
          elevation: MaterialStateProperty.resolveWith((states) => 15),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              return Theme.of(context)
                  .colorScheme
                  .secondary; // Use the component's default.
            },
          ),
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.title,
          style: TextStyle(
              fontFamily: 'TiltNeon',
              fontSize: 25,
              color: Theme.of(context).colorScheme.primary),
        ));
  }
}
