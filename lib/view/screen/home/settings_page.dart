import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/homeController/settings_controller.dart';
import '../../widget/CustomWidgets/custom_title_h1.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsControllerImpl());
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.orange.withOpacity(0.4),
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      CustomTitleH1(
                        text: 'Settings',
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 22,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  GetBuilder<SettingsControllerImpl>(
                    builder: (controller) => Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 40,
                          ),
                          child: ListView(
                            children: [
                              ListTile(
                                title: Text(
                                  'Disable notification',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16,
                                  ),
                                ),
                                trailing: Switch(
                                  value: true,
                                  onChanged: (value) {},
                                  thumbColor: const MaterialStatePropertyAll(
                                      Colors.white),
                                  activeColor: Colors.teal,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Help and support',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16,
                                  ),
                                ),
                                trailing:
                                    const Icon(Icons.help_outline_rounded),
                              ),
                              ListTile(
                                title: Text(
                                  'Contact us',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16,
                                  ),
                                ),
                                trailing:
                                    const Icon(Icons.mail_outline_outlined),
                              ),
                              ListTile(
                                title: Text(
                                  'Address',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16,
                                  ),
                                ),
                                trailing:
                                    const Icon(Icons.location_on_outlined),
                              ),
                              ElevatedButton(
                                onPressed: () => controller.logOut(),
                                style: ButtonStyle(
                                  elevation: const MaterialStatePropertyAll(0),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.orange.withOpacity(0.5)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Log Out',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.9),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.exit_to_app,
                                      color: Colors.white.withOpacity(0.9),
                                      size: 23,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 60,
                child: Container(
                  height: 80,
                  width: 80,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.grey.shade100,
                    ),
                    child: SvgPicture.asset(
                      'assets/images/person.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
