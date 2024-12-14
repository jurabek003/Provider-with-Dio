import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provide_with_dio/view_model/products_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      
        title:const Text(
          'Home Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Consumer<ProductsViewModel>(
        builder: (context, value, child) {
          if(value.products.isNotEmpty){
           return MasonryGridView.builder(
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          mainAxisSpacing: 20, 
          crossAxisSpacing: 20,
            padding: const EdgeInsets.all(8),
            itemCount: value.products.length,
            itemBuilder: (context, index) {
              return Container(
                // margin:const EdgeInsets.all(12),
                decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius:const BorderRadius.all(Radius.circular(10)),
                  // border: Border.all(color: Color.fromARGB(137, 103, 80, 80),width: 1),
                  boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    spreadRadius: -2,
                    offset: Offset(3, 5),
                  )
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(value.products[index].image,width: double.infinity,height: 100,fit: BoxFit.contain,),
                      Text(value.products[index].title, style: const TextStyle(fontSize: 13,fontWeight: FontWeight.w700),maxLines: 1,),
                      Text(value.products[index].category, style: const TextStyle(fontSize: 11,color: Color.fromARGB(221, 158, 119, 119),fontWeight: FontWeight.w400),),

                      Text("\$${value.products[index].price.toString()}", style: const TextStyle(fontSize: 14,color: Colors.brown,fontWeight: FontWeight.bold),)
                    ],
                  ),
                )
              );
            },
          );
          }else{
            return const Center(child: Text('No products found'));
          }
  
      },),
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.read<ProductsViewModel>().getProducts();
      }),
    );
  }
}
