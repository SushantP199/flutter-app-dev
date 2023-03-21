import 'package:flutter/material.dart';
import 'package:multiprovider_concept/provider/height_provider.dart';
import 'package:multiprovider_concept/provider/slider_provider.dart';
import 'package:provider/provider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    print("build");

    var sliderProvider = Provider.of<SliderProvider>(context, listen: false);
    var heightProvider = Provider.of<HeightProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider | State Management"),
      ),
      body: Consumer<SliderProvider>(
        builder: ((context, value, child) {
          print("rebuild for opacity");

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(
                value: sliderProvider.opacity,
                onChanged: ((value) {
                  sliderProvider.setOpacity(value);
                  print(sliderProvider.opacity);
                  heightProvider.setHeight(50 * value);
                }),
              ),
              Consumer<HeightProvider>(
                builder: ((context, value, child) {
                  print("rebuild for height");

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            height: heightProvider.height,
                            decoration: BoxDecoration(
                              color: Colors.red
                                  .withOpacity(sliderProvider.opacity),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Container(
                            height: heightProvider.height,
                            decoration: BoxDecoration(
                              color: Colors.blue
                                  .withOpacity(sliderProvider.opacity),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              )
            ],
          );
        }),
      ),
    );
  }
}
