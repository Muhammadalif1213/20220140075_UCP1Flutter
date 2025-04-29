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
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}