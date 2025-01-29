import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class StackedCarousalWidget extends StatefulWidget {
  const StackedCarousalWidget({super.key});

  @override
  State<StackedCarousalWidget> createState() => _StackedCarousalWidgetState();
}

class _StackedCarousalWidgetState extends State<StackedCarousalWidget> {

  late SwiperController controller;

  @override
  void initState() {
    super.initState();
    controller = SwiperController();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        children: [
          Swiper(
            itemCount: 4,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              child: Center(
                child: Text(
                  index.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            itemWidth: 280,
            itemHeight: 190,
            layout: SwiperLayout.STACK,
            controller: controller,
            onIndexChanged: (index) => setState(() {
              controller.index = index;
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
                  (index) => Container(
                width: 5,
                height: 5,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (controller.index == index)
                      ? Colors.black
                      : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
