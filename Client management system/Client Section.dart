import 'dart:io';

List<Map<String, dynamic>> clients = [];
List<Map<String, dynamic>> clientsProjects = [];
//============================ Client Section =================================

clientSection() {
  int option;
  while (true) {
    print("");
    print(" !=============== Client Section  =================! \n");
    print("For add client press: 1 \n");
    print("For display client press: 2 \n");
    print("For remove client press: 3 \n");
    print("For update Client press: 4 \n");
    print("For display Client's project press: 5 \n");
    print("For update Client's project press: 6 \n");
    print("For exit press: 0");
    option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      addClient();
    } else if (option == 2) {
      displayClient();
    } else if (option == 3) {
      removeClient();
    } else if (option == 4) {
      updateClient();
    } else if (option == 5) {
      displayClientProject();
    } else if (option == 6) {
      updateClientProject();
    } else if (option == 0) {
      false;
      break;
    } else {
      print("");
      print("Invalid Input");
    }
  }
}

//========Add Client==========
addClient() {
  print("");
  print("   !========= Adding Client ==========! \n");
  int? cId;
  bool isUnique = false;
  while (!isUnique) {
    stdout.write("Enter client id! should be unique in numbers: ");
    cId = int.parse(stdin.readLineSync()!);

    isUnique = true;

    for (var i = 0; i < clients.length; i++) {
      if (cId == clients[i]["id"]) {
        print("$cId is already exist!");
        isUnique = false;
        break;
      }
    }
  }

  stdout.write("Enter client name: ");
  String cName = stdin.readLineSync()!;

  stdout.write("Enter client email: ");
  String cEmail = stdin.readLineSync()!;

  stdout.write("Enter client phone number: ");
  int cNumber = int.parse(stdin.readLineSync()!);

  stdout.write("Enter client's project: ");
  String cProject = stdin.readLineSync()!;

  Map<String, dynamic> client = {
    "id": cId,
    "name": cName,
    "email": cEmail,
    "number": cNumber
  };

  Map<String, dynamic> clientProjects = {
    "id": cId,
    "name": cName,
    "project": cProject,
    "status": "Pending"
  };

  clients.add(client);
  clientsProjects.add(clientProjects);
  print("");
  print("Client added Successfully");
  print("");
}

//=======display client=========
displayClient() {
  print("");
  print("   !========= Displaying Client/s ==========! \n");
  while (true) {
    if (clients.isEmpty) {
      print(" \nNo client found \n");
      break;
    }
    print("");
    print("Display only one Client press: 1");
    print("Display all Clients press: 2");
    print("For exit press: 0");
    int option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      print("");
      bool idExist = false;
      stdout.write("Enter client id: ");
      int id = int.parse(stdin.readLineSync()!);
      for (var i = 0; i < clients.length; i++) {
        print("");
        if (id == clients[i]["id"]) {
          idExist = true;
          print("Client id: ${clients[i]["id"]}");
          print("Client name: ${clients[i]["name"]}");
          print("Client email: ${clients[i]["email"]}");
          print("Client number: ${clients[i]["number"]}");
          break;
        }
      }
      if (!idExist) {
        print("Invalid id or this id does not exist ");
      }
    } else if (option == 2) {
      for (var i = 0; i < clients.length; i++) {
        print("");
        print("Client id: ${clients[i]["id"]}");
        print("Client name: ${clients[i]["name"]}");
        print("Client email: ${clients[i]["email"]}");
        print("Client number: ${clients[i]["number"]}");
      }
    } else if (option == 0) {
      print("");
      print("Exiting....");
      break;
    } else {
      print("");
      print("Invalid input");
    }
  }
}

//========display client project=========

displayClientProject() {
  print("");
  print("   !========= Displaying Client's project ==========! \n");
  while (true) {
    if (clientsProjects.isEmpty) {
      print("No client found");
      break;
    }
    print("");
    print("Display only one Client' project press: 1");
    print("Display all Client's projetcs press: 2");
    print("for exit press: 0");
    int option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      bool idExist = false;
      print("");
      stdout.write("Enter client id: ");
      int id = int.parse(stdin.readLineSync()!);
      for (var i = 0; i < clientsProjects.length; i++) {
        print("");
        if (id == clientsProjects[i]["id"]) {
          idExist = true;
          print("Client id: ${clientsProjects[i]["id"]}");
          print("Client name: ${clientsProjects[i]["name"]}");
          print("Client project: ${clientsProjects[i]["project"]}");
          print("Client project status: ${clientsProjects[i]["status"]}");
          break;
        }
      }
      if (!idExist) {
        print("Invalid id or this id does not exist ");
      }
    } else if (option == 2) {
      print("");
      for (var i = 0; i < clientsProjects.length; i++) {
        print("");
        print("Client id: ${clientsProjects[i]["id"]}");
        print("Client name: ${clientsProjects[i]["name"]}");
        print("Client project: ${clientsProjects[i]["project"]}");
        print("Client project status: ${clientsProjects[i]["status"]}");
      }
    } else if (option == 0) {
      false;
      break;
    } else {
      print("");
      print("Invalid input");
    }
  }
}

