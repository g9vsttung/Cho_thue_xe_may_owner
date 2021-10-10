import 'package:chothuexemay_owner/Repositories/Interfaces/customer_interface.dart';
import 'package:chothuexemay_owner/models/customer_model.dart';
import 'package:chothuexemay_owner/services/customer_service.dart';

class CustomerRepository implements ICustomerRepository {
  CustomerService service = CustomerService();
  @override
  Future<List<Customer>> getAll() async {
    Future.delayed(const Duration(seconds: 5));
    return service.getAll();
  }
}
