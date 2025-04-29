import 'package:flutter/material.dart';

class DetailPiketPage extends StatefulWidget {
  final String email;
  final String tanggal;
  final String tugas;

  const DetailPiketPage({
    super.key,
    required this.email,
    required this.tanggal,
    required this.tugas});

  @override
  State<DetailPiketPage> createState() => _DetailPiketPageState();
}

class _DetailPiketPageState extends State<DetailPiketPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}