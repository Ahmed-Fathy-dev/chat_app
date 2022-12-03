

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ExeptionAlert extends StatelessWidget {
  const ExeptionAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Lottie.asset(
                  '',
                  // width: 200,
                  // height: 200
                  // fit: BoxFit.contain
                ),
              ),
              SizedBox(
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.red),
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  child: const Text(' العوده'),
                ),
              ),
            ],
          ),
        ),
      );
  }
}