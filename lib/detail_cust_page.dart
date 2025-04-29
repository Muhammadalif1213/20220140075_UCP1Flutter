import 'package:flutter/material.dart';

class DetailCustPage extends StatefulWidget {
  final String emailUsr;
  final String email;
  final String nama;
  final String noHp;
  final String alamat;
  final String provinsi;
  final String kodePos;
  const DetailCustPage({
    super.key,
    required this.emailUsr,
    required this.email,
    required this.nama,
    required this.noHp,
    required this.alamat,
    required this.provinsi,
    required this.kodePos,
  });

  @override
  State<DetailCustPage> createState() => _DetailCustPageState();
}

class _DetailCustPageState extends State<DetailCustPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}