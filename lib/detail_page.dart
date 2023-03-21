import 'package:flutter/material.dart';
import 'data_buku.dart';

class HalamanDetailBuku extends StatefulWidget {
  final DataBuku rent;
  const HalamanDetailBuku({Key? key, required this.rent}) : super(key: key);

  @override
  State<HalamanDetailBuku> createState() => _HalamanDetailBukuState();
}

class _HalamanDetailBukuState extends State<HalamanDetailBuku> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;

  bool isAvailable = true;
  String ketersediaan = "Tersedia";
  var warna = Colors.green;
  statusbutton() {
    if (isAvailable == false) {
      return null;
    } else {
      return () {
        String text = " ";
        if (isAvailable == true) {
          setState(() {
            text = "Berhasil Meminjam Buku";
            ketersediaan = "Tidak Tersedia";
            warna = Colors.red;
            isAvailable = false;
          });
        }
        SnackBar snackBar = SnackBar(
          content: Text(text),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("${widget.rent.title}"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
          ],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 220,
                width: 270,
                padding: const EdgeInsets.all(12),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                        height: 400,
                        width: 250,
                        child: Image.network(widget.rent.imageLink)),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.rent.title,
                style: TextStyle(fontSize: 24),
                maxLines: 1,
              ),
              const SizedBox(
                width: 20,
              ),
              Card(
                child: Container(
                  height: 250,
                  width: 700,
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 80,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Judul                           : " +
                                widget.rent.title,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Penulis                       : " +
                                widget.rent.author,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Bahasa                       : " +
                                widget.rent.language,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Negara                       : " +
                                widget.rent.country,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Jumlah Halaman     : " +
                                widget.rent.pages.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Tahun Terbit             : " +
                                widget.rent.year.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Status                        :  ' + ketersediaan,
                            style: TextStyle(fontSize: 16, color: warna),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: 35,
                  width: 300,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(100),
                    ),
                    onPressed: statusbutton(),
                    child: const Text('Pinjam Buku'),
                  )),
            ],
          ),
        ));
  }
}
