import 'package:flutter/material.dart';
import 'package:provide_with_dio/view_model/products_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'Home Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Consumer<ProductsViewModel>(
        builder: (context, value, child) {
          if(value.products.isNotEmpty){
           return ListView.builder(
            itemCount: value.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(value.products[index].title.toString()),
                onTap: () {
                  // Handle product tap
                },
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
