import 'package:assignment/widget/app_text.dart';
import 'package:assignment/utils/imagepath.dart';
import 'package:assignment/utils/app_theme.dart';
import 'package:assignment/utils/strings_utils.dart';
import 'package:assignment/widget/custom_appBar.dart';
import 'package:assignment/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:image_network/image_network.dart';

class HomeDeskTop extends StatefulWidget {
  const HomeDeskTop({Key? key}) : super(key: key);

  @override
  State<HomeDeskTop> createState() => _HomeDeskTopState();
}

class _HomeDeskTopState extends State<HomeDeskTop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                ImageUrl.arrow,
                height: 24,
                color: AppTheme.black,
              ),
              const AppText(
                text: AppString.appName,
              ),
              Center(
                child: Image.asset(
                  ImageUrl.ball,
                  height: 24,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 20,
                ),
                child: Column(
                  children: [
                    profileBox(),
                    titleBox(),
                    imageBox(),
                    profileTwoBox(),
                    profileThreeBox(),
                  ],
                ),
              ),
              textFieldBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileBox() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          child: Image.asset(
            ImageUrl.profileOne,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: AppString.appName1,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            AppText(
              text: AppString.appName3,
              color: AppTheme.textDarkColor,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
            left: 5,
          ),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.primary,
            ),
            child: const Padding(
              padding: EdgeInsets.all(3.0),
              child: Icon(
                Icons.done,
                size: 12,
                color: AppTheme.white,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 2,
            left: 5,
          ),
          child: AppText(
            text: AppString.appName2,
            color: AppTheme.textDarkColor,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            _downloadImage();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppTheme.primary,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              child: AppText(
                text: AppString.appName4,
                color: AppTheme.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget titleBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText(
            text: AppString.appName5,
            fontSize: 20,
            color: AppTheme.black,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: AppText(
              text: AppString.appName6,
              fontSize: 14,
              color: AppTheme.textDarkColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              dataBox(title: AppString.appName7),
              const SizedBox(
                width: 10,
              ),
              dataBox(title: AppString.appName8),
              const SizedBox(
                width: 10,
              ),
              dataBox(title: AppString.appName9),
              const SizedBox(
                width: 10,
              ),
              dataBox(title: AppString.appName10),
              const SizedBox(
                width: 10,
              ),
              dataBox(title: AppString.appName11),
              const SizedBox(
                width: 10,
              ),
              dataBox(title: AppString.appName12),
            ],
          ),
          // const SizedBox(
          //   height: 5,
          // ),
          // Row(
          //   children: [
          //     dataBox(title: AppString.appName11),
          //     const SizedBox(
          //       width: 5,
          //     ),
          //     dataBox(title: AppString.appName12),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget dataBox({
    String? title,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppTheme.textDarkColor[200]!,
          width: 1,
        ),
        color: AppTheme.textDarkColor[400],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: AppText(
          text: "$title",
          color: AppTheme.textDarkColor[300],
        ),
      ),
    );
  }

  Widget imageBox() {
    return Column(
      children: [
        ImageNetwork(
          image: "https://wjddnjs754.cafe24.com/web/product/small/202303/5b9279582db2a92beb8db29fa1512ee9.jpg",
          height: 600,
          width: MediaQuery.of(context).size.width,
          duration: 1500,
          curve: Curves.easeIn,
          onPointer: true,
          debugPrint: false,
          fullScreen: false,
          fitAndroidIos: BoxFit.fill,
          fitWeb: BoxFitWeb.fill,
          onLoading: Container(
            color: AppTheme.textDarkColor[500],
            height: 400,
            child: Center(
              child: Image.asset(
                ImageUrl.images,
                scale: 5,
              ),
            ),
          ),
          onError: Container(
            color: AppTheme.textDarkColor[500],
            height: 400,
            child: Center(
              child: Image.asset(
                ImageUrl.images,
                scale: 5,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 10,
          ),
          child: Row(
            children: [
              Image.asset(
                ImageUrl.heart,
                scale: 4,
              ),
              const SizedBox(
                width: 5,
              ),
              AppText(
                text: AppString.appName13,
                color: AppTheme.textDarkColor[100],
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                ImageUrl.comment,
                scale: 4,
              ),
              const SizedBox(
                width: 5,
              ),
              AppText(
                text: AppString.appName14,
                color: AppTheme.textDarkColor[100],
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                ImageUrl.bookMark,
                scale: 4,
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                ImageUrl.more,
                scale: 4,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _frameBuilder(BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
    if (wasSynchronouslyLoaded) {
      return child;
    }
    return Container(
      color: AppTheme.textDarkColor[500],
      height: 400,
      child: Center(
        child: Image.asset(
          ImageUrl.images,
          scale: 5,
        ),
      ),
    );
  }

  Widget _loadingBuilder(context, widget, chunk) {
    if (chunk?.cumulativeBytesLoaded == chunk?.expectedTotalBytes) {
      return widget;
    } else {
      return Container(
        color: AppTheme.textDarkColor[500],
        height: 400,
        child: Center(
          child: Image.asset(
            ImageUrl.images,
            scale: 5,
          ),
        ),
      );
    }
  }

  Widget profileTwoBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                child: Image.asset(
                  ImageUrl.profileTwo,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const AppText(
                text: AppString.appName1,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 5,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.primary,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Icon(
                      Icons.done,
                      size: 12,
                      color: AppTheme.white,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 2,
                  left: 5,
                ),
                child: AppText(
                  text: AppString.appName2,
                  color: AppTheme.textDarkColor,
                ),
              ),
              const Spacer(),
              Image.asset(
                ImageUrl.more,
                scale: 3,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  text: AppString.appName15,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 0,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        ImageUrl.heart,
                        scale: 4,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      AppText(
                        text: AppString.appName13,
                        color: AppTheme.textDarkColor[100],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        ImageUrl.comment,
                        scale: 4,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      AppText(
                        text: AppString.appName14,
                        color: AppTheme.textDarkColor[100],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget profileThreeBox() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                child: Image.asset(
                  ImageUrl.profileTwo,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const AppText(
                text: AppString.appName16,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 2,
                  left: 5,
                ),
                child: AppText(
                  text: AppString.appName2,
                  color: AppTheme.textDarkColor,
                ),
              ),
              const Spacer(),
              Image.asset(
                ImageUrl.more,
                scale: 3,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  text: AppString.appName17,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 0,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        ImageUrl.heart,
                        scale: 4,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      AppText(
                        text: AppString.appName13,
                        color: AppTheme.textDarkColor[100],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget textFieldBox() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppTheme.textDarkColor[200]!,
            width: 2.0,
          ),
        ),
      ),
      child: CustomTextField(
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Image.asset(
            ImageUrl.images,
            scale: 6,
          ),
        ),
        hintText: AppString.appName18,
        hintTextColor: AppTheme.textDarkColor[200],
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: AppText(
            text: AppString.appName19,
            color: AppTheme.textDarkColor[200],
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  bool downloading = false;

  Future<void> _downloadImage() async {
    setState(() {
      downloading = true;
    });
    const _url = ImageUrl.profileOne;
    await WebImageDownloader.downloadImageFromWeb(
      _url,
      name: 'image01',
      imageType: ImageType.png,
    );
    setState(() {
      downloading = false;
    });
  }
}
