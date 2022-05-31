import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpense_app/screens/profilename%20screen/screen_profile.dart';

class ScreenOnboard extends StatefulWidget {
  const ScreenOnboard({Key? key}) : super(key: key);

  @override
  State<ScreenOnboard> createState() => _ScreenOnboardState();
}

class _ScreenOnboardState extends State<ScreenOnboard> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          SingleChildScrollView(
            child: Container(
              height: 800,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Column(
                  children: [
                    Image(
                        width: MediaQuery.of(context).size.width * 0.8,
                        image: const AssetImage(
                          'assets/images/onboard screen one image.png',
                        )),
                    Text(
                      'Save For Your \n Future !',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.signika(
                          textStyle: const TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 20, 5, 64))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 70,
                      width: 320,
                      child: Text(
                        'Xpense makes it easy to keep a track of where your money is going.It will use visuals and graphs to give you insights into your spending habits. You can also set remainders, and the app will notify you.',
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 109, 108, 108)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text('Next'),
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 139, 9, 204),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            minimumSize: const Size(150, 40)))
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 800,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Column(
                  children: [
                    Image(
                        width: MediaQuery.of(context).size.width * 0.8,
                        image: const AssetImage(
                            'assets/images/onboard screen 2.png')),
                    Text(
                      'Analyze Your \n Spending',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.signika(
                          textStyle: const TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 20, 5, 64))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 70,
                      width: 320,
                      child: Text(
                        'Xpense is more serious in terms of the interface and features it offers. If you want a microscopic view of your money, this is the app for you. To help you plan better',
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 109, 108, 108)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (ctx) {
                            return ScreenProfile();
                          }));
                        },
                        child: const Text('Get Started'),
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 139, 9, 204),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            minimumSize: const Size(150, 40)))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
