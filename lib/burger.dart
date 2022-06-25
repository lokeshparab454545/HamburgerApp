import 'package:burger/burgerPage.dart';
import 'package:flutter/material.dart';

class HamburgerList extends StatefulWidget {
  final int row;
  const HamburgerList({required this.row});
  @override
  State<HamburgerList> createState() => _HamburgerListState();
}

class _HamburgerListState extends State<HamburgerList> {
  @override
  Widget build(BuildContext context) {
    int items = 10;
    Widget baconImage = SizedBox(
      height: 140,
      child: Image.asset("images/burger.png"),
    );
    Widget chickenImage = SizedBox(
      height: 140,
      child: Image.asset("images/chickenburger.png"),
    );
    return SliverToBoxAdapter(
      child: Container(
        height: widget.row == 2 ? 330 : 240,
        margin: const EdgeInsets.only(top: 15),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items,
          itemBuilder: (context, index) {
            bool reverse = widget.row == 2 ? index.isEven : index.isOdd;
            return Stack(
              children: [
                Container(
                  height: 240,
                  width: 200,
                  margin:
                      EdgeInsets.only(left: 20, right: index == items ? 10 : 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(BurgerPage.tag);
                    },
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      elevation: 3,
                      margin: const EdgeInsets.all(10),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: [
                            Text(
                              reverse ? "Chicken Burger" : "Veg Burger",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                const Spacer(),
                                Text(
                                  reverse ? "Rs. 85" : "Rs. 65",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const Spacer(),
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(Icons.add),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: reverse ? 50 : 50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(BurgerPage.tag);
                    },
                    child: reverse ? chickenImage : baconImage,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
