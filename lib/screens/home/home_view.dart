import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medicalapp/screens/home/widgets/categories.dart';
import 'package:medicalapp/screens/home/widgets/heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f9fd),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Header
          SizedBox(
            height: 265,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
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
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.notifications_none,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () {},
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              categories(const Color(0xffFF9598), 'Dental'),
              categories(const Color(0xff19E5A5), 'Wellness'),
              categories(const Color(0xffFFC06F), 'Homeo'),
              categories(const Color(0xff4DB7FF), 'Eye care'),
            ],
          ),

          // Banner
          Stack(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.only(left: 20, top: 30),
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
          )
        ],
      ),
    );
  }
}
