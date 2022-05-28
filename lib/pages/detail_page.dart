import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/cubit/app_cubit.dart';
import 'package:sample_app/cubit/app_cubit_states.dart';
import 'package:sample_app/misc/colors.dart';
import 'package:sample_app/widgets/app_button.dart';
import 'package:sample_app/widgets/app_large_text.dart';
import 'package:sample_app/widgets/app_text.dart';
import 'package:sample_app/widgets/responsive_button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int gottenStars = 3;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, CubitState>(builder: (context, state) {
      DetailState detail = state as DetailState;

      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "http://mark.bslmeiyu.com/uploads/${detail.places.img}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 50,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu),
                      color: Colors.black,
                      iconSize: 30,
                      onPressed: () {
                        BlocProvider.of<AppCubit>(context).goHome();
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.search_rounded),
                      color: Colors.black,
                      iconSize: 30,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 280,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: detail.places.name,
                          color: Colors.black.withOpacity(0.8),
                        ),
                        AppLargeText(
                          text: "\$ ${detail.places.price}",
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(width: 5),
                        AppText(
                            text: detail.places.location,
                            color: AppColors.textColor1)
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) {
                              return Icon(Icons.star,
                                  color: index < detail.places.stars
                                      ? AppColors.starColor
                                      : AppColors.textColor2);
                            },
                          ),
                        ),
                        SizedBox(width: 5),
                        AppText(
                          text: "(5.0)",
                          color: AppColors.textColor2,
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    AppLargeText(
                      text: "People",
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    SizedBox(height: 5),
                    AppText(
                      text: "Number of people in your group",
                      color: AppColors.mainColor,
                    ),
                    Wrap(
                      children: List.generate(
                        5,
                        (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButtons(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: selectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                borderColor: selectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                size: 50,
                                isIcon: false,
                                text: (index + 1).toString(),
                                // icon: Icons.favorite_border),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    AppLargeText(
                      text: "Description",
                      color: Colors.black.withOpacity(0.8),
                    ),
                    SizedBox(height: 5),
                    AppText(
                      text: detail.places.description,
                      color: AppColors.mainColor,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButtons(
                    color: AppColors.textColor1,
                    backgroundColor: Colors.white,
                    borderColor: AppColors.textColor1,
                    size: 60,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ResponsiveButton(
                    isResponsive: true,
                    text: "Book Trip Now",
                  )
                ],
              ),
            )
          ]),
        ),
      );
    });
  }
}
