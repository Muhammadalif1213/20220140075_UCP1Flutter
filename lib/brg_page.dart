import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  final List<String> jenisTransaksi = ['Barang Masuk', 'Barang Keluar'];

  final List<Map<String, dynamic>> jenisBarang = [
    {'Barang': 'Carrier', 'HargaSatuan': 40000},
    {'Barang': 'Sleeping Bag', 'HargaSatuan': 10000},
    {'Barang': 'Tenda', 'HargaSatuan': 70000},
    {'Barang': 'Sepatu', 'HargaSatuan': 35000},
  ];
  String? transaksiValue;
  String? barangValue;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}