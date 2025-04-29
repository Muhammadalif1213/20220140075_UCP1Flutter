import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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


  DateTime? _selectedDateTime;

  void pickDateTime() async {
    DateTime now = DateTime.now();

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDateTime = pickedDate;
        tanggalController.text = DateFormat(
          'EEEE, d MMMM y',
        ).format(_selectedDateTime!);
      });
    }
  }

  final List<Map<String, dynamic>> _tasks = [];
  void addTask() {
    if (piketKey.currentState!.validate()) {
      setState(() {
        _tasks.add({
          'tugas': tugasController.text,
          'tanggal': tanggalController.text,
          'email': widget.email,
        });
        tanggalController.clear();
        tugasController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}