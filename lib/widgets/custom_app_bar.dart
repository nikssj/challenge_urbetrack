import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String titulo;
  final automaticallyImplyLeading;

  CustomAppBar({
    required this.titulo,
    this.automaticallyImplyLeading,
  }) : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        shadowColor: Colors.white,
        automaticallyImplyLeading: widget.automaticallyImplyLeading ?? true,
        title: Text(
          widget.titulo.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
  }
}
