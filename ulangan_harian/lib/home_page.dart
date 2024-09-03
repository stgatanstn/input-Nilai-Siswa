import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nilaiController1 = TextEditingController();
  final TextEditingController _nilaiController2 = TextEditingController();
  final TextEditingController _nilaiController3 = TextEditingController();
  String _kategori = '';
  double _rataRata = 0.0;

  void _hitungKategori() {
    final String input1 = _nilaiController1.text;
    final String input2 = _nilaiController2.text;
    final String input3 = _nilaiController3.text;

    final int? nilai1 = int.tryParse(input1);
    final int? nilai2 = int.tryParse(input2);
    final int? nilai3 = int.tryParse(input3);

    if (nilai1 == null ||
        nilai1 < 0 ||
        nilai1 > 100 ||
        nilai2 == null ||
        nilai2 < 0 ||
        nilai2 > 100 ||
        nilai3 == null ||
        nilai3 < 0 ||
        nilai3 > 100) {
      _showErrorDialog();
    } else {
      setState(() {
        _rataRata = (nilai1 + nilai2 + nilai3) / 3;

        if (_rataRata >= 85) {
          _kategori = 'A';
        } else if (_rataRata >= 70) {
          _kategori = 'B';
        } else if (_rataRata >= 55) {
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
          content:
              Text('Masukkan nilai antara 0 hingga 100 untuk semua kolom.'),
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
        title: Text('Rata - Rata Nilai Siswa'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: _nilaiController1,
                decoration: InputDecoration(
                  labelText: 'Masukkan Nilai 1 (0-100)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _nilaiController2,
                decoration: InputDecoration(
                  labelText: 'Masukkan Nilai 2 (0-100)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _nilaiController3,
                decoration: InputDecoration(
                  labelText: 'Masukkan Nilai 3 (0-100)',
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
                'Rata-rata: ${_rataRata.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'Kategori: $_kategori',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
