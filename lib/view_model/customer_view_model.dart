import 'package:chothuexemay_owner/Repositories/Implementations/customer_repository.dart';
import 'package:chothuexemay_owner/Repositories/Interfaces/customer_interface.dart';
import 'package:chothuexemay_owner/models/customer_model.dart';
import 'package:flutter/cupertino.dart';

class CustomerViewModel extends ChangeNotifier {
  final ICustomerRepository _repository = CustomerRepository();

  Future<Customer> getCustomerById(String customerId) async {
    return await _repository.getInformationCustomer(customerId);
  }
}
