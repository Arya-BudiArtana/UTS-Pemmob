import 'package:flutter/material.dart';
import 'dart:math';

class Hasil extends StatelessWidget {
  Hasil(
      {@required this.tinggi_badan,
      @required this.berat_badan,
      @required this.nama_user,
      @required this.jenis_kelamin,
      @required this.tanggal,
      @required this.bulan,
      @required this.tahun,
      @required this.year_now});
  final int tinggi_badan;
  final int berat_badan;
  final String nama_user;
  final String jenis_kelamin;
  final int tanggal;
  final int bulan;
  final int tahun;
  final int year_now;

  @override
  Widget build(BuildContext context) {
    int hitung = tinggi_badan - 100;
    double perempuan = hitung - hitung * 0.15;
    double lelaki = hitung - hitung * 0.1;
    int umur = year_now - tahun;
    double hasil;
    String ideal;
    String tips;

    if (jenis_kelamin == "Perempuan") {
      hasil = perempuan;

      if (perempuan < berat_badan) {
      ideal = "melebihi berat badan ideal. Aktif bergerak, lakukan olahraga ringan setiap pagi, dan kurangi asupan lemak";
    } 

    else if (perempuan > berat_badan) {
       ideal = "kurang dari berat badan ideal. Jaga asupan gizi anda, teap berolah raga, minum suplemen atau obat cacing sesuai anjuran dokter";
    }
    else {
       ideal = "sudah ideal. Pertahankan berat badan anda, selalu cek kesehatan dan perubahan tinggi dan berat badan anda";
    }


    } 
    else if (jenis_kelamin == "Laki-Laki") {
       hasil = lelaki;

       if (lelaki < berat_badan) {
      ideal = "melebihi berat badan ideal. Aktif bergerak, lakukan olahraga ringan setiap pagi, kurangi asupan lemak, dan ikuti program diet sehat,";
    } 

    else if (lelaki > berat_badan) {
       ideal = "kurang dari berat badan ideal. Jaga asupan gizi anda, tetap berolah raga, minum suplemen atau obat cacing sesuai anjuran dokter,";
    }
    else {
       ideal = "sudah ideal. Pertahankan berat badan anda, selalu cek kesehatan serta perubahan tinggi dan berat badan anda,";
    }
    }

    if (umur <= 17) {
      tips =
          "mulai pola hidup sehat, rajin berolahraga, makan makanan sehat, dan kurangan junk food";
    } else if (umur > 17 && umur <= 30) {
      tips =
          "tetap rajin berolaraga, jaga asupan gizi, istirahat yang cukup, dan jangan bergadang";
    } else if (umur > 30 && umur <= 45) {
      tips =
          "aktiflah bergerak, kurangi stress, jangan minum minuman berakohol, jaga asupan gizi, dan rajin periksa kesehatan";
    } else {
      tips =
          "kurangi kegiatan yang tidak perlu, pcukup sitirahat, kurangi bergadang, jaga asupan makanan, dan kurangi kolestrol";
    }
    
    return Scaffold(
            appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: Icon(
          Icons.local_library,
          color: Colors.white,
        ),
        title: Text('Hasil'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            onPressed: () {
              
            },
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),

       body: Form(
          child: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent, Colors.greenAccent]
              )
            ),

            child: Container(
              width: double.infinity,
              height: 350.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(
                      'images/person.png'
                      ),
                      radius: 50.0,
                    ),
                    
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "$nama_user",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Kelamin",
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "$jenis_kelamin",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(

                                children: <Widget>[
                                  Text(
                                    "Usia",
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "$umur Tahun",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(

                                children: <Widget>[
                                  Text(
                                    "Tinggi",
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "$tinggi_badan cm",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ),

                Container(
                   margin: const EdgeInsets.only(top: 20.0, left: 75),
                child: Text(
                      "Berat Badan Ideal (Kg):",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontStyle: FontStyle.normal,
                      fontSize: 28.0
                    ),
                  ),
                ),

            Container(
              width: 300,
              margin: const EdgeInsets.only(top: 6.0),
              child : new RaisedButton(
                onPressed: (){},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)
                ),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.redAccent,Colors.pinkAccent]
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container( 
                    constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(hasil.toStringAsFixed(2), style: TextStyle(color: Colors.white, fontSize: 26.0, fontWeight:FontWeight.w300),
                    ),
                ),
              )
            ),
          ),

          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      "Tips:",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontStyle: FontStyle.normal,
                      fontSize: 28.0
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Berat badan Anda sekarang $ideal\n'
                      '$tips',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(
            height: 20.0,
          ),
          
        ],
          )
      ),
    );
  }
}