import 'dart:io';
import 'Client Section.dart';

List<Map<String, dynamic>> employeesDetails = [];
List<Map<String, dynamic>> employeeLogin = [];

//====================== Employee Section ===================================

employeeSection() {
  int option;
  while (true) {
    print("");
    print(" !=============== Employee Section =================!");
    print("For add emplyee press 1 \n");
    print("For display Employee press: 2 \n");
    print("For remove Employee press: 3 \n");
    print("For update Employee press: 4 \n");
    print("For display Employee's Loggin Details press: 5 \n");
    print("For exit press: 0");
    option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      addEmployee();
    } else if (option == 2) {
      displayEmployee();
    } else if (option == 3) {
      removeEmployee();
    } else if (option == 4) {
      updateEmployee();
    } else if (option == 5) {
      displayEmployeeLogin();
    } else if (option == 0) {
      false;
      break;
    } else {
      print("");
      print("Invalid Input");
    }
  }
}

//=========== Add Employee ========
addEmployee() {
  print("");
  print("%============ Add Employee=======% \n");

  int? eId;
  bool isUnique = false;
  while (!isUnique) {
    stdout.write("Enter Employee id! Should be unique , in number: ");
    eId = int.parse(stdin.readLineSync()!);

    isUnique = true;

    for (var i = 0; i < employeesDetails.length; i++) {
      if (eId == employeesDetails[i]["id"]) {
        print("$eId is already exist! try another one");
        isUnique = false;
        break;
      }
    }
  }

  stdout.write("Enter Employee name: ");
  String eName = stdin.readLineSync()!;

  stdout.write("Enter Employee number: ");
  int ePhoneNumber = int.parse(stdin.readLineSync()!);

  stdout.write("Enter Employee email: ");
  String eEmail = stdin.readLineSync()!;

  stdout.write("Enter employee password: ");
  String ePassword = stdin.readLineSync()!;

  Map<String, dynamic> empDetail = {
    "id": eId,
    "name": eName,
    "phone": ePhoneNumber,
    "email": eEmail
  };

  Map<String, dynamic> empLogin = {
    "id": eId,
    "email": eEmail,
    "password": ePassword
  };

  employeesDetails.add(empDetail);
  employeeLogin.add(empLogin);
  print("");
  print("Employee Added Successfully");
}

//======= display Employee =========
displayEmployee() {
  print("");
  print("   !========= Displaying Employee/s ==========!");
  while (true) {
    if (employeesDetails.isEmpty) {
      print("No Employee found");
      break;
    }
    print("");
    print("Display only one Employee press: 1");
    print("Display all Employee press: 2");
    print("For exit press: 0");
    int option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      print("");
      bool idExist = false;
      stdout.write("Enter client id: ");
      int id = int.parse(stdin.readLineSync()!);
      for (var i = 0; i < employeesDetails.length; i++) {
        print("");
        if (id == clients[i]["id"]) {
          idExist = true;
          print("Employee id: ${employeesDetails[i]["id"]}");
          print("Employee name: ${employeesDetails[i]["name"]}");
          print("Employee email: ${employeesDetails[i]["email"]}");
          print("Employee number: ${employeesDetails[i]["phone"]}");
          break;
        }
      }
      if (!idExist) {
        print("Invalid id or this id does not exist ");
      }
    } else if (option == 2) {
      for (var i = 0; i < employeesDetails.length; i++) {
        print("Employee id: ${employeesDetails[i]["id"]}");
        print("Employee name: ${employeesDetails[i]["name"]}");
        print("Employee email: ${employeesDetails[i]["email"]}");
        print("Employee number: ${employeesDetails[i]["phone"]}");
        print("");
      }
    } else if (option == 0) {
      print("Exiting....");
      break;
    } else {
      print("Invalid input");
    }
  }
}

//=========remove Employee===========

removeEmployee() {
  print("");
  print("  !========== Removing Employee ==========!");
  print("");
  if (employeesDetails.isEmpty) {
    print("No Emloyee found to remove");
  } else {
    print("Remove all or only 1 ?");
    print("");
    stdout.write("1 for Remove all or 2 for only one: ");
    int option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      employeesDetails.clear();
      employeeLogin.clear();
      print("All employee remove successfully");
    } else {
      stdout.write("Enter employee id, Who you want to remove: ");
      int id = int.parse(stdin.readLineSync()!);

      bool idExist = false;

      for (var i = 0; i < employeesDetails.length; i++) {
        if (id == employeesDetails[i]["id"]) {
          idExist = true;
          employeesDetails.removeWhere((value) => value["id"] == id);
          for (var i = 0; i < employeeLogin.length; i++) {
            employeeLogin.removeWhere((value) => value["id"] == id);
          }
          print("");
          print("Employee and Employee's loggin details remove successfully");
        }
      }
      if (!idExist) {
        print("");
        print("$id: id Does not exist!");
      }
    }
  }
}

