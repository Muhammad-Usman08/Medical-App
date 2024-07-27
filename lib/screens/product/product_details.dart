import 'package:flutter/material.dart';
import 'package:medicalapp/components/button.dart';
import 'package:medicalapp/components/heading.dart';
import 'package:medicalapp/screens/cart/cart_view.dart';
import 'package:medicalapp/screens/favourite/favourite.dart';
import 'package:medicalapp/screens/list.dart';
import 'package:medicalapp/screens/product/widgets/text.dart';

class ProductDetalis extends StatefulWidget {
  final dynamic index;
  const ProductDetalis({super.key, this.index});

  @override
  State<ProductDetalis> createState() => _ProductDetalisState();
}

class _ProductDetalisState extends State<ProductDetalis> {
  //Add items
  addItems() {
    selectedItems.add({
      'productImage': '${items[widget.index]['productimage']}',
      'productPrice': '${items[widget.index]['productPrice']}',
      'productName': '${items[widget.index]['1stline']}',
      'productDescription': '${items[widget.index]['2ndline']}',
    });
  }

  addFavItems() async {
    if (items[widget.index]['isFav'] == true) {
      await Future.delayed(Duration(milliseconds: 50));
      setState(() {
        items[widget.index]['isFav'] = false;
        favouriteItems.removeWhere((item) =>
            item['productImage'] == items[widget.index]['productimage']);
      });
    } else {
      setState(() {
        items[widget.index]['isFav'] = true;
        favouriteItems.add({
          'productImage': '${items[widget.index]['productimage']}',
          'productPrice': '${items[widget.index]['productPrice']}',
          'productName': '${items[widget.index]['1stline']}',
          'productDescription': '${items[widget.index]['2ndline']}',
        });
      });
    }

    print(favouriteItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Faviourite(),
                    ));
              },
              icon: const Icon(
                Icons.notifications_none,
                size: 26,
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 25),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ));
                  },
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    size: 25,
                  )))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    items[widget.index]['1stline'],
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                      onPressed: () {
                        addFavItems();
                      },
                      icon: Icon(Icons.favorite,
                          color: items[widget.index]['isFav'] == true
                              ? Colors.red
                              : Colors.grey)),
                ],
              ),

              Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  child: myText(items[widget.index]['2ndline'])),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.95,
                height: MediaQuery.sizeOf(context).height * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200]),
                child: Image.asset(items[widget.index]['productimage']),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rs.${items[widget.index]['productPrice'].toString()}',
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          items[widget.index]['2ndline'],
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          addItems();
                        },
                        child: const Text(
                          '+ Add to cart',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff4157FF),
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              //Content
              Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: const Heading(heading: 'Product Details')),
              myText(
                  'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.'),
              Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: const Heading(heading: 'Ingredients')),
              myText(
                  'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.'),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    const Heading(heading: 'Expiry Date'),
                    Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: myText('25/12/2023')),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 25),
                child: Row(
                  children: [
                    const Heading(heading: 'Brand Name'),
                    Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: myText('Something')),
                  ],
                ),
              ), //Content end
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber[600],
                      ),
                      const Text('4.2')
                    ],
                  ),
                  const Text(
                    '5-Oct-2024',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Heading(heading: 'Erric Hoffman')),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 35),
                child: myText(
                    'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas '),
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 35),
                  child: Center(
                    child: MyButton(
                      buttonText: 'GO TO CART',
                      onpressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartScreen(),
                            ));
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
