import 'package:flutter/material.dart';
import 'package:medicalapp/components/heading.dart';
import 'package:medicalapp/screens/cart/cart_view.dart';
import 'package:medicalapp/screens/favourite/favourite.dart';
import 'package:medicalapp/screens/home/widgets/categories.dart';
import 'package:medicalapp/screens/product/product_details.dart';
import '../list.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f9fd),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Header
            SizedBox(
              height: 265,
              child: Stack(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xff4157FF),
                    ),
                    height: 230,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/logo.jpeg'),
                              radius: 25,
                              backgroundColor: Colors.white,
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  const Faviourite())));
                                    },
                                    icon: const Icon(
                                      Icons.notifications_none,
                                      color: Colors.white,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const CartScreen(),
                                          ));
                                    },
                                    icon: const Icon(
                                      Icons.shopping_bag_outlined,
                                      color: Colors.white,
                                    ))
                              ],
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 28, bottom: 4),
                          child: const Text(
                            'Hi, Usman',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Text(
                          'Welcome to Quick Medical Store',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //TextField
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 7,
                          ),
                        ],
                      ),
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 55,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Medicine & Healthcare products',
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Top Categories
            Container(
              margin: const EdgeInsets.only(top: 25, bottom: 15, left: 20),
              child: const Heading(heading: 'Top Categories'),
            ),
            // categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  categories(const Color(0xffFF9598), 'Dental'),
                  categories(const Color(0xff19E5A5), 'Wellness'),
                  categories(const Color(0xffFFC06F), 'Homeo'),
                  categories(const Color(0xff4DB7FF), 'Eye care'),
                  categories(const Color(0xffFF9598), 'Dental'),
                  categories(const Color(0xff19E5A5), 'Wellness'),
                  categories(const Color(0xffFFC06F), 'Homeo'),
                  categories(const Color(0xff4DB7FF), 'Eye care'),
                ],
              ),
            ),

            // Banner
            Stack(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.only(left: 20, top: 30, bottom: 25),
                  child: Image.asset(
                    'assets/images/background.jpeg',
                    width: MediaQuery.sizeOf(context).width * 0.9,
                  ),
                ),
                const Positioned(
                  top: 65,
                  left: 45,
                  child: Text(
                    'Save extra on \nevery order',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Positioned(
                  bottom: 65,
                  left: 45,
                  child: Text(
                    'Etiam mollis metus \nnon faucibus . ',
                  ),
                ),
              ],
            ),
            //products
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Heading(heading: 'Deals of the Day'),
                  Text(
                    'More',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff4157FF),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio:
                      MediaQuery.sizeOf(context).aspectRatio * 1.2,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ProductDetalis(
                                    index: index,
                                  ))));
                    },
                    child: Container(
                      height: 1000,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 7,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xffeeeef0),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            height: MediaQuery.sizeOf(context).height * 0.17,
                            width: MediaQuery.sizeOf(context).width * 0.45,
                            child: Image.asset(
                              items[index]['productimage'],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[index]['1stline'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    items[index]['2ndline'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Rs.${items[index]['productPrice'].toString()}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
