import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/Providers/count_provider.dart';

class CountExampleScreen extends StatefulWidget {
  const CountExampleScreen({super.key});

  @override
  State<CountExampleScreen> createState() => _CountExampleScreenState();
}

class _CountExampleScreenState extends State<CountExampleScreen> {
  // int countValue = 0;

  // void increaseCount() {
  //   countValue = countValue + 1;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    // final countProvider = Provider.of<CountProvider>(context, listen: true);
    print('build context');
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Consumer<CountProvider>(
            builder: (context, value, child) {
              return Text(
                'Value of count is ${value.count.toString()}',
                style: const TextStyle(color: Colors.black, fontSize: 20),
              );
            },
          )),
          const SizedBox(
            height: 10,
          ),
          Consumer<CountProvider>(
            builder: (context, value, child) {
              return InkWell(
                onTap: () => value.inCreaseCount(),
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: const Center(
                    child: Text(
                      'Add Value',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    ));
  }
}
