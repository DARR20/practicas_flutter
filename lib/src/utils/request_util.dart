// To parse this JSON data, do
//
//     final reqRespuesta = reqRespuestaFromJson(jsonString);

import 'dart:convert';

//para usar el data_privoder_alt ReqRespuesta debe ser "List<ReqRespuesta>"
ReqRespuesta reqRespuestaFromJson(String str) =>
    ReqRespuesta.fromJson(json.decode(str));

String reqRespuestaToJson(ReqRespuesta data) => json.encode(data.toJson());

//CLASE PRINCIPAL ReqRespuesta
class ReqRespuesta {
//Constructor
  ReqRespuesta({
    this.companyName,
    this.address,
    this.employees,
  });

//Declaración de variables
  String companyName;
  String address;
  List<ReqRespuestaEmployee> employees;

//Metodos Getter and Setter

  get getCompanyName => this.companyName;
  get getAddres => this.address;
  get getEmployees => this.employees;

  set setCompanyName(String value) => this.companyName = value;
  set setAddres(String value) => this.address = value;
  set setEmployees(List<ReqRespuestaEmployee> value) => this.employees = value;

//Extraer Datos
  factory ReqRespuesta.fromJson(Map<String, dynamic> json) => ReqRespuesta(
        companyName: json["company_name"],
        address: json["address"],
        employees: List<ReqRespuestaEmployee>.from(
            json["employees"].map((x) => ReqRespuestaEmployee.fromJson(x))),
      );

//Enviar Datos (No usado)
  Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "address": address,
        "employees": List<dynamic>.from(employees.map((x) => x.toJson())),
      };
}

//SEGUNDA CLASE ReqRespuestaEmployee
class ReqRespuestaEmployee {
//Constructor
  ReqRespuestaEmployee({
    this.id,
    this.name,
    this.position,
    this.wage,
    this.employees,
  });

//Declaración de variables
  int id;
  String name;
  String position;
  int wage;
  List<EmployeeEmployee> employees;

//Metodos Getter and Setter

  get getId => this.id;
  get getName => this.name;
  get getPosition => this.position;
  get getWage => this.wage;
  get getEmployees => this.employees;

  set setId(int value) => this.id = value;
  set setName(String value) => this.name = value;
  set setPosition(String value) => this.position = value;
  set setWage(int value) => this.wage = value;
  set setEmployees(List<EmployeeEmployee> value) => this.employees = value;

//Extraer Datos
  factory ReqRespuestaEmployee.fromJson(Map<String, dynamic> json) =>
      ReqRespuestaEmployee(
        id: json["id"],
        name: json["name"],
        position: json["position"],
        wage: json["wage"],
        employees: List<EmployeeEmployee>.from(
            json["employees"].map((x) => EmployeeEmployee.fromJson(x))),
      );

//Enviar Datos
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "wage": wage,
        "employees": List<dynamic>.from(employees.map((x) => x.toJson())),
      };
}

//TERCERA CLASE EmployeeEmployee
class EmployeeEmployee {
//Constructor
  EmployeeEmployee({
    this.id,
    this.name,
  });

//Declaración de Variables
  int id;
  String name;

//Metodos Getter and Setter
  get getId => this.id;
  get getName => this.name;

  set setId(int value) => this.id = value;
  set setName(String value) => this.name = value;

//Extraer Datos
  factory EmployeeEmployee.fromJson(Map<String, dynamic> json) =>
      EmployeeEmployee(
        id: json["id"],
        name: json["name"],
      );

//Enviar Datos
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
