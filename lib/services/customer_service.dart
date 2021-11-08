import 'dart:convert';
import 'package:chothuexemay_owner/apis/common.dart';
import 'package:chothuexemay_owner/models/customer_model.dart';
import 'package:http/http.dart' as http;

class CustomerService {
  Future<Customer> getCustomerByPhone(String phone) async {
    Uri url = Uri.parse(CustomerApiPath.GET_BY_PHONE + phone);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return Customer.jsonFrom(body);
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<List<Customer>> getAll() async {
    Uri url = Uri.parse(URL_SERVER + "api/areas");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable customers = body;
      return customers.map((uni) => Customer.jsonFrom(uni)).toList();
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<Customer> getCustomerById(String customerId) async {
    Uri url = Uri.parse(CustomerApiPath.GET_BY_ID + customerId);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Customer.jsonFrom(jsonDecode(response.body));
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