//=========remove client===========

removeClient() {
  print("");
  print("  !========== Removing Client ==========!");
  print("");
  if (clients.isEmpty) {
    print("No Client found to remove");
  } else {
    print("Remove all or only 1 ?");
    print("");
    stdout.write("1 for Remove all or 2 for only one: ");
    int option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      clients.clear();
      clientsProjects.clear();
      print("");
      print("All clients remove successfully");
    } else {
      stdout.write("Enter client id, who you want to remove: ");
      int id = int.parse(stdin.readLineSync()!);

      bool idExist = false;

      for (var i = 0; i < clients.length; i++) {
        if (id == clients[i]["id"]) {
          idExist = true;
          clients.removeWhere((value) => value["id"] == id);
          for (var i = 0; i < clientsProjects.length; i++) {
            clientsProjects.removeWhere((value) => value["id"] == id);
          }
          print("");
          print("Client and client's project remove successfully");
        }
      }
      if (!idExist) {
        print("");
        print("$id: id Does not exist!");
      }
    }
  }
}

//========update client=========

updateClient() {
  print("");
  print("   !========= Updatinging Client ==========! \n");
  print("Displaying data before update! \n");
  displayClient();
  while (true) {
    if (clients.isEmpty) {
      print("Can't update empty list");
      break;
    } else {
      print("");
      print("Do you want to update client ? (yes/no) \n");
      String option = stdin.readLineSync()!;
      if (option == "yes" || option == "Yes") {
        print("Edit Email or phone");
        print("For email: 1");
        print("For number: 2");
        int options = int.parse(stdin.readLineSync()!);
        if (options == 1) {
          print("/Editing Email/ \n");
          stdout.write("Enter Client id: ");
          int id = int.parse(stdin.readLineSync()!);
          for (var i = 0; i < clients.length; i++) {
            if (id == clients[i]["id"]) {
              stdout.write("Enter New email: ");
              String email = stdin.readLineSync()!;
              clients[i]["email"] = email;
              print("");
              print("Email updated Successfully!");
              break;
            }
            if (id != clients[i]["id"]) {
              print("");
              print("$id does not exist");
              break;
            }
          }
        } else if (options == 2) {
          print("/Editing Number/ \n");
          print("");
          stdout.write("Enter Client id: ");
          int id = int.parse(stdin.readLineSync()!);
          for (var i = 0; i < clients.length; i++) {
            if (id == clients[i]["id"]) {
              stdout.write("Enter New number: ");
              int number = int.parse(stdin.readLineSync()!);
              clients[i]["number"] = number;
              print("");
              print("Number updated Successfully!");
              break;
            }
            if (id != clients[i]["id"]) {
              print("");
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

//========update client's project=========

updateClientProject() {
  print("");
  print("   !========= Updatinging Client's prject ==========!");
  print("Displaying data before update!");
  displayClientProject();
  while (true) {
    if (clientsProjects.isEmpty) {
      print("Can't update empty list");
      break;
    } else {
      print("");
      print("Do you want to update client project ? (yes/no)");
      String option = stdin.readLineSync()!;
      if (option == "yes" || option == "Yes") {
        print("Edit project or status");
        print("For project: 1");
        print("For status: 2");
        int options = int.parse(stdin.readLineSync()!);
        if (options == 1) {
          print("/Editing project/");
          stdout.write("Enter Client id: ");
          int id = int.parse(stdin.readLineSync()!);
          for (var i = 0; i < clientsProjects.length; i++) {
            if (id == clientsProjects[i]["id"]) {
              stdout.write("Enter update project: ");
              String project = stdin.readLineSync()!;
              clientsProjects[i]["project"] = project;
              print("project updated Successfully!");
              break;
            }
            if (id != clientsProjects[i]["id"]) {
              print("$id does not exist");
              break;
            }
          }
        } else if (options == 2) {
          print("/Editing status/");
          print("");
          stdout.write("Enter Client id: ");
          int id = int.parse(stdin.readLineSync()!);
          for (var i = 0; i < clientsProjects.length; i++) {
            if (id == clientsProjects[i]["id"]) {
              stdout.write("Update status: ");
              String status = stdin.readLineSync()!;
              clientsProjects[i]["status"] = status;
              print("status updated Successfully!");
              break;
            }
            if (id != clientsProjects[i]["id"]) {
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
