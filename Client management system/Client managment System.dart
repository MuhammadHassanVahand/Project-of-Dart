import 'dart:io';
import 'Employee Section.dart';
import 'Admin Section.dart';

void main() {
  int options;
  bool again = true;
  while (again) {
    print(
        "%=================== Welcom 2 Client Management System =====================% \n");
    print("");
    print("1 for admin login");
    print("2 for employee login");
    print("0 for exit \n");
    int option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      print("");
      print("Login As Admin");

      print("");
      stdout.write("Enter your email: ");
      String email = stdin.readLineSync()!;
      stdout.write("Enter your password: ");
      String password = stdin.readLineSync()!;

      bool logginSuccessful = false;

      for (var i = 0; i < adminLogin.length; i++) {
        if (email == adminLogin[i]["email"] &&
            password == adminLogin[i]["password"]) {
          logginSuccessful = true;
          print("");
          print("Login Successful!");
          print("");
          print("1 for admin");
          print("0 for exit");
          options = int.parse(stdin.readLineSync()!);
          if (options == 1) {
            adminBlock();
          } else if (options == 0) {
            break;
          }
        }
      }
      if (!logginSuccessful) {
        print("Incorrect Email or password! Try Again");
      }
    }
    if (option == 2) {
      if (employeeLogin.isEmpty) {
        print("\nNo employee found!\n");
      } else {
        print("");
        print("Login As Employee");

        print("");
        stdout.write("Enter your email: ");
        String email = stdin.readLineSync()!;
        stdout.write("Enter your password: ");
        String password = stdin.readLineSync()!;

        bool logginSuccessful = false;

        for (var i = 0; i < employeeLogin.length; i++) {
          if (email == employeeLogin[i]["email"] &&
              password == employeeLogin[i]["password"]) {
            logginSuccessful = true;
            print("");
            print("Login Successful!");
            print("");
            print("1 for Employee Section");
            print("0 for exit");
            options = int.parse(stdin.readLineSync()!);
            if (options == 1) {
              employeeAccess();
            } else if (options == 0) {
              break;
            }
          }
        }
        if (!logginSuccessful) {
          print("Incorrect Email or password! Try Again");
        }
      }
    } else if (option == 0) {
      again = false;
      break;
    } else {
      print("Invalid Input");
    }
  }
}
