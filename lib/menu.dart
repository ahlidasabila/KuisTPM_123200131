import 'package:flutter/material.dart';
import 'data_buku.dart';
import 'detail_page.dart';

class HalamanListBuku extends StatelessWidget {
  const HalamanListBuku({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Buku"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: listBuku.length,
        itemBuilder: (BuildContext context, int index) {
          final DataBuku rent = listBuku[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HalamanDetailBuku(rent: rent),
                  ));
            },
            child: Card(
              elevation: 10,
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: 300,
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                          height: 400,
                          width: 150,
                          child: Image.network(rent.imageLink)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          rent.title,
                          style: TextStyle(
                              fontSize: 24, fontStyle: FontStyle.italic),
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          rent.author,
                          style: TextStyle(fontSize: 16),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
