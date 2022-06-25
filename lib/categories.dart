import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _currentSelectedItem = 0;
  @override
  Widget build(BuildContext context) {
    int items = 10;
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items,
          itemBuilder: (context, index) => Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    margin: EdgeInsets.only(
                      left: index == 0 ? 20 : 0,
                      right: 20,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentSelectedItem = index;
                        });
                      },
                      child: Card(
                        elevation: 3,
                        margin: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: index == _currentSelectedItem
                            ? Colors.black.withOpacity(0.7)
                            : Colors.white,
                        child: Icon(
                          Icons.fastfood,
                          color: index == _currentSelectedItem
                              ? Colors.white
                              : Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.only(
                    left: index == 0 ? 20 : 0,
                    right: 20,
                  ),
                  width: 90,
                  child: Row(
                    children: const [
                      Spacer(),
                      Text("Burger"),
                      Spacer(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
