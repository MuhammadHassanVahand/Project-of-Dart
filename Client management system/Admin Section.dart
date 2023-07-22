import 'dart:io';
import 'Client Section.dart';
import 'Employee Section.dart';

List<Map<String, dynamic>> adminLogin = [
  {"email": "hassan12rehan@gmail.com", "password": "12345"},
  {"email": "muhammadzaeem@gmail.com", "password": "1234"}
];

// ============================ Admin Section ===============================
adminBlock() {
  int option;
  while (true) {
    print("");
    print(" !=============== Admin Block =================! \n");
    print("For emplyee Section press 1 \n");
    print("For client Section press: 2 \n");
    print("For exit press: 0");
    option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      employeeSection();
    } else if (option == 2) {
      clientSection();
    } else if (option == 0) {
      false;
      break;
    } else {
      print("");
      print("Invalid Input");
    }
  }
}
