import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../presentation.dart';
import '../../../../router/auto_router.gr.dart';
import '../../../../widgets/book/book_rating.dart';
import '../../bloc/bloc.dart';
import 'book_detail_info.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class BookDetailBodyContainer extends StatefulWidget {
  final String bookId;
  final String author;
  final String title;
  final bool isFavorite;
  final int rate;
  final String bookWebViewUrl;
  final int pageCount;
  final double averageRating;
  final int commentsCount;
  final int likesCount;
  final VoidCallback onFavoriteTap;
  final Function(int rate) onRateTap;

  const BookDetailBodyContainer({
    Key? key,
    required this.author,
    required this.title,
    required this.bookWebViewUrl,
    required this.isFavorite,
    required this.bookId,
    required this.pageCount,
    required this.averageRating,
    required this.commentsCount,
    required this.likesCount,
    required this.onFavoriteTap,
    required this.onRateTap,
    required this.rate,
  }) : super(key: key);

  @override
  State<BookDetailBodyContainer> createState() =>
      _BookDetailBodyContainerState();
}

class _BookDetailBodyContainerState extends State<BookDetailBodyContainer> {
  bool loading = false;
  Dio dio = Dio();
  String filePath = "";

  // @override
  // void initState() {
  //   download();
  //   super.initState();
  // }
  //
  // download() async {
  //   if (Platform.isAndroid || Platform.isIOS) {
  //     String? firstPart;
  //     final deviceInfoPlugin = DeviceInfoPlugin();
  //     final deviceInfo = await deviceInfoPlugin.deviceInfo;
  //     final allInfo = deviceInfo.data;
  //     if (allInfo['version']["release"].toString().contains(".")) {
  //       int indexOfFirstDot = allInfo['version']["release"].indexOf(".");
  //       firstPart = allInfo['version']["release"].substring(0, indexOfFirstDot);
  //     } else {
  //       firstPart = allInfo['version']["release"];
  //     }
  //     int intValue = int.parse(firstPart!);
  //     if (intValue >= 13) {
  //       await startDownload();
  //     } else {
  //       if (await Permission.storage.isGranted) {
  //         await Permission.storage.request();
  //         await startDownload();
  //       } else {
  //         await startDownload();
  //       }
  //     }
  //   } else {
  //     loading = false;
  //   }
  // }

  // startDownload() async {
  //   Directory? appDocDir = Platform.isAndroid
  //       ? await getExternalStorageDirectory()
  //       : await getApplicationDocumentsDirectory();
  //
  //   String path = appDocDir!.path + '/sample.epub';
  //   File file = File(path);
  //
  //   if (!File(path).existsSync()) {
  //     await file.create();
  //     await dio.download(
  //       "https://vocsyinfotech.in/envato/cc/flutter_ebook/uploads/22566_The-Racketeer---John-Grisham.epub",
  //       path,
  //       deleteOnError: true,
  //       onReceiveProgress: (receivedBytes, totalBytes) {
  //         setState(() {
  //           loading = true;
  //         });
  //       },
  //     ).whenComplete(() {
  //       setState(() {
  //         loading = false;
  //         filePath = path;
  //       });
  //     });
  //   } else {
  //     setState(() {
  //       loading = false;
  //       filePath = path;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            widget.author,
            style: Theme.of(context).textTheme.headlineLarge?.withColor(
                  AppColorsScheme.grey1,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.displayLarge?.toBold(),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BookDetailInfo(
                value: widget.pageCount.toString(),
                title: 'Кол-во стр',
                iconPath: AppImages.icBook,
              ),
              BookDetailInfo(
                value: widget.averageRating.toString(),
                title: 'Рейтинг',
                iconPath: AppImages.icInFavorite,
              ),
              BookDetailInfo(
                value: widget.commentsCount.toString(),
                title: 'Отзывы',
                iconPath: AppImages.icComment,
              ),
              BookDetailInfo(
                value: widget.likesCount.toString(),
                title: 'Добавили',
                iconPath: AppImages.icPerson,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: BaseButton(
                  onPressed: () {
                    context.router.push(
                      BaseWebViewRoute(
                        initialUrl: widget.bookWebViewUrl,
                      ),
                    );
                    // if (filePath == "") {
                    //   download();
                    // } else {
                    //   VocsyEpub.setConfig(
                    //     themeColor: Theme.of(context).primaryColor,
                    //     identifier: "iosBook",
                    //     scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
                    //     allowSharing: true,
                    //     enableTts: true,
                    //     nightMode: true,
                    //   );
                    //
                    //   // get current locator
                    //   VocsyEpub.locatorStream.listen((locator) {
                    //     print('LOCATOR: $locator');
                    //   });
                    //
                    //   VocsyEpub.open(
                    //     filePath,
                    //     lastLocation: EpubLocator.fromJson({
                    //       "bookId": "2239",
                    //       "href": "/OEBPS/ch06.xhtml",
                    //       "created": 1539934158390,
                    //       "locations": {
                    //         "cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"
                    //       }
                    //     }),
                    //   );
                    // }

// Get locator which you can save in your database
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: BaseText(
                      title: 'Читать',
                    ),
                  ),
                ),
              ),
              SizedBox(width: AppMargin.mediumMargin.w),
              AppContainer(
                padding: EdgeInsets.all(AppPadding.mediumPadding.w),
                withBorder: true,
                borderColor: context.theme.primaryColor,
                onTap: widget.onFavoriteTap,
                child: BlocBuilder<BookDetailBloc, BookDetailState>(
                  buildWhen: (prev, curr) => curr is BookDetailFetchState,
                  builder: (context, state) => state.maybeWhen(
                    fetch: (book) => AnimatedSwitcher(
                      duration: const Duration(milliseconds: 150),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(child: child, scale: animation);
                      },
                      child: BaseImage(
                        key: ValueKey<bool>(book.isFavorite),
                        // Unique key for each child
                        imageType: ImageType.asset,
                        imagePath: book.isFavorite
                            ? AppImages.icInFavorite
                            : AppImages.icOutFavorite,
                      ),
                    ),
                    orElse: () => AnimatedSwitcher(
                      duration: const Duration(milliseconds: 150),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(child: child, scale: animation);
                      },
                      child: BaseImage(
                        key: ValueKey<bool>(widget.isFavorite),
                        // Unique key for each child
                        imageType: ImageType.asset,
                        imagePath: widget.isFavorite
                            ? AppImages.icInFavorite
                            : AppImages.icOutFavorite,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppMargin.mediumMargin.h),
          BlocBuilder<BookDetailBloc, BookDetailState>(
            buildWhen: (prev, curr) => curr is BookDetailFetchState,
            builder: (context, state) => state.maybeWhen(
              fetch: (book) => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BaseText(
                      title: 'Поставить\nоценку',
                      style: context.theme.textTheme.headlineLarge?.toBold()),
                  BookRating(
                    onValueChanged: widget.onRateTap,
                    value: book.rate,
                  ),
                ],
              ),
              orElse: () => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BaseText(
                      title: 'Поставить\nоценку',
                      style: context.theme.textTheme.headlineLarge?.toBold()),
                  BookRating(
                    onValueChanged: widget.onRateTap,
                    value: widget.rate,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
