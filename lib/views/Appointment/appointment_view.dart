import 'package:chothuexemay_owner/models/booking_transaction.dart';
import 'package:chothuexemay_owner/models/category_model.dart';
import 'package:chothuexemay_owner/models/customer_model.dart';
import 'package:chothuexemay_owner/view_model/category_view_model.dart';
import 'package:chothuexemay_owner/view_model/customer_view_model.dart';
import 'package:chothuexemay_owner/view_model/owner_view_model.dart';
import 'package:chothuexemay_owner/views/Components/botton_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/Appointment/components/body.dart';
import 'package:chothuexemay_owner/views/Components/app_bar.dart';
import 'package:provider/provider.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
          title: "Đơn của bạn",
          hasBack: false,
        ),
      ),
      body: FutureBuilder(
        builder: (context, napshot) {
          if (napshot.connectionState == ConnectionState.done) {
            if (napshot.hasData) {
              final transactions = (napshot.data as dynamic)['transactions']
                  as List<BookingTranstion>;
              final categories =
                  (napshot.data as dynamic)['categories'] as List<Category>;
              return BodyAppointment(
                transactions: transactions,
                categories: categories,
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: getData(context),
      ),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: "order"),
      ),
    );
  }

  Future<Map<String, dynamic>> getData(BuildContext context) async {
    Map<String, dynamic> list = {};
    list['transactions'] =
        await Provider.of<OwnerViewModel>(context, listen: false)
            .getBookingTransactions();
    for (BookingTranstion booking in list['transactions']) {
      Customer customer =
          await Provider.of<CustomerViewModel>(context, listen: false)
              .getCustomerById(booking.customerId);
      booking.customerName = customer.fullname;
      booking.customerPhone = customer.phoneNumber;
    }
    list['categories'] =
        await Provider.of<CategoryViewModel>(context, listen: false).getAll();
    return list;
  }
}
