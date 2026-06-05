import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../api/models/product_model.dart';
import '../notifiers/product_notifier.dart';

class ProductDeleteScreen extends StatelessWidget {
  final Product product;

  const ProductDeleteScreen({super.key, required this.product});

  void _confirmDelete(BuildContext context) async {
    final notifier = context.read<ProductNotifier>();
    final success = await notifier.deleteProduct(product.id);

    if (success && context.mounted) {
      context.pop(); // Retour à la liste
    }
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<ProductNotifier>();

    return Scaffold(
      appBar: AppBar(title: const Text('Supprimer un produit')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.warning_amber_rounded, size: 80, color: Colors.orange),
            const SizedBox(height: 24),
            const Text(
              'Êtes-vous sûr ?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Vous êtes sur le point de supprimer le produit :\n"${product.name}"',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            if (notifier.errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  notifier.errorMessage!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ElevatedButton(
              onPressed: notifier.isLoading ? null : () => _confirmDelete(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: notifier.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                    )
                  : const Text('CONFIRMER LA SUPPRESSION'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: notifier.isLoading ? null : () => context.pop(),
              child: const Text('ANNULER'),
            ),
          ],
        ),
      ),
    );
  }
}
