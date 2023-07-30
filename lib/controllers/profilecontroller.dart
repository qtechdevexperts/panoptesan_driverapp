import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:panoptesan_alpha/models/packagemodel.dart';

import '../helpers/dialog/src/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:http/http.dart' as http;
import 'package:panoptesan_alpha/helpers/api-constants.dart';
import 'package:panoptesan_alpha/helpers/localstorage.dart';

import '../helpers/snackbar.dart';
import '../models/notificationmodel.dart';
import '../models/profile-model.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit

    fetchnotifications();
    super.onInit();
  }

  List<String> models = [];
  var selected;
  var profilebrand;
  var profilemodel;

  var car_brands_cars = {
    'Acura': [
      'Acura ILX',
      'Acura Integra',
      'Acura MDX',
      'Acura NSX',
      'Acura RDX',
      'Acura RLX',
      'Acura TLX'
    ],
    'Alfa Romeo': [
      'Alfa Romeo 4C',
      'Alfa Romeo Giulia',
      'Alfa Romeo Stelvio',
      'Alfa Romeo Tonale'
    ],
    'Audi': [
      'Audi A3',
      'Audi A4',
      'Audi A5',
      'Audi A6',
      'Audi A7',
      'Audi A8',
      'Audi e-Tron GT',
      'Audi e-Tron Sportback',
      'Audi eTron',
      'Audi Q3',
      'Audi Q4 e-tron',
      'Audi Q4 e-tron Sportback',
      'Audi Q5',
      'Audi Q7',
      'Audi Q8',
      'Audi Q8 e-Tron',
      'Audi Q8 Sportback e-tron',
      'Audi R8',
      'Audi TT'
    ],
    'BMW': [
      'BMW 2-Series',
      'BMW 3-Series',
      'BMW 4-Series',
      'BMW 5-Series',
      'BMW 6-Series',
      'BMW 7-Series',
      'BMW 8-Series',
      'BMW i3',
      'BMW i8',
      'BMW iX',
      'BMW X1',
      'BMW X2',
      'BMW X3',
      'BMW X4',
      'BMW X5',
      'BMW X6',
      'BMW X7',
      'BMW XM',
      'BMW Z4'
    ],
    'Buick': [
      'Buick Enclave',
      'Buick Encore',
      'Buick Encore GX',
      'Buick Envision',
      'Buick LaCrosse',
      'Buick Regal'
    ],
    'Cadillac': [
      'Cadillac CT4',
      'Cadillac CT5',
      'Cadillac CT6',
      'Cadillac CTS',
      'Cadillac Escalade',
      'Cadillac Lyriq',
      'Cadillac XT4',
      'Cadillac XT5',
      'Cadillac XT6'
    ],
    'Chevrolet': [
      'Chevrolet Blazer',
      'Chevrolet Bolt',
      'Chevrolet Camaro',
      'Chevrolet Colorado',
      'Chevrolet Corvette',
      'Chevrolet Equinox',
      'Chevrolet Express',
      'Chevrolet Impala',
      'Chevrolet Malibu',
      'Chevrolet Silverado',
      'Chevrolet Sonic',
      'Chevrolet Spark',
      'Chevrolet Suburban',
      'Chevrolet Tahoe',
      'Chevrolet TrailBlazer',
      'Chevrolet Traverse',
      'Chevrolet Trax'
    ],
    'Chrysler': [
      'Chrysler 200',
      'Chrysler 300',
      'Chrysler Pacifica',
      'Chrysler Town and Country'
    ],
    'Dodge': [
      'Dodge Challenger',
      'Dodge Charger',
      'Dodge Dart',
      'Dodge Durango',
      'Dodge Grand Caravan',
      'Dodge Hornet',
      'Dodge Journey',
      'Dodge Viper'
    ],
    'Fiat': ['Fiat 124 Spider', 'Fiat 500', 'Fiat 500L', 'Fiat 500X'],
    'Ford': [
      'Ford Bronco',
      'Ford Bronco Sport',
      'Ford E-Series',
      'Ford EcoSport',
      'Ford Edge',
      'Ford Escape',
      'Ford Expedition',
      'Ford Explorer',
      'Ford F-Series',
      'Ford Fusion',
      'Ford GT',
      'Ford Maverick',
      'Ford Mustang',
      'Ford Mustang Mach E',
      'Ford Ranger',
      'Ford Transit',
      'Ford Transit Connect'
    ],
    'Genesis': [
      'Genesis G70',
      'Genesis G80',
      'Genesis G90',
      'Genesis GV60',
      'Genesis GV70',
      'Genesis GV80'
    ],
    'GMC': [
      'GMC Acadia',
      'GMC Canyon',
      'GMC Hummer EV',
      'GMC Savana',
      'GMC Sierra',
      'GMC Terrain',
      'GMC Yukon'
    ],
    'Honda': [
      'Honda Accord',
      'Honda Civic',
      'Honda Clarity FCV',
      'Honda CR-V',
      'Honda Fit',
      'Honda HR-V',
      'Honda Insight',
      'Honda Odyssey',
      'Honda Passport',
      'Honda Pilot',
      'Honda Ridgeline'
    ],
    'Hyundai': [
      'Hyundai Accent',
      'Hyundai Elantra',
      'Hyundai Ioniq',
      'Hyundai Ioniq 5',
      'Hyundai Ioniq 6',
      'Hyundai Kona',
      'Hyundai Nexo',
      'Hyundai Palisade',
      'Hyundai Santa Cruz',
      'Hyundai Santa Fe',
      'Hyundai Sonata',
      'Hyundai Tuscon',
      'Hyundai Veloster',
      'Hyundai Venue'
    ],
    'Infiniti': [
      'Infiniti Q50',
      'Infiniti Q60',
      'Infiniti QX50',
      'Infiniti QX55',
      'Infiniti QX60',
      'Infiniti QX80'
    ],
    'Jaguar': [
      'Jaguar E-Pace',
      'Jaguar F-Pace',
      'Jaguar F-Type',
      'Jaguar I-Pace',
      'Jaguar XE',
      'Jaguar XF',
      'Jaguar XJ'
    ],
    'Jeep': [
      'Jeep Cherokee',
      'Jeep Compass',
      'Jeep Gladiator',
      'Jeep Grand Cherokee',
      'Jeep Grand Wagoneer',
      'Jeep Patriot',
      'Jeep Renegade',
      'Jeep Wagoneer',
      'Jeep Wrangler'
    ],
    'Karma': ['Karma GS-6', 'Karma Revero'],
    'Kia': [
      'Kia Cadenza',
      'Kia Carnival',
      'Kia EV6',
      'Kia Forte',
      'Kia K5',
      'Kia K900',
      'Kia Niro',
      'Kia Rio',
      'Kia Sedona',
      'Kia Seltos',
      'Kia Sorento',
      'Kia Soul',
      'Kia Sportage',
      'Kia Stinger',
      'Kia Telluride'
    ],
    'Land Rover': [
      'Land Rover Defender',
      'Land Rover Discovery / LR4',
      'Land Rover Discovery Sport',
      'Land Rover Range Rover',
      'Land Rover Range Rover Evoque',
      'Land Rover Range Rover Sport',
      'Land Rover Range Rover Velar'
    ],
    'Lexus': [
      'Lexus ES',
      'Lexus GS',
      'Lexus GX',
      'Lexus IS',
      'Lexus LC',
      'Lexus LS',
      'Lexus LX',
      'Lexus NX',
      'Lexus RC',
      'Lexus RX',
      'Lexus RZ',
      'Lexus UX'
    ],
    'Lincoln': [
      'Lincoln Aviator',
      'Lincoln Continental',
      'Lincoln Corsair / MKC',
      'Lincoln MKX/Nautilus',
      'Lincoln MKZ',
      'Lincoln Navigator'
    ],
    'Lucid Motors': ['Lucid Air'],
    'Mazda': [
      'Mazda 3',
      'Mazda 6',
      'Mazda CX-3',
      'Mazda CX-30',
      'Mazda CX-5',
      'Mazda CX-50',
      'Mazda CX-9',
      'Mazda CX-90',
      'Mazda MX-30',
      'Mazda MX-5 Miata'
    ],
    'Mercedes-Benz': [
      'Mercedes-Benz A-Class',
      'Mercedes-Benz AMG GT',
      'Mercedes-Benz C-Class',
      'Mercedes-Benz CLA-Class',
      'Mercedes-Benz E / CLS-Class',
      'Mercedes-Benz EQB',
      'Mercedes-Benz EQE',
      'Mercedes-Benz EQS SUV',
      'Mercedes-Benz EQS-Sedan',
      'Mercedes-Benz G-Class',
      'Mercedes-Benz GL/GLS-Class',
      'Mercedes-Benz GLA-Class',
      'Mercedes-Benz GLB',
      'Mercedes-Benz GLC/GLK-Class',
      'Mercedes-Benz GLE-Class',
      'Mercedes-Benz Metris',
      'Mercedes-Benz S-Class',
      'Mercedes-Benz SL-Class',
      'Mercedes-Benz SLC-Class',
      'Mercedes-Benz Sprinter'
    ],
    'Mini': ['Mini Cooper', 'Mini Countryman'],
    'Mitsubishi': [
      'Mitsubishi Eclipse Cross',
      'Mitsubishi Mirage',
      'Mitsubishi Outlander',
      'Mitsubishi Outlander PHEV',
      'Mitsubishi Outlander Sport'
    ],
    'Nissan': [
      'Nissan 370Z',
      'Nissan Altima',
      'Nissan Ariya',
      'Nissan Armada',
      'Nissan Frontier',
      'Nissan GT-R',
      'Nissan Kicks',
      'Nissan Leaf',
      'Nissan Maxima',
      'Nissan Murano',
      'Nissan NV',
      'Nissan NV200',
      'Nissan Pathfinder',
      'Nissan Rogue',
      'Nissan Sentra',
      'Nissan Titan',
      'Nissan Versa'
    ],
    'Polestar': ['Polestar Polestar 1', 'Polestar Polestar 2'],
    'Porsche': [
      'Porsche 718',
      'Porsche 911',
      'Porsche Cayenne',
      'Porsche Macan',
      'Porsche Panamera',
      'Porsche Taycan'
    ],
    'Ram': ['Ram Pickup', 'Ram ProMaster', 'Ram ProMaster City'],
    'Rivian': ['Rivian EDV700', 'Rivian R1S', 'Rivian R1T'],
    'Subaru': [
      'Subaru Ascent',
      'Subaru BRZ',
      'Subaru CrossTrek',
      'Subaru Forester',
      'Subaru Impreza',
      'Subaru Impreza WRX',
      'Subaru Legacy',
      'Subaru Outback',
      'Subaru Solterra'
    ],
    'Tesla': [
      'Tesla Model 3',
      'Tesla Model S',
      'Tesla Model X',
      'Tesla Model Y'
    ],
    'Toyota': [
      'Toyota 4Runner',
      'Toyota 86 / FR-S',
      'Toyota Avalon',
      'Toyota bZ4X',
      'Toyota C-HR',
      'Toyota Camry',
      'Toyota Corolla',
      'Toyota Corolla Cross',
      'Toyota Crown',
      'Toyota FJ Cruiser',
      'Toyota GR86',
      'Toyota Grand Highlander',
      'Toyota Highlander',
      'Toyota Land Cruiser',
      'Toyota Mirai',
      'Toyota Prius Family',
      'Toyota RAV4',
      'Toyota Sequoia',
      'Toyota Sienna',
      'Toyota Supra',
      'Toyota Tacoma',
      'Toyota Tundra',
      'Toyota Venza',
      'Toyota Yaris'
    ],
    'Volkswagen': [
      'Volkswagen Arteon',
      'Volkswagen Atlas',
      'Volkswagen Atlas Sport',
      'Volkswagen Golf',
      'Volkswagen ID.4',
      'Volkswagen Jetta',
      'Volkswagen Passat',
      'Volkswagen Taos',
      'Volkswagen Tiguan'
    ],
    'Volvo': [
      'Volvo 60-Series',
      'Volvo 90-Series',
      'Volvo C40',
      'Volvo XC40',
      'Volvo XC60',
      'Volvo XC90'
    ]
  };
  var car_brands = [
    'GMC',
    'Chevrolet',
    'Dodge',
    'Chrysler',
    'Buick',
    'Cadillac',
    'Jeep',
    'Ford',
    'Subaru',
    'Saturn',
    'Tesla',
    'Toyota',
    'KIA',
    'Lincoln',
    'Honda',
    'Oldsmobile',
    'Delorean',
    'Volvo',
    'Volkswagen',
    'Audi',
    'BMW',
    'Mitsubishi',
    'Bently',
    'Lexus',
    'Hyundai',
    'RAM',
    'Acura',
    'Aston Martin',
    'Bollinger Motors',
    'Bugatti',
    'Ferrari',
    'Fiat',
    'Hummer',
    'Infiniti',
    'Jaguar',
    'Lamborghini',
    'Land Rover',
    'Lotus',
    'Lucid Motors',
    'Maserati',
    'Mazda',
    'McLaren',
    'Mercedes - AMG',
    'Mercedes - Benz',
    'Mini',
    'Nissan',
    'Suzuki'
  ];

  List<Item> packages = [];
  File? file;
  TextEditingController name = new TextEditingController();
  TextEditingController desc = new TextEditingController();
  TextEditingController dob = new TextEditingController();
  TextEditingController gender = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController month = new TextEditingController();
  TextEditingController day = new TextEditingController();
  TextEditingController year = new TextEditingController();
  TextEditingController carmake = new TextEditingController();
  TextEditingController carname = new TextEditingController();
  TextEditingController model = new TextEditingController();
  TextEditingController drivinghabit = new TextEditingController();
  TextEditingController medicalconditions = new TextEditingController();
  TextEditingController medicalnotes = new TextEditingController();
  TextEditingController allergies = new TextEditingController();
  TextEditingController medications = new TextEditingController();
  TextEditingController organdonor = new TextEditingController();
  TextEditingController weight = new TextEditingController();
  TextEditingController height = new TextEditingController();
  TextEditingController emergencyname = new TextEditingController();
  TextEditingController emergencyrelationship = new TextEditingController();
  TextEditingController emergencycontactnumber = new TextEditingController();

  Profile? profile;

  List<NotificationModel> notificationList = [];
  Future<Profile> getprofile() async {
    var token = await LocalStorage.prefs?.getString("token");
    var headers = {'Authorization': 'Bearer $token'};
    var request =
        http.Request('GET', Uri.parse(ApiConstants.baseUrl + '/profile'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var jsonData = jsonDecode(result);

      var output = Profile.fromJson(jsonData["data"]);

      return output;
    } else {
      print(response.reasonPhrase);
      throw ("Error");
    }
  }

  setprofile() async {
    try {
      this.profile = await getprofile();
      this.desc.text = profile?.userDetail?.description ?? "";
      this.name.text = profile?.userDetail?.name ?? "";
      this.address.text = profile?.userDetail?.address ?? "";
      this.gender.text = profile?.userDetail?.gender ?? "";
      var list = profile?.userDetail?.dob?.split("-");
      this.carname.text = profile?.userDetail?.vehicleName ?? "";
      this.model.text = profile?.userDetail?.vehicleModel ?? "";

      this.carmake.text = profile?.userDetail?.vehicleMake ?? "";
      this.drivinghabit.text = profile?.userDetail?.drivingHabit ?? "";
      profilebrand = profile?.userDetail?.vehicleMake ?? null;
      try {
        this.models = car_brands_cars[this.carmake.text]!;
      } catch (e) {}

      profilemodel = profile?.userDetail?.vehicleModel ?? null;

      if (profilemodel == "") {
        profilemodel = null;
      }

      if (profilebrand == "") {
        profilebrand = null;
      }

      try {
        this.month.text = list![0].toString();
        this.day.text = list[1].toString();
        this.year.text = list[2].toString();
      } catch (e) {}

      update();
    } catch (e) {
      print(e);
    }
  }

  callgetprofile(context) async {
    ProgressDialog progressDialog = ProgressDialog(context,
        message: const Text("Please Wait....."), title: const Text("Loading"));
    progressDialog.show();
    try {
      this.profile = await getprofile();
      this.desc.text = profile?.userDetail?.description ?? "";
      this.name.text = profile?.userDetail?.name ?? "";
      this.address.text = profile?.userDetail?.address ?? "";
      this.gender.text = profile?.userDetail?.gender ?? "";
      this.carname.text = profile?.userDetail?.vehicleName ?? "";
      this.model.text = profile?.userDetail?.vehicleModel ?? "";
      var list = profile?.userDetail?.dob?.split("-");

      profilebrand = profile?.userDetail?.vehicleMake ?? null;

      try {
        this.models = car_brands_cars[this.carmake.text]!;
      } catch (e) {}

      profilemodel = profile?.userDetail?.vehicleModel ?? null;

      if (profilemodel == "") {
        profilemodel = null;
      }

      if (profilebrand == "") {
        profilebrand = null;
      }

      try {
        var dobtxt = profile?.userDetail?.dob;
        this.dob.text = dobtxt!;
        this.month.text = list![0].toString();
        this.day.text = list[1].toString();
        this.year.text = list[2].toString();
      } catch (e) {}

      progressDialog.dismiss();
      update();
    } catch (e) {
      progressDialog.dismiss();
      SnackbarWidget().showsnackbar(e.toString(), context);
    }
  }

  fetchnotifications() async {
    try {
      var token = await LocalStorage.prefs?.getString("token");
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET', Uri.parse(ApiConstants.baseUrl + '/notification'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var jsonData = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(jsonData);
        final data = decodedData['data'] as List<dynamic>;

        final List<NotificationModel> notificationList =
            data.map<NotificationModel>((item) {
          return NotificationModel.fromJson(item);
        }).toList();

        this.notificationList = notificationList;
        update();
      } else {
        throw (jsonData);
      }
    } catch (e) {}
  }

  Future<void> UpdateProfile(String name, String gender, String dob,
      String description, String address) async {
    var token = await LocalStorage.prefs?.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request(
        'PATCH', Uri.parse(ApiConstants.baseUrl + '/profile/update'));
    request.body = json.encode({
      "name": "$name",
      "gender": "$gender",
      "dob": "$dob",
      "description": "$description",
      "vehicle_name": this.carname.text,
      "vehicle_model": this.model.text,
      "vehicle_make": this.carmake.text,
      "driving_habit": this.drivinghabit.text,
      "medical_condition": this.medicalconditions.text,
      "medical_notes": this.medicalnotes.text,
      "medications": this.medications.text,
      "allergies": this.allergies.text,
      "organ_donor": this.organdonor.text,
      "weight": this.weight.text,
      "height": this.height.text,
      "address": "$address",
      "relationship": this.emergencyrelationship.text,
      "number": this.emergencycontactnumber.text
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      throw ("Error");
    }
  }

  setimage(File? file) async {
    var token = await LocalStorage.prefs?.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse(ApiConstants.baseUrl + '/upload?type=PROFILE'));
    request.files.add(await http.MultipartFile.fromPath('photo', file!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      throw ("Error");
    }
  }

  leavefleet(String userid) async {
    var token = await LocalStorage.prefs?.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request(
        'DELETE', Uri.parse(ApiConstants.baseUrl + '/remove/$userid'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      throw (response.reasonPhrase.toString());
    }
  }

  getpackages() async {
    var token = await LocalStorage.prefs?.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request =
        http.Request('GET', Uri.parse(ApiConstants.baseUrl + '/package'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var jsonData = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(jsonData);
      final data = decodedData['data'] as List<dynamic>;

      List<Item> videos =
          data.map((videoJson) => Item.fromJson(videoJson)).toList();

      this.packages = videos;
      update();
    } else {
      throw (jsonData);
    }
  }

  makepayment(String mpid, int amount) async {
    try {
      var token = await LocalStorage.prefs?.getString("token");
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'POST', Uri.parse(ApiConstants.baseUrl + '/stripe-purchase'));
      request.body = json.encode({"pmId": mpid, "amount": amount});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        throw (response.reasonPhrase.toString());
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  createcustomer(name, email) async {
    try {
      var data = {'name': name, 'email': email};
      Response response = await Dio().post(
        'https://api.stripe.com/v1/customers',
        data: data,
        options:
            Options(contentType: Headers.formUrlEncodedContentType, headers: {
          'Authorization':
              'Bearer sk_test_51NG3fqKsOuXXDZeS3dpErpgvFsDZH7QVZ7pnz9YUG94WOUdR25GkzE5EdpFiQ4xCUcEjaNb28ojjqEtWVUPLNgyn00X4yfukrj', // your secret key
        }),
      );

      return response.data;
    } catch (err) {
      throw ("failed to create customer");
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51NG3fqKsOuXXDZeS3dpErpgvFsDZH7QVZ7pnz9YUG94WOUdR25GkzE5EdpFiQ4xCUcEjaNb28ojjqEtWVUPLNgyn00X4yfukrj',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      throw Exception(json.decode(response.body));
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future subscription(String id) async {
    var token = await LocalStorage.prefs?.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request =
        http.Request('POST', Uri.parse(ApiConstants.baseUrl + '/purchase'));
    request.body = json.encode({"subscription": id});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      throw (response.reasonPhrase.toString());
    }
  }

  usernotifitcation(bool) async {
    int myIntValue = bool ? 1 : 0;
    var token = await LocalStorage.prefs?.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request(
        'PUT', Uri.parse(ApiConstants.baseUrl + '/notification/$myIntValue'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
