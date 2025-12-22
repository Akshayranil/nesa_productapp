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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Product")),
      body: BlocConsumer<EditProductBloc, EditProductState>(
        listener: (context, state) {
          if (state is EditProductSuccess) {
            
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Product updated successfully")),
            );
            Navigator.pop(context, true); // go back
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: "Title"),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Price"),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(labelText: "Description"),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: state is EditProductLoading
                      ? null
                      : () {
                          context.read<EditProductBloc>().add(
                                UpdateProductEvent(
                                  id: widget.product.id,
                                  title: titleController.text,
                                  price: double.parse(priceController.text),
                                  description: descriptionController.text,
                                ),
                              );
                        },
                  child: state is EditProductLoading
                      ? const CircularProgressIndicator()
                      : const Text("UPDATE"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
