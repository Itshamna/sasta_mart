import 'package:flutter/material.dart';
import 'package:sasta_mart/widgets/top_titles/top_titles.dart';

import '../../../models/product_model/product_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
      SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopTitle(title: "Sasta Mart", subtitle: ""),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Search...",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search_outlined),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Top Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categorieslist
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Card(
                        elevation: 6.0,
                        color: Colors.lightBlueAccent[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.network(e),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(height: 12,),
          Padding(
            padding: EdgeInsets.only(left: 12,top: 12),
            child: Text(
              "Best Selling Products",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),),
    SizedBox(height: 12,),
    Padding(
      padding: EdgeInsets.all(12,),
  child:
  GridView.builder(
    padding: EdgeInsets.zero,
              shrinkWrap: true,
              primary: false,
              itemCount: bestProducts.length ,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
              mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.9
              ),
              itemBuilder: (ctx,index){
                ProductModel singleProduct = bestProducts[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent[100],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.only(top: 5),

              child: Column(
                children: [
                  Image.network(singleProduct.image,
                    fit: BoxFit.cover,
                  height: 50,
                  width: 50,),
                  const SizedBox(height: 5,),
                  Text(
                    singleProduct.name,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5,),
                  Text("Price: \Rs.${singleProduct.price}"),
                  const SizedBox(height: 10,),
                  SizedBox(height: 50,
                  width: 140,
                  child:
                  OutlinedButton(
                    onPressed: (){}, child: const Text("Buy Now"),
                  ),
                  ),],
              ),
            );
          }),
), ],
      ),
      ),

    );
  }
}

List<String> categorieslist = [
  "https://static.vecteezy.com/system/resources/previews/019/607/567/original/fast-food-vector-clipart-design-graphic-clipart-design-free-png.png",
  "https://i.ibb.co/7XDPRR2/png-transparent-consumer-electronics-gadget-advanced-electronics-electronic-component-others-electro.png",
  "https://i.ibb.co/nRvjjtW/pngtree-patch-of-fashion-accessories-png-image-5549693-removebg-preview.png",
  "https://i.ibb.co/QnYnxw0/4-42647-wooden-furniture-transparent-background-transparent-background-furniture-png-removebg-previe.png",
  "https://i.ibb.co/5jzvz8v/png-clipart-cosmetics-personal-care-fashion-cream-women-dress-holidays-women-accessories-removebg-pr.png",
  "https://i.ibb.co/WfcMXPC/png-clipart-school-supplies-illustration-paper-stationery-graphic-design-pencil-books-stationery-pos.png",
  "https://i.ibb.co/192dgzK/png-clipart-car-jeep-tire-motor-vehicle-service-car-parts-vehicle-tire-surrounded-by-vehicle-parts-a.png",
  "https://i.ibb.co/DrZPG5n/istockphoto-612263694-612x612-removebg-preview.png",
  "https://i.ibb.co/z4BHLCR/download-removebg-preview.png",
  "https://i.ibb.co/58WXJYP/download-3-removebg-preview.png",
  "https://i.ibb.co/cyxgLhn/download-2-removebg-preview.png",
  "https://i.ibb.co/vLZL6Br/download-1-removebg-preview.png",
  "https://i.ibb.co/s1fwzL7/20-202688-sports-png-file-download-free-play-sports-transparent-removebg-preview.png"
];

List<ProductModel> bestProducts = [
  ProductModel(
      image: "https://i.ibb.co/nmY7Xhf/1-removebg-preview.png",
      id: "1",
      name: "Banana",
      price: 150,
      description: "Seasons best Bananas",
      isFavourite: false),

  ProductModel(
      image: "https://i.ibb.co/kKfkXJY/2-removebg-preview.png",
      id: "2",
      name: "Led Tv",
      price: 1500,
      description: "This is the best Led",
      isFavourite: false),

  ProductModel(
      image: "https://i.ibb.co/BZ9w3CJ/3-removebg-preview.png",
      id: "3",
      name: "Shoulder Bag",
      price: 3000,
      description: "This is the best Bag",
      isFavourite: false),

  ProductModel(
      image: "https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/29359/cupboard-clipart-xl.png",
      id: "4",
      name: "Cup board",
      price: 10000,
      description: "This is the best cup board",
      isFavourite: false),

  ProductModel(
      image: "https://i.ibb.co/4TL2Bhh/4.png",
      id: "5",
      name: "Kookaburra Bat",
      price: 2000,
      description: "This is the best Cricket Bat ",
      isFavourite: false),

  ProductModel(
      image: "https://i.ibb.co/LJNDm2n/5.png",
      id: "6",
      name: "Note Books",
      price: 500,
      description: "These are quality notebooks.",
      isFavourite: false),

  ProductModel(
      image: "https://www.pngmart.com/files/10/Teddy-Bear-Transparent-PNG.png",
      id: "7",
      name: "Teddy Bears",
      price: 400,
      description: "This is the best Teddy Bear",
      isFavourite: false),

  ProductModel(
      image: "https://i.ibb.co/hXV26Kb/7.png",
      id: "8",
      name: "Football",
      price: 350,
      description: "This is the best Football",
      isFavourite: false),


];
