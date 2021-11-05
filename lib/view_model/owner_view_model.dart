// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:chothuexemay_owner/Repositories/Implementations/booking_repository.dart';
import 'package:chothuexemay_owner/Repositories/Implementations/owner_repository.dart';
import 'package:chothuexemay_owner/Repositories/Interfaces/booking_interface.dart';
import 'package:chothuexemay_owner/Repositories/Interfaces/owner_interface.dart';
import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/models/booking_transaction.dart';
import 'package:chothuexemay_owner/models/history_wallet_model.dart';
import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:chothuexemay_owner/models/wallet_model.dart';
import 'package:flutter/material.dart';

class OwnerViewModel extends ChangeNotifier {
  final List<Bike> bikes = [];
  IOwnerRepository ownerRepository = OwnerRepository();
  final IBookingRepository _bookingRepository = BookingRepository();

  Future getBikes() async {
    bikes.clear();
    await ownerRepository
        .getListBike()
        .then((value) => value.forEach((element) {
              bikes.add(element);
            }));
    notifyListeners();
  }

  void acceptOrder(String customerId) {
    ownerRepository.acceptOrder(customerId);
  }

  void denyOrder(String customerId) {
    ownerRepository.denyOrder(customerId);
  }

  Future<Owner> viewProfile() async {
    return await ownerRepository.viewProfile();
  }

  Future<Wallet> getWallet() async {
    return await ownerRepository.getWallet();
  }

  Future<List<BookingTranstion>> getBookingTransactions() async {
    return await _bookingRepository.getBookingTransactions();
  }

  Future<List<TransactionHistory>> getWalletTransactions() async {
    return await ownerRepository.getWalletTranstions();
  }

  Future<bool> updateProfile(String name, String phone, String address) async {
    return await ownerRepository.updateProfile(name, phone, address);
  }
}
