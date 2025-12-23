import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesa_machinetask/features/product_editscreen/presentation/ui/product_editscreen.dart';
import 'package:nesa_machinetask/features/products_detailed/presentation/bloc/productdetails_bloc.dart';
import 'package:nesa_machinetask/features/products_detailed/presentation/bloc/productdetails_event.dart';
import 'package:nesa_machinetask/features/products_detailed/presentation/bloc/productdetails_state.dart';

class ProductDetailsPage extends StatelessWidget {
  final int productId;

  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    context.read<ProductDetailsBloc>().add(FetchProductDetails(productId));

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 192, 253),
      body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductDetailsLoaded) {
            final product = state.product;

            return Column(
              children: [
                // 🔹 TOP 80% - WHITE AREA
                Expanded(
                  flex: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32)
                      )
                    ),
                    child: SafeArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 🔹 Top Bar
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.chevron_left_rounded),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () async {
                                        final result = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => EditProductPage(
                                              product: product,
                                            ),
                                          ),
                                        );

                                        if (result != null) {
                                          // ignore: invalid_use_of_visible_for_testing_member
                                          context.read<ProductDetailsBloc>().emit(ProductDetailsLoaded(result));
                                        }
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.favorite_border),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 24),

                            // 🔹 Product Image
                            Center(
                              child: Container(
                                height: 200,
                                width: 220,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFF3F3F3),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(28),
                                  child: Image.network(
                                    product.thumbnail,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            // 🔹 Price
                            Text(
                              "\$ ${product.price}",
                              style: const TextStyle(
                                fontSize: 32,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 2),

                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.pink.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  "Best Seller",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),

                            Text(
                              product.title,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 24),

                            Row(
                              children: [
                                _tabItem("Full Specification", true),
                                const SizedBox(width: 24),
                                _tabItem("Reviews", false),
                              ],
                            ),

                            const SizedBox(height: 16),

                            const Text(
                              "About the item",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              product.description,
                              style: const TextStyle(
                                color: Colors.grey,
                                height: 1.5,
                              ),
                            ),

                            const SizedBox(height: 16),

                            // 🔹 Full-width Card
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 4,
                              color: Colors.white,
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    product.thumbnail,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(product.title),
                                subtitle: const Text("1 item is in the way"),
                                trailing: const Icon(
                                  Icons.chevron_right_rounded,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // 🔹 BOTTOM 20% - PURPLE AREA
                Expanded(
                  flex: 2,
                  child: Container(
                    color:  const Color.fromARGB(255, 181, 192, 253),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: SizedBox(
                        height: 56,
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 80, 52, 129),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                          label: const Text(
                            "ADD TO CART",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          return const Center(child: Text("Failed to load product"));
        },
      ),
    );
  }

  Widget _tabItem(String text, bool selected) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: selected ? Colors.blue.shade50 : Colors.transparent, // slight color if selected
      borderRadius: BorderRadius.circular(20), // curved border
      border: selected 
          ? Border.all(color: Colors.blue, width: 1) // optional border
          : null,
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: selected ? Colors.blue : Colors.grey, // change text color if selected
      ),
    ),
  );
}

}
