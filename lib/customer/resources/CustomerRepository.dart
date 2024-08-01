part of 'CustomerRepoImports.dart';

class CustomerRepository {
  late BuildContext _context;
  late CustomerHttpMethods _customerHttpMethods;

  CustomerRepository(BuildContext context) {
    _context = context;
    _customerHttpMethods = new CustomerHttpMethods(_context);
  }

  Future<CategorizedIngredientModel?> categorizedIngredient() =>
      _customerHttpMethods.categorizedIngredient();
}
