import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/profilecontroller.dart';
import '../helpers/Colors.dart';
import '../helpers/alerts.dart';
import '../widgets/CustomButton.dart';
import 'MedicalDetails.dart';

class SetProfileScreen extends StatefulWidget {
  const SetProfileScreen({super.key});

  @override
  State<SetProfileScreen> createState() => _SetProfileScreenState();
}

class _SetProfileScreenState extends State<SetProfileScreen> {
  String dropdownValue = 'Ford';
  String dropdownValue1 = 'Pleasure Cruiser';

  List<String> models = [];
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

  var selected;

  var profilecontroller = Get.put(ProfileController());
  cameraimage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    if (file == null) return;
    setState(() {
      profilecontroller.file = File(file!.path);
    });
    // if (images.length < 10) {
    //   CroppedFile? croppedFile = await ImageCropper().cropImage(
    //     sourcePath: file!.path,
    //     aspectRatioPresets: [
    //       CropAspectRatioPreset.square,
    //       CropAspectRatioPreset.ratio4x3,
    //       CropAspectRatioPreset.original,
    //       CropAspectRatioPreset.ratio5x4,
    //       CropAspectRatioPreset.ratio16x9,
    //     ],

    //     compressQuality: 100,
    //     compressFormat: ImageCompressFormat.jpg,

    //     // aspectRatio: CropAspectRatio(

    //     //     ratioX: 900, ratioY: 1600),

    //     uiSettings: [
    //       IOSUiSettings(aspectRatioLockEnabled: true, title: 'CropImage'),
    //       AndroidUiSettings(
    //           toolbarTitle: 'CropImage',
    //           toolbarColor: Colors.white,
    //           toolbarWidgetColor: Colors.black,
    //           initAspectRatio: CropAspectRatioPreset.original,
    //           lockAspectRatio: true),
    //     ],
    //   );

    //   if (croppedFile != null) {
    //     var file1 = XFile(croppedFile.path);

    //     images.add(file1);
    //     imagepicked = true;

