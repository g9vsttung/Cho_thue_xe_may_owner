import 'package:chothuexemay_owner/Repositories/Implementations/booking_repository.dart';
import 'package:chothuexemay_owner/Repositories/Interfaces/booking_interface.dart';
import 'package:chothuexemay_owner/models/booking_transaction.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:flutter/cupertino.dart';

class BookingTransactionViewModel extends ChangeNotifier {
  final IBookingRepository _repository = BookingRepository();
  Future<BookingTranstion> getById(String id) async {
    return await _repository.getBookingTransactionById(id);
  }

  Future<List<BookingTranstion>> getOngoingBookingTransactions(int page) async {
    return await _repository.getOngoingBookingTransactions(
        page, StringConstants.SIZE_PAGE);
  }

  Future<List<BookingTranstion>> getHistoryBookingTransactions(int page) async {
    return await _repository.getHistoryBookingTransactions(
        page, StringConstants.SIZE_PAGE);
  }
}
