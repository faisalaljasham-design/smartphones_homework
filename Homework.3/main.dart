import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'h3',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Product layout demo home page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Listing")),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          
          ProductBox(
            name: "iPhone",
            description: "iPhone is the stylist phone ever",
            price: 1000,
            image: "iphone.jpg",
          ),

          ProductBox(
            name: "pixel 1",
            description: "pixel is th most featureful phone ever",
            price: 800,
            image: "pixel.jpg",
          ),
         
          ProductBox(
            name: "Laptop",
            description: "Laptop",
            price: 2000,
            image: "laptop.jpg",
          ),
          
          ProductBox(
            name: "tablet",
            description: "tablet",
            price: 1500,
            image: "tablet.jpg",
          ),
        
          ProductBox(
            name: "pen drive",
            description: "pen drive",
            price: 100,
            image: "pendrive.jpg",
          ),
          
          ProductBox(
            name: "floppy disk",
            description: " drive is useful rescue storage medium",
            price: 2000,
            image: "floppydisk.jpg",
          ),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  }) : super(key: key);

  final String name;
  final String description;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("images/" + image),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      this.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(this.description),
                    Text("Price: " + this.price.toString()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
