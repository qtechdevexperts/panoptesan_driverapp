import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../helpers/Colors.dart';
import 'home.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({super.key});

  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
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
          "Terms & Conditions",
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
              'Terms and Conditions for "Panoptesan."',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'REV. 7.26.23',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 16.0),
            Text(
              '1. Introduction',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              'Welcome to Panoptesan ("the App"). By downloading, installing, or using the App, you agree to be bound by these Terms and Conditions. If you do not agree with any part of these terms, please refrain from using the App.',
            ),
            SizedBox(height: 16.0),
            Text(
              '2. License and Usage',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              '2.1 License: [The Brand-It, LLC, DBA “Panoptesan”] grants you a non-exclusive, non-transferable, revocable license to use the App for personal, non-commercial purposes, subject to these Terms.',
            ),
            Text(
              '2.2 Restrictions: You shall not, in any circumstances, distribute, lease, license, sell, modify, or create derivative works based on the App, in whole or in part.',
            ),
            SizedBox(height: 16.0),
            Text(
              '3. Data Collection and Privacy',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              '3.1 Data Collection: The App may collect certain data from your device, including but not limited to video recordings, location data, and device information. By using the App, you consent to the collection and use of this data in accordance with our Privacy Policy.',
            ),
            Text(
              '3.2 Privacy Policy: For information on how we collect, use, and protect your data, please refer to our Privacy Policy, which is incorporated into these Terms by reference.',
            ),
            SizedBox(height: 16.0),
            Text(
              '4. User Responsibilities',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              '4.1 Lawful Use: You agree to use the App only for lawful purposes and in compliance with all applicable laws and regulations.',
            ),
            Text(
              '4.2 Content Ownership: You retain ownership of any content you create or upload to the App. By using the App, you grant c a worldwide, non-exclusive, royalty-free license to use, reproduce, modify, adapt, publish, and distribute such content solely for the purpose of providing and improving the App.',
            ),
            SizedBox(height: 16.0),
            Text(
              '5. Prohibited Activities',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              'While using the App, you must not:',
            ),
            Text(
              '5.1 Violate any applicable laws or regulations.',
      
            ),
            Text(
              '5.2 Infringe upon the intellectual property rights of others.',
   
            ),
            Text(
              '5.3 Engage in unauthorized access or interfere with the App\'s security features.',
        
            ),
            Text(
              '5.4 Transmit or distribute any harmful or malicious code.',
   
            ),
            Text(
              '5.5 Engage in any activity that may disrupt or harm the App or its users.',
             
            ),
            SizedBox(height: 16.0),
            Text(
              '6. Limitation of Liability',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              '6.1 No Warranty: The App is provided on an "as-is" basis without any warranties, express or implied. [The Brand-It, LLC, DBA “Panoptesan”] disclaims all warranties, including but not limited to warranties of merchantability, fitness for a particular purpose, and non-infringement.',
            ),
            Text(
              '6.2 Limitation of Liability: In no event shall [The Brand-It, LLC, DBA “Panoptesan”] be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in connection with the use of the App.',
            ),
            SizedBox(height: 16.0),
            Text(
              '7. Indemnification',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              'You agree to indemnify and hold [The Brand-It, LLC, DBA “Panoptesan”] harmless from and against any claims, damages, liabilities, losses, and expenses (including reasonable attorney\'s fees) arising out of or in connection with your use of the App or any breach of these Terms.',
            ),
            SizedBox(height: 16.0),
            Text(
              '8. Modifications',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              '[The Brand-It, LLC, DBA “Panoptesan”] reserves the right to modify or update these Terms and Conditions at any time. We will provide notice of significant changes through the App or other appropriate means. By continuing to use the App after the changes take effect, you accept the updated Terms.',
            ),
            SizedBox(height: 16.0),
            Text(
              '9. Governing Law',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              'These Terms and Conditions shall be governed by and construed in accordance with the laws of [The United States of America/Oregon].',
            ),
            SizedBox(height: 16.0),
            Text(
              '10. Contact',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              'If you have any questions or concerns regarding these Terms and Conditions, please contact us at [contact@panoptesan.com].',
            ),
            SizedBox(height: 16.0),
            Text(
              'By using the dash cam app, you acknowledge that you have read, understood, and agreed to these Terms and Conditions.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
