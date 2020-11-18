
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'hasil.dart';
import 'package:intl/intl.dart';

class MainMenu extends StatefulWidget {
  final VoidCallback logout;
  MainMenu(this.logout);
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
 final formKey = GlobalKey<FormState>(); 
  int tinggi = 0;
  int berat = 0;
  int tanggal;
  int bulan;
  int tahun;
  String nama;
  String _valGender;
  List _listGender = ["Perempuan", "Laki-Laki"];
  int year = 0;
  
  getDateToday() {
    var now = new DateTime.now();
    var format = new DateFormat('yyyy');
    String dateFormat = format.format(now);
    var parse = int.parse(dateFormat);
    setState(() {
      year = parse;
    });
  }

  logout(){
    setState(() {
      widget.logout();
    });
  }

  
  @override
  Widget build(BuildContext context) {

    String validateName(String value) {
    if (value.isEmpty) { //JIKA VALUE KOSONG 
      return 'Nama Lengkap Harus Diisi'; //MAKA PESAN DITAMPILKAN
    }
    return null;
  }

    getDateToday();
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: Icon(
          Icons.android,
          color: Colors.white,
        ),
        title: Text('Data Checker'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.lock_open,
              color: Colors.white,
            ),
            onPressed: () {
              logout();
            },
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),


      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            Container(
              child: Image.asset(
                'images/main.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(10),
                // color: Colors.blue[700],
                child: Column(
                  children: <Widget>[
                    
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: new Theme(
                            data: new ThemeData(
                                primaryColor: Colors.blue,
                                primaryColorDark: Colors.blue),

                            child: new TextFormField(
                              onChanged: (txt) {
                                setState(() {
                                  nama = txt;
                                });
                              },
                              keyboardType: TextInputType.text,
                              maxLength: 100,
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(20.0),
                                      borderSide:
                                          new BorderSide(color: Colors.blue)),
                                  hintText: 'Masukkan Nama',
                                  labelText: 'Nama',
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.blue,
                                  ),
                                  prefixText: ' ',
                                  suffixStyle:
                                      const TextStyle(color: Colors.blue)),
                                        validator: validateName, //validateName ADALAH NAMA FUNGSI PADA FILE validation.dart
                                    onSaved: (String value) { //KETIKA LOLOS VALIDASI
                                      nama = value;}
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        Expanded(
                          child: new Theme(
                            data: new ThemeData(
                                primaryColor: Colors.blue,
                                primaryColorDark: Colors.blue),
                            child: new DropdownButtonFormField(
                              items: _listGender.map((value) {
                                return DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _valGender = value;
                                });
                              },
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(20.0),
                                      borderSide:
                                          new BorderSide(color: Colors.blue)),
                                  hintText: 'Masukkan Jenis Kelamin',
                                  helperText: '',
                                  labelText: 'Jenis Kelamin',
                                  prefixIcon: const Icon(
                                    Icons.wc,
                                    color: Colors.blue,
                                  ),
                                  suffixStyle:
                                      const TextStyle(color: Colors.blue)),                            
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        Expanded(
                          child: new Theme(
                            data: new ThemeData(
                                primaryColor: Colors.blue,
                                primaryColorDark: Colors.blue),
                            child: new TextFormField(
                              onChanged: (txt) {
                                setState(() {
                                  tanggal = int.parse(txt);
                                });
                              },
                              keyboardType: TextInputType.number,
                              maxLength: 2,
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.blue)),
                                  hintText: '01 - 31',
                                  labelText: 'Tanggal',
                                  prefixIcon: const Icon(
                                    Icons.date_range,
                                    color: Colors.blue,
                                  ),
                                  suffixStyle:
                                      const TextStyle(color: Colors.blue)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        Expanded(
                          child: new Theme(
                            data: new ThemeData(
                                primaryColor: Colors.blue,
                                primaryColorDark: Colors.blue),
                            child: new TextField(
                              onChanged: (txt) {
                                setState(() {
                                  bulan = int.parse(txt);
                                });
                              },
                              keyboardType: TextInputType.number,
                              maxLength: 2,
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.blue)),
                                  hintText: '01-12',
                                  labelText: 'Bulan',
                                  prefixIcon: const Icon(
                                    Icons.date_range,
                                    color: Colors.blue,
                                  ),
                                  suffixStyle:
                                      const TextStyle(color: Colors.blue)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        Expanded(
                          child: new Theme(
                            data: new ThemeData(
                                primaryColor: Colors.blue,
                                primaryColorDark: Colors.blue),
                            child: new TextFormField(
                              onChanged: (txt) {
                                setState(() {
                                  tahun = int.parse(txt);
                                });
                              },
                              keyboardType: TextInputType.number,
                              maxLength: 4,
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.blue)),
                                  hintText: '',
                                  labelText: 'Tahun',
                                  prefixIcon: const Icon(
                                    Icons.date_range,
                                    color: Colors.blue,
                                  ),
                                  suffixStyle:
                                      const TextStyle(color: Colors.blue)),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        Expanded(
                          child: new Theme(
                            data: new ThemeData(
                                primaryColor: Colors.blue,
                                primaryColorDark: Colors.blue),
                            child: new TextFormField(
                              onChanged: (txt) {
                                setState(() {
                                  tinggi = int.parse(txt);
                                });
                              },
                              keyboardType: TextInputType.number,
                              maxLength: 3,
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(20.0),
                                      borderSide:
                                          new BorderSide(color: Colors.blue)),
                                  hintText: 'Tinggi',
                                  labelText: 'Tinggi',
                                  prefixIcon: const Icon(
                                    Icons.border_color,
                                    color: Colors.blue,
                                  ),
                                  prefixText: ' ',
                                  suffixText: 'Cm',
                                  suffixStyle:
                                      const TextStyle(color: Colors.blue)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        
                        Expanded(
                          child: new Theme(
                            data: new ThemeData(
                                primaryColor: Colors.blue,
                                primaryColorDark: Colors.blue),
                            child: new TextFormField(
                              onChanged: (txt) {
                                setState(() {
                                  berat = int.parse(txt);
                                });
                              },
                              keyboardType: TextInputType.number,
                              maxLength: 3,
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(20.0),
                                      borderSide:
                                          new BorderSide(color: Colors.blue)),
                                  hintText: 'Berat',
                                  labelText: 'Berat',
                                  prefixIcon: const Icon(
                                    Icons.border_color,
                                    color: Colors.blue,
                                  ),
                                  prefixText: ' ',
                                  suffixText: 'Kg',
                                  suffixStyle:
                                      const TextStyle(color: Colors.blue)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
              //height: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: RaisedButton(
                onPressed: () {
                  
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                  
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Hasil(
                                tinggi_badan: tinggi,
                                berat_badan: berat,
                                nama_user: nama,
                                jenis_kelamin: _valGender,
                                tanggal: tanggal,
                                bulan: bulan,
                                tahun: tahun,
                                year_now: year)),
                      );
                    }
                },
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
              ),
              padding: const EdgeInsets.all(0.0),
              child: Ink(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF13E3D2),
                      Color(0xFF5D74E2)
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(80.0),
                  ),
                ),
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 350,
                    minHeight: 56.0,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'HITUNG',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}