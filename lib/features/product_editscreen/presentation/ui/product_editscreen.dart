import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesa_machinetask/features/product_editscreen/presentation/bloc/editproduct_bloc.dart';
import 'package:nesa_machinetask/features/product_editscreen/presentation/bloc/editproduct_event.dart';
import 'package:nesa_machinetask/features/product_editscreen/presentation/bloc/editproduct_state.dart';
import 'package:nesa_machinetask/features/product_screen/domain/entity/product_entity.dart';

class EditProductPage extends StatefulWidget {
  final Product product;

  const EditProductPage({super.key, required this.product});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late TextEditingController titleController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.product.title);
    priceController =
        TextEditingController(text: widget.product.price.toString());
    descriptionController =
        TextEditingController(text: widget.product.description);
  }

  @override
  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFF5F6FA),
    appBar: AppBar(
      title: const Text("Edit Product"),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
    ),
    body: BlocConsumer<EditProductBloc, EditProductState>(
      listener: (context, state) {
        if (state is EditProductSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Product updated successfully")),
          );
          Navigator.pop(context, state.updatedProducts);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🔹 Card Container
            // 🔹 Card Container
SizedBox(
  width: double.infinity, // Makes the card expand horizontally
  child: Card(
    elevation: 8, // Slightly higher elevation for better focus
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28), // more padding
      child: Column(
        children: [
          _buildTextField(
            controller: titleController,
            label: "Product Title",
            icon: Icons.title,
          ),
          const SizedBox(height: 20),

          _buildTextField(
            controller: priceController,
            label: "Price",
            icon: Icons.currency_rupee,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),

          _buildTextField(
            controller: descriptionController,
            label: "Description",
            icon: Icons.description,
            maxLines: 5, // more room for description
          ),
        ],
      ),
    ),
  ),
),


              const SizedBox(height: 32),

              // 🔹 Update Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: state is EditProductLoading
                      ? null
                      : () {
                          context.read<EditProductBloc>().add(
                                UpdateProductEvent(
                                  id: widget.product.id,
                                  title: titleController.text,
                                  price: double.parse(priceController.text),
                                  description:
                                      descriptionController.text,
                                      originalProduct: widget.product
                                ),
                              );
                        },
                  child: state is EditProductLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          "UPDATE PRODUCT",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget _buildTextField({
  required TextEditingController controller,
  required String label,
  required IconData icon,
  int maxLines = 1,
  TextInputType keyboardType = TextInputType.text,
}) {
  return TextField(
    controller: controller,
    maxLines: maxLines,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      labelText: label,
      floatingLabelBehavior: FloatingLabelBehavior.always, // forces label to stay above text
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20), // enough space
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.deepPurple, width: 1),
        ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.deepPurple, width: 1),
        ),
    ),
    
  );
}


}
