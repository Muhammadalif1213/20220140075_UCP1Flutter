import 'package:flutter/material.dart';

class PiketPage extends StatefulWidget {
  final String email;
  const PiketPage({super.key, required this.email});

  @override
  State<PiketPage> createState() => _PiketPageState();
}

class _PiketPageState extends State<PiketPage> {
  late TextEditingController namaController = TextEditingController(
    text: widget.email,
  );
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController tugasController = TextEditingController();
  final piketKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}