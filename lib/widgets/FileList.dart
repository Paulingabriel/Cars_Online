import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileList extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;
  const FileList({super.key, required this.files, required this.onOpenedFile});

  @override
  State<FileList> createState() => _FileListState();
}

class _FileListState extends State<FileList> {
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
