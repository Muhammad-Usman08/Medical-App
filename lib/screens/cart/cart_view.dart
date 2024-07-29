import 'package:flutter/material.dart';
import 'package:medicalapp/components/button.dart';
import 'package:medicalapp/components/heading.dart';
import 'package:medicalapp/screens/cart/widgets/charges.dart';
import 'package:medicalapp/screens/home/home.dart';
import 'package:medicalapp/screens/list.dart';

// ignore: must_be_immutable
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  //delete item
  deleteItem(index) {
    selectedItems.removeAt(index);
    setState(() {});
  }

  //delete All
  deleteAll() {
    selectedItems.clear();
    setState(() {});
  }

  //total function
  calculateTotalPrice() {
    int totalPrice = 0;
    for (var item in selectedItems) {
      int price = int.parse(item['productPrice']);
      int quantity = item['quantity'];
      totalPrice += price * quantity;
    }
    return totalPrice;
  }

  //subtotal
  subTotal() {
    int totalPrice = calculateTotalPrice();
    if (totalPrice != 0) {
      return totalPrice - 20;
    } else {
      return totalPrice;
    }
  }

  // Increase quantity of item
  addItems(index) {
    setState(() {
      selectedItems[index]['quantity']++;
    });
  }

  // decrease quantity of item
  removeItems(index) {
    setState(() {
      if (selectedItems[index]['quantity'] != 0) {
        selectedItems[index]['quantity']--;
      } else if (selectedItems[index]['quantity'] == 0) {
        selectedItems.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var totalPrice = calculateTotalPrice();
    var total = subTotal();
    return Scaffold(
      // Appbar
      appBar: AppBar(
        title: const Heading(heading: 'Your Cart'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
              },
              child: Text(
                '+ Add more',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.blue[800]),
              ))
        ],
      ),
      // Body
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${selectedItems.length} Items in your cart',
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      deleteAll();
                    },
                    child: const Text(
                      'Delete All',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff4157FF),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            // Items
            Expanded(
              child: ListView.builder(
                itemCount: selectedItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.20,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[300],
                              ),
                              child: Image.asset(
                                  selectedItems[index]['productImage']),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    selectedItems[index]['productName'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    selectedItems[index]['productDescription'],
                                    style: const TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Rs.${selectedItems[index]['productPrice'].toString()}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    deleteItem(index);
                                  },
                                  icon: Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 0),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[600],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          addItems(index);
                                        },
                                        child: const Text(
                                          '+',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 13),
                                          child: Text(
                                            selectedItems[index]['quantity']
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          )),
                                      GestureDetector(
                                        onTap: () {
                                          removeItems(index);
                                        },
                                        child: const Text(
                                          '-',
                                          style: TextStyle(fontSize: 40),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Container(
                margin: const EdgeInsets.only(top: 15),
                child: const Heading(heading: 'Payment Summary')),
            paymentSummary('Rs.$totalPrice', "Order Total"),
            paymentSummary('-10', "Items Discount"),
            paymentSummary('-10', "Coupon Discount"),
            paymentSummary('Free', "Shipping"),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Heading(heading: 'Total'),
                Text(
                  'Rs.${total.toString()}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 25),
                child: const Center(child: MyButton(buttonText: 'Place Order')))
          ],
        ),
      ),
    );
  }
}
