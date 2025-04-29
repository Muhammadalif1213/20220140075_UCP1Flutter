import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp_1/detail_piket_page.dart';

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
  final List<Map<String, dynamic>> _tasks = [];

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
                      'Piket Gudang',
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                key: piketKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama Anggota',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: namaController,
                          decoration: const InputDecoration(
                            hintText: 'Masukan Nama',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pilih Tanggal',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: tanggalController,
                          onTap: () {
                            pickDateTime();
                          },
                          decoration: InputDecoration(
                            hintText: 'Pilih Tanggal',
                            border: OutlineInputBorder(),
                            prefixIcon: Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: Icon(Icons.calendar_today_outlined),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tanggal tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tugas Piket'),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: tugasController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 15,
                                  ),
                                  hintText: 'Tugas Piket',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                validator:
                                    (value) =>
                                        (value == null || value.isEmpty)
                                            ? 'Tugas tidak boleh kosong'
                                            : null,
                              ),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: Colors.blueAccent,
                                minimumSize: Size(180, 50),
                              ),
                              onPressed: addTask,
                              child: Text(
                                'Tambah',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Daftar Tugas Piket',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    final task = _tasks[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => DetailPiketPage(
                                  email: task['email'],
                                  tanggal: task['tanggal'],
                                  tugas: task['tugas'],
                                ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              task['tugas'],
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
