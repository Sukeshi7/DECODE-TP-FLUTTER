import 'package:flutter/material.dart';
import '../api/models/product_model.dart';
import '../api/repositories/product_repository.dart';
import '../helpers/exceptions.dart';

class ProductNotifier extends ChangeNotifier {
  final ProductRepository _repository = ProductRepository();

  List<Product> _products = [];
  List<Product> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _currentPage = 1;
  bool _hasMore = true;
  String? _currentSearch;
  
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchProducts({bool isRefresh = false, String? search}) async {
    if (_isLoading) return;

    if (isRefresh || search != _currentSearch) {
      _currentPage = 1;
      _products = [];
      _hasMore = true;
      _currentSearch = search;
    }

    if (!_hasMore) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _repository.getProducts(
        page: _currentPage,
        search: _currentSearch,
      );

      _products.addAll(response.rows);
      _hasMore = _products.length < response.count;
      _currentPage++;
    } on ApiException catch (e) {
      _errorMessage = e.message;
    } catch (e) {
      debugPrint("Erreur pagination: $e");
      _errorMessage = "Une erreur est survenue lors du chargement";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  Future<bool> addProduct(Map<String, dynamic> productData) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _repository.createProduct(productData);
      await fetchProducts(isRefresh: true);
      return true;
    } on ApiException catch (e) {
      _errorMessage = e.message;
      return false;
    } catch (e) {
      _errorMessage = "Erreur lors de la création";
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> editProduct(String id, Map<String, dynamic> productData) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _repository.updateProduct(id, productData);
      await fetchProducts(isRefresh: true);
      return true;
    } on ApiException catch (e) {
      _errorMessage = e.message;
      return false;
    } catch (e) {
      _errorMessage = "Erreur lors de la modification";
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> deleteProduct(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _repository.deleteProduct(id);
      await fetchProducts(isRefresh: true);
      return true;
    } on ApiException catch (e) {
      _errorMessage = e.message;
      return false;
    } catch (e) {
      _errorMessage = "Erreur lors de la suppression";
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
