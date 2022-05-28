import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/cubit/app_cubit.dart';
import 'package:sample_app/misc/colors.dart';
import 'package:sample_app/widgets/app_large_text.dart';
import 'package:sample_app/widgets/app_text.dart';
import 'package:sample_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "../../assets/images/welcome1.png",
    "../../assets/images/welcome2.png",
    "../../assets/images/welcome3.png",
  ];

  // List text = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(images[index]), fit: BoxFit.cover),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trips"),
                      AppText(text: "Mountain", size: 30),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        child: AppText(
                            text:
                                "Mountain hikes gives you an incredibole sense of freedom along with endurance",
                            color: AppColors.textColor2,
                            size: 14),
                      ),
                      SizedBox(height: 50),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubit>(context).getData();
                        },
                        child: Container(
                          width: 200,
                          child: Row(
                            children: [
                              ResponsiveButton(
                                width: 120,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots) {
                      return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3),
                          ));
                    }),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
