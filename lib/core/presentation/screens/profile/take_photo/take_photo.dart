import 'dart:convert';
import 'dart:io';
import '../../../../../injection/injection.dart';
import '../../../presentation.dart';
import 'package:camera/camera.dart';

import '../../../router/auto_router.gr.dart';
import 'bloc/bloc.dart';

@RoutePage()
class TakePhotoScreen extends StatefulWidget implements AutoRouteWrapper {
  final CameraDescription frontCamera;
  final CameraDescription backCamera;

  const TakePhotoScreen({
    Key? key,
    required this.frontCamera,
    required this.backCamera,
  }) : super(key: key);

  @override
  State<TakePhotoScreen> createState() => _TakePhotoScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<TakePhotoBloc>(
      create: (_) => getIt<TakePhotoBloc>(),
      child: this,
    );
  }
}

class _TakePhotoScreenState extends State<TakePhotoScreen> {
  late CameraController _controller;
  final ValueNotifier _isFrontCamera = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.frontCamera, ResolutionPreset.max);
    _controller.unlockCaptureOrientation();
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Stack(
      children: [
        ValueListenableBuilder(
          builder: (context, camera, child) {
            return CameraPreview(
              _controller,
            );
          },
          valueListenable: _isFrontCamera,
        ),
        Positioned(
          top: 0,
          left: 0,
          child: AppContainer(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(
              top: 8.h,
              left: AppMargin.largeMargin.w,
            ),
            child: BaseIcon(
              onTap: () => context.router.pop(),
              icon: Icon(Icons.arrow_back),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppContainer(
                  fillColor: context.theme.primaryColor,
                  padding: const EdgeInsets.all(16),
                  margin: EdgeInsets.only(bottom: AppMargin.largeMargin.h),
                  child: BaseIcon(
                    onTap: () async {
                      try {
                        final image = await _controller.takePicture();

                        AppLogger.log(message: image.toString());
                        if (!mounted) return;
                        context.router.push(
                          DisplayPictureScreenRoute(image: image),
                        );
                      } catch (e, stackTrace) {
                        AppLogger.logError(
                          message: e.toString(),
                          stackTrace: stackTrace,
                        );
                      }
                    },
                    icon: Icon(
                      Icons.camera_alt,
                      color: context.theme.colorScheme.surface,
                    ),
                  ),
                ),
                AppContainer(
                  padding: const EdgeInsets.all(16),
                  margin: EdgeInsets.only(
                    left: AppMargin.largeMargin.h,
                    bottom: AppMargin.largeMargin.h,
                  ),
                  child: BaseIcon(
                    icon: const Icon(Icons.cameraswitch),
                    onTap: () async {
                      _controller = _isFrontCamera.value
                          ? CameraController(
                              widget.frontCamera,
                              ResolutionPreset.max,
                            )
                          : CameraController(
                              widget.backCamera,
                              ResolutionPreset.max,
                            );
                      await _controller.unlockCaptureOrientation();
                      await _controller.initialize();
                      _isFrontCamera.value = !_isFrontCamera.value;
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

@RoutePage()
class DisplayPictureScreen extends StatelessWidget implements AutoRouteWrapper {
  final XFile image;

  const DisplayPictureScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final file = File(image.path);
    List<int> fileInByte = file.readAsBytesSync();
    String fileInBase64 = base64Encode(fileInByte);
    return BlocListener<TakePhotoBloc, TakePhotoState>(
      listener: (context, state) => state.maybeWhen(
        orElse: () {},
        navigateBack: () => context.router.popUntilRouteWithName(
          TakePhotoScreenRoute.name,
        ),
      ),
      child: BaseScaffold(
        emptyTop: true,
        body: Column(
          children: [
            Image.file(file),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppContainer(
                    onTap: () => context.read<TakePhotoBloc>().add(
                          TakePhotoEvent.savePhoto(photoPath: image.path, photoName: image.name),
                        ),
                    fillColor: context.theme.primaryColor,
                    padding: const EdgeInsets.all(16),
                    child: BaseText(
                      style: context.theme.textTheme.headlineLarge
                          ?.withColor(AppColorsScheme.white),
                      title: 'Принять',
                    ),
                  ),
                  SizedBox(width: AppMargin.largeMargin.w),
                  AppContainer(
                    withBorder: true,
                    borderColor: AppColorsScheme.mainColor,
                    padding: const EdgeInsets.all(16),
                    onTap: () => Navigator.of(context).pop(),
                    child: BaseText(
                      style: context.theme.textTheme.headlineLarge?.withColor(
                        AppColorsScheme.mainColor,
                      ),
                      title: 'Отменить',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<TakePhotoBloc>(
      create: (_) => getIt<TakePhotoBloc>(),
      child: this,
    );
  }
}
