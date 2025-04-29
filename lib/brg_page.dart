import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp_1/detail_brg_page.dart';

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

  final String? prefixText = 'Rp. ';
  String? transaksiValue;
  String? barangValue;
  final List<Map<String, dynamic>> jenisBarang = [
    {'Barang': 'Carrier', 'HargaSatuan': 40000},
    {'Barang': 'Sleeping Bag', 'HargaSatuan': 10000},
    {'Barang': 'Tenda', 'HargaSatuan': 70000},
    {'Barang': 'Sepatu', 'HargaSatuan': 35000},
  ];
  final List<String> jenisTransaksi = ['Barang Masuk', 'Barang Keluar'];

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

  void calculateTotalPrice() {
    int jumlahBarang = int.parse(jumlahBarangController.text);
    int hargaSatuan = int.parse(hargaSatuanController.text);

    setState(() {
      totalHarga = jumlahBarang * hargaSatuan;
    });
  }

  final valKey = GlobalKey<FormState>();

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
                      'Pendataan Barang',
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
          child: Form(
            key: valKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tanggal Transaksi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      onTap: pickDateTime,
                      controller: tanggalController,
                      readOnly: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tanggal harus dipilih';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Tanggal Transaksi',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                DropdownButtonFormField<String>(
                  value: transaksiValue,
                  decoration: InputDecoration(
                    label: Text('Jenis Transaksi'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pilih jenis transaksi';
                    }
                    return null;
                  },
                  onChanged: (String? newValue) {
                    setState(() {
                      transaksiValue = newValue;
                    });
                  },
                  items:
                      jenisTransaksi.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
                SizedBox(height: 30),
                DropdownButtonFormField<String>(
                  value: barangValue,
                  decoration: InputDecoration(
                    label: Text('Jenis Barang'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pilih jenis barang';
                    }
                    return null;
                  },
                  onChanged: (String? newValue) {
                    setState(() {
                      barangValue = newValue;
                      final selectedBarang = jenisBarang.firstWhere(
                        (element) => element['Barang'] == barangValue,
                        orElse: () => {'Barang': '', 'HargaSatuan': 0},
                      );
                      hargaSatuanController.text =
                          selectedBarang['HargaSatuan'].toString();
                    });
                  },
                  items:
                      jenisBarang.map((value) {
                        return DropdownMenuItem<String>(
                          value: value['Barang'],
                          child: Text(value['Barang']),
                        );
                      }).toList(),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jumlah Barang',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: jumlahBarangController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Jumlah barang tidak boleh kosong';
                              }
                              if (int.tryParse(value) == null ||
                                  int.parse(value) <= 0) {
                                return 'Masukkan angka yang valid (> 0)';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Jumlah Barang',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Harga Satuan',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: hargaSatuanController,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: 'Harga Satuan',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              prefixText: prefixText,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Harga satuan tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (valKey.currentState!.validate()) {
                      calculateTotalPrice();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetailBrgPage(
                                email: widget.email,
                                jumlahBarang: jumlahBarangController.text,
                                tanggal: tanggalController.text,
                                jenisTransaksi: transaksiValue.toString(),
                                jenisBarang: barangValue.toString(),
                                hargaSatuan: hargaSatuanController.text,
                                totalHarga: totalHarga,
                              ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