    //     notifyListeners();
    //   } else {}
    // }
  }

  galleryimage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    setState(() {
      profilecontroller.file = File(file!.path);
    });
    // if (images.length < 10) {
    //   CroppedFile? croppedFile = await ImageCropper().cropImage(
    //     sourcePath: file!.path,
    //     aspectRatioPresets: [
    //       CropAspectRatioPreset.square,
    //       CropAspectRatioPreset.ratio4x3,
    //       CropAspectRatioPreset.original,
    //       CropAspectRatioPreset.ratio5x4,
    //       CropAspectRatioPreset.ratio16x9,
    //     ],

    //     compressQuality: 100,
    //     compressFormat: ImageCompressFormat.jpg,

    //     // aspectRatio: CropAspectRatio(

    //     //     ratioX: 900, ratioY: 1600),

    //     uiSettings: [
    //       IOSUiSettings(aspectRatioLockEnabled: true, title: 'CropImage'),
    //       AndroidUiSettings(
    //           toolbarTitle: 'CropImage',
    //           toolbarColor: Colors.white,
    //           toolbarWidgetColor: Colors.black,
    //           initAspectRatio: CropAspectRatioPreset.original,
    //           lockAspectRatio: true),
    //     ],
    //   );

    //   if (croppedFile != null) {
    //     var file1 = XFile(croppedFile.path);

    //     images.add(file1);
    //     imagepicked = true;

    //     notifyListeners();
    //   } else {}
    // }
  }

  Future<void> showChoiceDialoglistimagemore(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return true;
            },
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              title: const Text(
                "Add photos from",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  // color: pinkish,
                ),
              ),
              content: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: ListBody(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () async {
                          await galleryimage(context);
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0)),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                )),
                            child: ListTile(
                              // leading:
                              title: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    CupertinoIcons.photo_on_rectangle,
                                    color: Colors.pink,
                                  ),
                                  Text(
                                    "   Gallery",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      // color: pinkish,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await cameraimage(context);
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0)),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                )),
                            child: ListTile(
                              title: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    CupertinoIcons.camera,
                                    color: Colors.pink,
                                  ),
                                  Text(
                                    "   Camera",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      // color: pinkish,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F1FE),
      appBar: AppBar(
        leadingWidth: 70,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            splashColor: Colors.white, // Customize the ripple effect color
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFF0A7FB8),
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Set Profile',
          style: appbarstyle,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Padding(
          padding: horizontal20Padding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                30.verticalSpace,
                profilecontroller.file == null
                    ? GestureDetector(
                        onTap: () async {
                          await showChoiceDialoglistimagemore(context);
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 115,
                                  width: 115,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(userimages[1]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 10,
                                  child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: bprimary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: white,
                                          size: 15,
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 115,
                                width: 115,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: FileImage(
                                        File(profilecontroller.file!.path)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 10,
                                child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: bprimary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.plus,
                                        color: white,
                                        size: 15,
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                15.verticalSpace,
                Text("Name",
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: black)),
                10.verticalSpace,
                TextFormField(
                  controller: profilecontroller.name,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    hintText: 'Type your full name...',
                    hintStyle: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                  ),
                ),
                20.verticalSpace,
                Text("About yourself",
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: black)),
                10.verticalSpace,
                TextFormField(
                  controller: profilecontroller.desc,
                  maxLines: 4,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    hintText: 'Write something about yourself...',
                    hintStyle: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                  ),
                ),
                20.verticalSpace,
                Text("Date of Birth",
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: black)),
                10.verticalSpace,
                TextFormField(
                  onTap: () async {
                    var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2005),
                      firstDate: DateTime(1940),
                      lastDate: DateTime(2005),
                    );
                    if (date != null) {
                      profilecontroller.month.text = date.month.toString();
                      profilecontroller.day.text = date.day.toString();
                      profilecontroller.year.text = date.year.toString();
                      profilecontroller.dob.text =
                          profilecontroller.month.text +
                              "-" +
                              profilecontroller.day.text +
                              "-" +
                              profilecontroller.year.text;
                    }
                  },
                  readOnly: true,
                  controller: profilecontroller.dob,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    hintText: 'Please date of birth',
                    hintStyle: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                  ),
                ),
                // Row(
                //   children: [
                //     // Expanded(
                //     //   child: DropdownButtonFormField<String>(
                //     //     icon: FaIcon(
                //     //       Icons.keyboard_arrow_down_rounded,
                //     //       color: grey,
                //     //       size: 20,
                //     //     ),
                //     //     value: null,
                //     //     onChanged: (newValue) {
                //     //       profilecontroller.month.text = newValue!;
                //     //     },
                //     //     items: <String>[
                //     //       '1',
                //     //       '2',
                //     //       '3',
                //     //       '4',
                //     //       '5',
                //     //       '6',
                //     //       '7',
                //     //       '8',
                //     //       '9',
                //     //       '10',
                //     //       '11',
                //     //       '12',
                //     //     ].map<DropdownMenuItem<String>>((String value) {
                //     //       return DropdownMenuItem<String>(
                //     //         value: value,
                //     //         child: Text(value),
                //     //       );
                //     //     }).toList(),
                //     //     decoration: InputDecoration(
                //     //       contentPadding: EdgeInsets.only(left: 20, right: 20),
                //     //       filled: true,
                //     //       fillColor: white,
                //     //       hintText: 'Month',
                //     //       hintStyle: GoogleFonts.inter(
                //     //         fontSize: 12,
                //     //         fontWeight: FontWeight.w300,
                //     //         color: grey,
                //     //       ),
                //     //       border: OutlineInputBorder(
                //     //         borderRadius: BorderRadius.circular(30),
                //     //         borderSide: BorderSide.none,
                //     //       ),
                //     //     ),
                //     //   ),
                //     // ),
                //     // 20.horizontalSpace,
                //     // Expanded(
                //     //   child: DropdownButtonFormField<String>(
                //     //     icon: FaIcon(
                //     //       Icons.keyboard_arrow_down_rounded,
                //     //       color: grey,
                //     //       size: 20,
                //     //     ),

                //     //     //isExpanded: true,
                //     //     value: null,
                //     //     onChanged: (newValue) {
                //     //       profilecontroller.day.text = newValue!;
                //     //     },
                //     //     items: <String>[
                //     //       '1',
                //     //       '2',
                //     //       '3',
                //     //       '4',
                //     //       '5',
                //     //       '6',
                //     //       '7',
                //     //       '8',
                //     //       '9',
                //     //       '10',
                //     //       '11',
                //     //       '12',
                //     //       '13',
                //     //       '14',
                //     //       '15',
                //     //       '16',
                //     //       '17',
                //     //       '18',
                //     //       '19',
                //     //       '20',
                //     //       '21',
                //     //       '22',
                //     //       '23',
                //     //       '24',
                //     //       '25',
                //     //       '26',
                //     //       '27',
                //     //       '28',
                //     //       '29',
                //     //       '30',
                //     //       '31',
                //     //     ].map<DropdownMenuItem<String>>((String value) {
                //     //       return DropdownMenuItem<String>(
                //     //         value: value,
                //     //         child: Text(value),
                //     //       );
                //     //     }).toList(),
                //     //     decoration: InputDecoration(
                //     //       contentPadding: EdgeInsets.only(left: 30, right: 20),
                //     //       filled: true,
                //     //       fillColor: white,
                //     //       hintText: 'Day',
                //     //       hintStyle: GoogleFonts.inter(
                //     //         fontSize: 12,
                //     //         fontWeight: FontWeight.w300,
                //     //         color: grey,
                //     //       ),
                //     //       border: OutlineInputBorder(
                //     //         borderRadius: BorderRadius.circular(30),
                //     //         borderSide: BorderSide.none,
                //     //       ),
                //     //     ),
                //     //   ),
                //     // ),
                //     // 20.horizontalSpace,
                //     // Expanded(
                //     //   child: DropdownButtonFormField<String>(
                //     //     value: null,
                //     //     icon: FaIcon(
                //     //       Icons.keyboard_arrow_down_rounded,
                //     //       color: grey,
                //     //       size: 20,
                //     //     ),
                //     //     onChanged: (newValue) {
                //     //       profilecontroller.year.text = newValue!;
                //     //     },
                //     //     items: <String>['1998', '1997']
                //     //         .map<DropdownMenuItem<String>>((String value) {
                //     //       return DropdownMenuItem<String>(
                //     //         value: value,
                //     //         child: Text(value),
                //     //       );
                //     //     }).toList(),
                //     //     decoration: InputDecoration(
                //     //       contentPadding: EdgeInsets.only(left: 30, right: 20),
                //     //       filled: true,
                //     //       fillColor: white,
                //     //       hintText: 'Year',
                //     //       hintStyle: GoogleFonts.inter(
                //     //         fontSize: 12,
                //     //         fontWeight: FontWeight.w300,
                //     //         color: grey,
                //     //       ),
                //     //       border: OutlineInputBorder(
                //     //         borderRadius: BorderRadius.circular(30),
                //     //         borderSide: BorderSide.none,
                //     //       ),
                //     //     ),
                //     //   ),
                //     // ),

                //     // Expanded(
                //     //   child: TextFormField(
                //     //     controller: profilecontroller.day,
                //     //     maxLength: 2,
                //     //     decoration: InputDecoration(
                //     //       contentPadding: EdgeInsets.only(left: 47),
                //     //       filled: true,
                //     //       fillColor: white,
                //     //       hintText: 'Day',
                //     //       hintStyle: GoogleFonts.inter(
                //     //           fontSize: 12,
                //     //           fontWeight: FontWeight.w300,
                //     //           color: grey),
                //     //       border: OutlineInputBorder(
                //     //           borderRadius: BorderRadius.circular(5),
                //     //           borderSide: BorderSide.none),
                //     //     ),
                //     //   ),
                //     // ),
                //     // 20.horizontalSpace,
                //     // Expanded(
                //     //   child: TextFormField(
                //     //     controller: profilecontroller.year,
                //     //     maxLength: 4,
                //     //     decoration: InputDecoration(
                //     //       contentPadding: EdgeInsets.only(left: 47),
                //     //       filled: true,
                //     //       fillColor: white,
                //     //       hintText: 'Year',
                //     //       hintStyle: GoogleFonts.inter(
                //     //           fontSize: 12,
                //     //           fontWeight: FontWeight.w300,
                //     //           color: grey),
                //     //       border: OutlineInputBorder(
                //     //           borderRadius: BorderRadius.circular(5),
                //     //           borderSide: BorderSide.none),
                //     //     ),
                //     //   ),
                //     // ),
                //   ],
                // ),
                20.verticalSpace,
                Text("Car Make",
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: black)),
                10.verticalSpace,
                DropdownButtonFormField<String>(
                  icon: FaIcon(
                    Icons.keyboard_arrow_down_rounded,
                    color: grey,
                    size: 20,
                  ),

                  //isExpanded: true,
                  value: null,
                  onChanged: (newValue) {
                    this.models=[];
                      setState(() {});
                    selected = null;
                    profilecontroller.model.clear();
                  

                    print("tapped");
                    profilecontroller.carmake.text = newValue!;

                    models =
                        this.car_brands_cars[profilecontroller.carmake.text]!;
                    setState(() {});
                  },

                  items:
                      car_brands.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20, right: 20),
                    filled: true,
                    fillColor: white,
                    hintText: 'Select Car Maker',
                    hintStyle: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                // TextFormField(
                //   controller: profilecontroller.carmake,
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: white,
                //     hintText: 'Please type your carmake...',
                //     hintStyle: GoogleFonts.inter(
                //         fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(30),
                //         borderSide: BorderSide.none),
                //   ),
                // ),
                20.verticalSpace,
                Text("City, State",
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: black)),
                10.verticalSpace,
                TextFormField(
                  controller: profilecontroller.address,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    hintText: 'Please type your address...',
                    hintStyle: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                  ),
                ),
                20.verticalSpace,
                Text("What's your car's name",
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: black)),
                10.verticalSpace,
                TextFormField(
                  controller: profilecontroller.carname,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    hintText: 'Please type the name of your car...',
                    hintStyle: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                  ),
                ),
                20.verticalSpace,
                Text("Model",
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: black)),
                10.verticalSpace,
                DropdownButtonFormField<String>(
                  icon: FaIcon(
                    Icons.keyboard_arrow_down_rounded,
                    color: grey,
                    size: 20,
                  ),

                  //isExpanded: true,
                  value: selected,
                  onChanged: (newValue) {
                    selected=newValue;
                    profilecontroller.model.text = newValue!;
                    setState(() {
                      
                    });
                  },
                  items: models.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20, right: 20),
                    filled: true,
                    fillColor: white,
                    hintText: 'Select Car Model',
                    hintStyle: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                // TextFormField(
                //   controller: profilecontroller.model,
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: white,
                //     hintText: 'Please type the model of your car...',
                //     hintStyle: GoogleFonts.inter(
                //         fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(30),
                //         borderSide: BorderSide.none),
                //   ),
                // ),
                20.verticalSpace,
                Text("Driving Habits",
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: black)),
                10.verticalSpace,
                DropdownButtonFormField<String>(
                  icon: FaIcon(
                    Icons.keyboard_arrow_down_rounded,
                    color: grey,
                    size: 20,
                  ),

                  //isExpanded: true,
                  value: null,
                  onChanged: (newValue) {
                    profilecontroller.drivinghabit.text = newValue!;
                  },
                  items: [
                    "Commuter",
                    "Chief errand runner",
                    "Self-employed work driver",
                    "Family Chauffeur",
                    "I drive for my job",
                    "Casual Sunday driver",
                    "Road Tripping extraordinaire",
                    "I’m the community taxi",
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20, right: 20),
                    filled: true,
                    fillColor: white,
                    hintText: 'Select Driving Habits',
                    hintStyle: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                // TextFormField(
                //   controller: profilecontroller.drivinghabit,
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: white,
                //     hintText: 'Please type your carmake...',
                //     hintStyle: GoogleFonts.inter(
                //         fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(30),
                //         borderSide: BorderSide.none),
                //   ),
                // ),
                20.verticalSpace,
                CustomButton(
                  // tap: () {
                  //   final bottomctrl = Get.put(BottomController());

                  //   if (bottomctrl.navigationBarIndexValue != 2) {
                  //     bottomctrl.navBarChange(2);
                  //   } else {
                  //     Get.back();
                  //   }
                  // },
                  tap: () async {
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context).requestFocus(new FocusNode());

                    if (profilecontroller.file == null) {
                      return await Alert().showalertwithmessage(
                          "Profile image not set", context);
                    }

                    if (profilecontroller.name.text.isEmpty) {
                      return Alert().showalert("Name", context);
                    }
                    if (profilecontroller.desc.text.isEmpty) {
                      return Alert().showalert("About Yourself", context);
                    }
                    if (profilecontroller.dob.text.isEmpty) {
                      return Alert().showalert("Date of Birth", context);
                    }
                    if (profilecontroller.carmake.text.isEmpty) {
                      return Alert().showalert("Car Make", context);
                    }
                    if (profilecontroller.address.text.isEmpty) {
                      return Alert().showalert("City, State", context);
                    }
                    if (profilecontroller.carname.text.isEmpty) {
                      return Alert().showalert("Car Name", context);
                    }
                    if (profilecontroller.model.text.isEmpty) {
                      return Alert().showalert("Model", context);
                    }
                    if (profilecontroller.drivinghabit.text.isEmpty) {
                      return Alert().showalert("Driving Habits", context);
                    }

                    Get.to(() => MedicalDetailsScreen());
                  },
                  ButtonText: "Continue ",
                  width: 1.sw,
                  textColor: white,
                  colors: Color(0xFF007AB6),
                  height: 60.h,
                ),
                30.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
