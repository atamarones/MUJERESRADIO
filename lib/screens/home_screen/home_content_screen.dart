import 'package:flutter/material.dart';
import '../../components/staggered_grid_view.dart';
import '../../components/static_image.dart';
import '../../constants.dart';
import 'components/carousel_card.dart';

class MyHomeContent extends StatefulWidget {
  const MyHomeContent({Key? key}) : super(key: key);

  @override
  MyHomeContentState createState() => MyHomeContentState();
}

class MyHomeContentState extends State<MyHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: SizedBox(
              height: 150,
              child: StaticImage(
                call_to_action: "https://tamarones.com/",
                height: 100,
                url_image: "assets/images/blog.jpg",
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Text('    CURSOS',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w700)),
            ],
          ),
          Container(
            height: 160,
            width: MediaQuery.of(context).size.width,
            child: Library(),
          ),
          Row(
            children: [
              Text('    PROGRAMAS DESTACADOS',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w700)),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StaggeredGridView(),
            ),
          ),
        ]));
  }
}
