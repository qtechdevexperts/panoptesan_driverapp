import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../helpers/Colors.dart';
import 'home.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F2F6),
      appBar: AppBar(
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.all(9.0),
          child: CircleIconButton(
            backgroundColor: Color(0xFF007AB6),
            icon: Icons.arrow_back,
            iconColor: Colors.white,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        centerTitle: true,
        title: Text(
          "Privacy Policy",
          style: appbarstyle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
  body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy for Panoptesan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'REV. 7.26.23',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 16.0),
            Text(
              'Effective Date: [7.26.23]',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '1. Introduction',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              'Welcome to Panoptesan ("the App"). This Privacy Policy explains how [The Brand-It, LLC, DBA “Panoptesan”] ("we," "us," or "our") collect, use, and protect your personal information when you use the App. By downloading, installing, or using the App, you consent to the practices outlined in this Privacy Policy.',
            ),
            SizedBox(height: 16.0),
            Text(
              '2. Information We Collect',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              '2.1 Personal Information: We may collect certain personal information that you provide directly to us, such as your name, email address, and other contact information.',
            ),
            Text(
              '2.2 Video and Audio Data: The App records video and audio data while in use, which may include footage from your vehicle\'s dash cam.',
            ),
            Text(
              '2.3 Device Information: We may collect information about your device, including its operating system, unique device identifier, and mobile network information.',
            ),
            Text(
              '2.4 Location Data: The App may collect and process information about your precise location, subject to your consent.',
            ),
            SizedBox(height: 16.0),
            Text(
              '3. Use of Collected Information',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              '3.1 Providing Services: We use the collected information to provide, maintain, and improve the functionality of the App and its services.',
            ),
            Text(
              '3.2 Dash Cam Footage: The video and audio data recorded by the dash cam may be used to provide you with access to recorded footage, enable sharing features, and for incident reporting and insurance purposes.',
            ),
            Text(
              '3.3 Communication: We may use your contact information to respond to your inquiries, send you important updates, and inform you about new features or promotional offers.',
            ),
            SizedBox(height: 16.0),
            Text(
              '4. Data Sharing',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              '4.1 Third-Party Service Providers: We may share your information with third-party service providers who assist us in operating the App and delivering its services (e.g., cloud storage providers).',
            ),
            Text(
              '4.2 Legal Compliance: We may disclose your information if required by law, or in response to a valid legal request.',
            ),
            SizedBox(height: 16.0),
            Text(
              '5. Data Security',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              '5.1 Security Measures: We implement industry-standard security measures to protect your information from unauthorized access, disclosure, or alteration.',
            ),
            Text(
              '5.2 No Data Transmission: While we take reasonable precautions to safeguard your information, no data transmission over the internet or electronic storage method can be guaranteed to be 100% secure.',
            ),
            SizedBox(height: 16.0),
            Text(
              '6. Data Retention',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              'We will retain your personal information for as long as necessary to fulfill the purposes outlined in this Privacy Policy unless a longer retention period is required or permitted by law.',
            ),
            SizedBox(height: 16.0),
            Text(
              '7. Children\'s Privacy',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              'The App is not intended for use by individuals under the age of [13/16/18, depending on the jurisdiction]. We do not knowingly collect personal information from children without parental consent. If you believe we have collected information from a child without proper consent, please contact us, and we will take appropriate measures to remove the information.',
            ),
            SizedBox(height: 16.0),
            Text(
              '8. Your Choices',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              'You may have certain rights regarding your personal information under applicable laws. Please contact us using the information provided below if you wish to exercise these rights or have any concerns about your data.',
            ),
            SizedBox(height: 16.0),
            Text(
              '9. Changes to the Privacy Policy',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              'We may update this Privacy Policy from time to time. We will notify you of any significant changes through the App or other appropriate means. Your continued use of the App after the changes take effect constitutes your acceptance of the revised Privacy Policy.',
            ),
            SizedBox(height: 16.0),
            Text(
              '10. Contact Us',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              'If you have any questions, concerns, or requests regarding this Privacy Policy or the App\'s data practices, please contact us at [contact@panoptesan.com].',
            ),
            SizedBox(height: 16.0),
            Text(
              'By using the dash cam app, ‘Panoptesan,” you acknowledge that you have read, understood, and agreed to this Privacy Policy.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
