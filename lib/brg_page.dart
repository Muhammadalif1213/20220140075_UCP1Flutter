import 'package:flutter/material.dart';

class BrgPage extends StatefulWidget {
  final String email;
  const BrgPage({super.key, required this.email});

  @override
  State<BrgPage> createState() => _BrgPageState();
}

class _BrgPageState extends State<BrgPage> {
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController jumlahBarangController = TextEditingController();
  final TextEditingController hargaSatuanController = TextEditingController();
  int totalHarga = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}