import 'package:flutter/material.dart';

class DetailPiketPage extends StatefulWidget {
  final String email;
  final String tanggal;
  final String tugas;

  const DetailPiketPage({
    super.key,
    required this.email,
    required this.tanggal,
    required this.tugas,
  });

  @override
  State<DetailPiketPage> createState() => _DetailPiketPageState();
}

class _DetailPiketPageState extends State<DetailPiketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blueAccent,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 25, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Detail ${widget.tugas}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
