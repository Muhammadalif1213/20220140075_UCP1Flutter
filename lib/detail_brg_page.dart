import 'package:flutter/material.dart';

class DetailBrgPage extends StatelessWidget {
  final String email;
  final String jumlahBarang;
  final String tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final String hargaSatuan;
  final int totalHarga;

  const DetailBrgPage({
    super.key,
    required this.jumlahBarang,
    required this.tanggal,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.hargaSatuan,
    required this.totalHarga,
    required this.email,
  });
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}