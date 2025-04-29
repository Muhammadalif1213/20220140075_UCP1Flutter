import 'package:flutter/material.dart';

class CustPage extends StatefulWidget {
  final String emailUsr;
  const CustPage({super.key,
  required this.emailUsr,
  });

  @override
  State<CustPage> createState() => _CustPageState();
}

class _CustPageState extends State<CustPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kodaPosController = TextEditingController();
  final custKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}