//========update Employee=========

updateEmployee() {
  print("");
  print("   !========= Updatinging Employee ==========!");
  print("Displaying data before update!");
  displayEmployee();
  while (true) {
    if (employeesDetails.isEmpty) {
      print("Can't update empty list");
      break;
    } else {
      print("");
      print("Do you want to update Employee ? (yes/no)");
      String option = stdin.readLineSync()!;
      if (option == "yes" || option == "Yes") {
        print("Edit Email or phone");
        print("For email: 1");
        print("For number: 2");
        print("For password: 3");
        int options = int.parse(stdin.readLineSync()!);
        if (options == 1) {
          print("/Editing Email/");
          stdout.write("Enter Employee id: ");
          int id = int.parse(stdin.readLineSync()!);
          for (var i = 0; i < employeesDetails.length; i++) {
            if (id == employeesDetails[i]["id"]) {
              stdout.write("Enter New email: ");
              String email = stdin.readLineSync()!;
              employeesDetails[i]["email"] = email;
              print("Email updated Successfully!");
              break;
            }
            if (id != employeesDetails[i]["id"]) {
              print("$id does not exist");
              break;
            }
          }
        } else if (options == 2) {
          print("/Editing Number/");
          print("");
          stdout.write("Enter Employee id: ");
          int id = int.parse(stdin.readLineSync()!);
          for (var i = 0; i < employeesDetails.length; i++) {
            if (id == employeesDetails[i]["id"]) {
              stdout.write("Enter New number: ");
              int number = int.parse(stdin.readLineSync()!);
              employeesDetails[i]["phone"] = number;
              print("Number updated Successfully!");
              break;
            }
            if (id != employeesDetails[i]["id"]) {
              print("$id does not exist");
              break;
            }
          }
        } else if (options == 3) {
          print("/Changing password/");
          print("");
          stdout.write("Enter Employee id: ");
          int id = int.parse(stdin.readLineSync()!);
          for (var i = 0; i < employeesDetails.length; i++) {
            if (id == employeesDetails[i]["id"]) {
              stdout.write("Enter New password: ");
              String password = stdin.readLineSync()!;
              employeesDetails[i]["password"] = password;
              print("password updated Successfully!");
              break;
            }
            if (id != employeesDetails[i]["id"]) {
              print("$id does not exist");
              break;
            }
          }
        } else {
          print("Invalid input");
        }
      } else {
        false;
        break;
      }
    }
  }
}

//========display client project=========

displayEmployeeLogin() {
  print("");
  print("   !========= Displaying Employee Login ==========!");
  while (true) {
    if (employeeLogin.isEmpty) {
      print("No Employee found");
      break;
    }
    print("");
    print("Display only one Employee Login Details press: 1");
    print("Display all Employee Login Details press: 2");
    print("for exit press: 0");
    int option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      bool idExist = false;
      print("");
      stdout.write("Enter client id: ");
      int id = int.parse(stdin.readLineSync()!);
      for (var i = 0; i < employeeLogin.length; i++) {
        print("");
        if (id == employeeLogin[i]["id"]) {
          idExist = true;
          print("Enmployee id: ${employeeLogin[i]["id"]}");
          print("Enmployee email: ${employeeLogin[i]["email"]}");
          print("Enmployee password: ${employeeLogin[i]["password"]}");
          break;
        }
      }
      if (!idExist) {
        print("Invalid id or this id does not exist ");
      }
    } else if (option == 2) {
      print("");
      for (var i = 0; i < employeeLogin.length; i++) {
        print("Enmployee id: ${employeeLogin[i]["id"]}");
        print("Enmployee email: ${employeeLogin[i]["email"]}");
        print("Enmployee password: ${employeeLogin[i]["password"]}");
        print("");
      }
    } else if (option == 0) {
      false;
      break;
    } else {
      print("Invalid input");
    }
  }
}

//===================== For Employee ========================

employeeAccess() {
  print("============== Employee Access ============= \n");
  while (true) {
    print("1 for client data");
    print("2 for client's project");
    print("0 for Exit");
    int option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      displayClient();
    } else if (option == 2) {
      displayClientProject();
    } else if (option == 0) {
      print("Exiting....");
      break;
    } else {
      print("Invalid option");
    }
  }
}
