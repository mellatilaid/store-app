import 'package:flutter/material.dart';
import 'package:training/helper/const.dart';
import 'package:training/widgets/home_view_body.dart';

import '../widgets/custom_budge_count.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'homePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            )),
        title: Text(
          'New Treindy',
          style: TextStyle(color: kTextColor),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomBudgeCount(),
          ),
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
