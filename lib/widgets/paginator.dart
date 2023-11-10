import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class Paginator extends StatefulWidget {
  int pages;
  Paginator({super.key, required this.pages});

  @override
  State<Paginator> createState() => _PaginatorState();
}

class _PaginatorState extends State<Paginator> {
  @override
  Widget build(BuildContext context) {
    return NumberPaginator(
      // by default, the paginator shows numbers as center content
      numberPages: widget.pages,
      onPageChange: (int index) {
        setState(() {
          // _currentPage =
          // index; // _currentPage is a variable within State of StatefulWidget
        });
      },
      // initially selected index
      initialPage: 1,
      config: NumberPaginatorUIConfig(
        // default height is 48
        // height: 64,
        buttonShape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        buttonSelectedForegroundColor: Colors.white,
        buttonUnselectedForegroundColor: Color(0xFF025CCB),
        buttonUnselectedBackgroundColor: Colors.white,
        buttonSelectedBackgroundColor: Color(0xFF025CCB),
      ),
    );
  }
}
