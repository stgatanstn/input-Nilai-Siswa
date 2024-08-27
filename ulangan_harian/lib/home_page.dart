import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nilaiController = TextEditingController();
  String _kategori = '';

  void _hitungKategori() {
    final String input = _nilaiController.text;
    final int? nilai = int.tryParse(input);

    if (nilai == null || nilai < 0 || nilai > 100) {
      _showErrorDialog();
    } else {
      setState(() {
        if (nilai >= 85) {
          _kategori = 'A';
        } else if (nilai >= 70) {
          _kategori = 'B';
        } else if (nilai >= 55) {
          _kategori = 'C';
        } else {
          _kategori = 'D';
        }
      });
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Input Tidak Valid'),
          content: Text('Masukkan nilai antara 0 hingga 100.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Penilaian Siswa'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nilaiController,
                decoration: InputDecoration(
                  labelText: 'Masukkan Nilai Siswa (0-100)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _hitungKategori,
                child: Text('Hitung'),
              ),
              SizedBox(height: 20),
              Text(
                _kategori.isEmpty ? '' : 'Kategori: $_kategori',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
