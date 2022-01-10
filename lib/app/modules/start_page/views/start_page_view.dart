// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_malamu_patient/app/utils/app_plugins.dart';

import '../controllers/start_page_controller.dart';

class StartPageView extends GetView<StartPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.BLACK_COLOR,
                AppColors.TRANSPARENT,
                AppColors.BLACK_COLOR
              ],
            ).createShader(
              Rect.fromLTRB(
                0,
                -140,
                rect.width,
                rect.height - 20,
              ),
            );
          },
          blendMode: BlendMode.darken,
          // child: Lottie.asset(
          //   "assets/lotties/47383-doctor-welcoming-pacient.json",
          //   fit: BoxFit.cover,
          //   height: 400.0,
          // ),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.TRANSPARENT, AppColors.WHITE_COLOR],
                  begin: FractionalOffset(0, 0),
                  end: FractionalOffset(0, 1),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  'https://images.pexels.com/photos/5452201/pexels-photo-5452201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // Lottie.asset(
        //   "assets/lotties/doctor_greet.json",
        //   fit: BoxFit.cover,
        //   height: 400.0,
        // ),
        Column(
          children: [
            Expanded(
              child: Container(
                child: Align(
                  alignment: FractionalOffset(0.5, 0.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 110.0),
                    // decoration: BoxDecoration(
                    //   boxShadow: [
                    //     BoxShadow(
                    //       color: Colors.black,
                    //       blurRadius:
                    //           10.0, // has the effect of softening the shadow
                    //       spreadRadius:
                    //           0, // has the effect of extending the shadow
                    //       offset: Offset(
                    //         4.0, // horizontal, move right 10
                    //         4.0, // vertical, move down 10
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // child: ClipRRect(
                    //   borderRadius: BorderRadius.circular(10.0),
                    //   child: CachedNetworkImage(
                    //     imageUrl:
                    //         'https://i.pinimg.com/originals/b3/a6/a1/b3a6a10a79908d5399673e4de0d89b80.png',
                    //     width: 70,
                    //   ),
                    // ),
                  ),
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Votre passeport santé\nHealth Malamu',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  )),
              flex: 0,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 28.0),
                child: Text(
                  'We do all the best for your future endeavors by providing the connections you need during your job seeking process.',
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.symmetric(vertical: 18.0),
                constraints: BoxConstraints(
                  maxWidth: 330.0,
                ),
              ),
              flex: 0,
            ),
            Expanded(
              child: ButtonTheme(
                minWidth: 320.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {},
                  textColor: AppColors.RED_COLOR,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Text(
                    'Demande d\'inscription',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              flex: 0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ButtonTheme(
                  minWidth: 320.0,
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      Get.toNamed(Routes.AUTH);
                    },
                    textColor: Colors.white,
                    color: AppColors.RED_COLOR,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Text(
                      'Se Connecter',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              flex: 0,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {},
                    textColor: Colors.white,
                    child: const Text.rich(
                      TextSpan(
                        text: 'Plus d\'info sur ',
                        children: [
                          TextSpan(
                            text: 'softtech-company.com',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          )
                        ],
                      ),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              flex: 0,
            ),
          ],
        ),
      ]),
    );
  }
}
