import 'package:flutter/material.dart';
import 'package:medicalapp/screens/list.dart';

class Faviourite extends StatefulWidget {
  const Faviourite({super.key});

  @override
  State<Faviourite> createState() => _FaviouriteState();
}

class _FaviouriteState extends State<Faviourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Faviourites',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
          itemCount: favouriteItems.isEmpty ? 1 : favouriteItems.length,
          itemBuilder: (context, index) {
            if (favouriteItems.isEmpty) {
              return Container(
                margin:const EdgeInsets.only(top: 40),
                child: (const Center(
                  child: Text('No Favourite Items.'),
                )),
              );
            } else {
              return Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.22,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[300],
                          ),
                          child: Image.asset(
                              favouriteItems[index]['productImage']),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                favouriteItems[index]['productName'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                              Text(
                                favouriteItems[index]['productDescription'],
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
