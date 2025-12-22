abstract class EditProductEvent {}

class UpdateProductEvent extends EditProductEvent {
  final int id;
  final String title;
  final double price;
  final String description;

  UpdateProductEvent({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
  });
}


