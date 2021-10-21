import 'package:chothuexemay_owner/Repositories/generic_repository.dart';
import 'package:chothuexemay_owner/models/customer_model.dart';

abstract class ICustomerRepository extends GenericRepository {
  Future<Customer> getInformationCustomer(String CustomerId);
  
}
