import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
            /*  VxSwiper.builder(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  itemCount: appSettingController
                      .banner_prev_img_list.length,
                  height: het >= wdt ? het * 0.2 : wdt * 0.2,
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(
                      imageUrl: appSettingController
                          .banner_prev_img_list.length ==
                          0
                          ? ""
                          : appSettingController
                          .banner_prev_img_list[index],
                      imageBuilder: (context, url) =>
                          home_network_swiper_image_shape(url),
                      placeholder: (context, url) =>
                          home_asset_swiper_image_shape(),
                      errorWidget: (context, url, error) =>
                          home_asset_swiper_image_shape(),
                    );
                  }),*/
            ],
          ),
        ),
      ),
    );
  }
}
