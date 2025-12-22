import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesa_machinetask/features/product_screen/presentation/widget/product_card.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';


class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(FetchProducts());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.shopping_cart)
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProductLoaded) {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const Text(
                    'Discover our exclusive \nproducts',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'In this marketplace, you will find various\ntechnics in the cheapest price',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),

                  ...state.groupedProducts.entries.map((entry) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(entry.key.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            const Text('Show All',
                                style: TextStyle(color: Colors.blue)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 250,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: entry.value.length,
                            itemBuilder: (_, index) {
                              return ProductCard(
                                  product: entry.value[index]);
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    );
                  }),
                ],
              );
            }

            return const Center(child: Text('Error loading products'));
          },
        ),
      ),
    );
  }
}
