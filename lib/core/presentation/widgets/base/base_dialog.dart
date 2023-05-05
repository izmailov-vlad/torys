import 'package:another_flushbar/flushbar.dart';
import '../../../../ui.dart';
import 'base_button.dart';
import 'package:book_readers/utils/extentions/build_context_extension.dart';

class BaseDialog<T> {
  BaseDialog._();

  static _AppDialog? _current;

  static GlobalKey _flushBarKey = GlobalKey();

  static Future<T?> showBaseDialog<T>(
    BuildContext context, {
    required String title,
    String? content,
    bool barrierDismissible = true,
    bool useRootNavigator = true,
    EdgeInsets? insetPadding,
    bool scrollable = false,
    ActionsBuilder<T>? actions,
    EdgeInsets? actionsPadding,
    Future<bool> Function()? onWillPop,
    MainAxisAlignment? actionsAlignment,
  }) async {
    // if (_current != null) return null;

    _current = _BaseDialog<T>(
      title: title,
      content: content,
      barrierDismissible: barrierDismissible,
      insetPadding: insetPadding,
      onWillPop: onWillPop,
      actionsAlignment: actionsAlignment,
      actionsBuilder: actions,
      actionsPadding: actionsPadding,
      scrollable: scrollable,
      setCurrent: _setCurrent,
    );
    //TODO:
    // if (_current != null) {
    //   return await showDialog<T>(
    //     context: context,
    //     //TODO: Сделать тему
    //     //barrierColor: context.theme.barrierColor,
    //     useRootNavigator: useRootNavigator,
    //     barrierDismissible: barrierDismissible,
    //     useSafeArea: false,
    //     builder: (_) => _current ?? const SizedBox(),
    //   );
    // }
    return await showDialog<T>(
      context: context,
      //TODO: Сделать тему
      //barrierColor: context.theme.barrierColor,
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
      useSafeArea: false,
      builder: (_) => _current ?? const SizedBox(),
    );

    return null;
  }

  static void dispose<T>([T? result]) {
    if (_current != null) {
      if (result != null) {
        _current!.dismiss(result);
      } else {
        _current!.dismiss();
      }
    }
    _setCurrent();
  }

  static void closeSnackBar() {
    (_flushBarKey.currentWidget as Flushbar?)?.dismiss();
  }

  static void showSnackBar(
    BuildContext context, {
    required String text,
    Color? backgroundColor,
    Color? textColor,
  }) {
    closeSnackBar();
    _flushBarKey = GlobalKey();
    Flushbar(
      mainButton: IconButton(
        icon: const Icon(
          Icons.close,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),

      key: _flushBarKey,
      //TODO: Добавить reversedColor при смене темы
      backgroundColor: backgroundColor ?? AppColorsScheme.red,
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      isDismissible: true,
      //TODO: snackbar duration
      //duration: Duration(milliseconds: 100),
      shouldIconPulse: true,
      margin: const EdgeInsets.all(15),
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      messageText: Text(
        text,
        //TODO: textStyle in snackbar
        style: AppTextTheme.bodyLarge.withColor(AppColorsScheme.white),
        maxLines: 2,
      ),
    ).show(context);
  }

  static Future<dynamic> showErrorDialog<T>(
    BuildContext context, {
    required String? errorText,
    ActionsBuilder<T>? actions,
    EdgeInsets? actionsPadding,
    MainAxisAlignment? actionsAlignment,
  }) async {
    return await showBaseDialog(
      context,
      title: 'ошибка',
      actionsAlignment: actionsAlignment,
      content: errorText ?? 'error',
      actionsPadding: actionsPadding,
      actions: (context, dismiss) => actions != null
          ? actions(context, dismiss)
          : [
              Center(
                child: BaseButton(
                  onPressed: dismiss,
                  child: Text('asd'),
                ),
              ),
            ],
    );
  }

  static Future<dynamic> showSimpleWarning(
      BuildContext context, String title, Widget? child) {
    return showBaseDialog(
      context,
      title: title,
      actions: (_, dismiss) => [
        Center(
          child: Container(color: Colors.white, child: child),
        ),
      ],
    );
  }

  static Future<dynamic> showInProgress(BuildContext context) {
    return showBaseDialog(
      context,
      title: 'Функционал в разработке',
      actions: (_, dismiss) => [
        Center(
          child: BaseButton(
            onPressed: dismiss,
            child: Text('asd'),
          ),
        ),
      ],
    );
  }

  static void _setCurrent() {
    _current = null;
  }
}

mixin _AppDialogService<T> {
  void dismiss([T? result]);
}

abstract class _AppDialog<T> extends StatelessWidget with _AppDialogService<T> {
  const _AppDialog({Key? key}) : super(key: key);
}

typedef ActionsBuilder<T> = List<Widget> Function(BuildContext, Function([T?]));

class _BaseDialog<T> extends _AppDialog<T> {
  final String title;
  final String? content;
  final EdgeInsets? insetPadding;
  final bool scrollable;
  final ActionsBuilder<T>? actionsBuilder;
  final EdgeInsets? actionsPadding;
  final Future<bool> Function()? onWillPop;
  final bool barrierDismissible;
  final Function() setCurrent;
  final MainAxisAlignment actionsAlignment;
  final Color? backgroundColor;
  final Color? textColor;

  _BaseDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.insetPadding,
    required this.scrollable,
    required this.actionsBuilder,
    required this.actionsPadding,
    required this.onWillPop,
    required this.barrierDismissible,
    required this.setCurrent,
    this.backgroundColor,
    this.textColor,
    MainAxisAlignment? actionsAlignment,
  })  : actionsAlignment = actionsAlignment ?? MainAxisAlignment.spaceAround,
        super(key: key);

  BuildContext? _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return WillPopScope(
      onWillPop: () {
        if (onWillPop != null) {
          onWillPop?.call();
        }
        if (barrierDismissible) dismiss();

        return Future.value(false);
      },
      child: AlertDialog(
        title: Text(
          title,
          style: TextStyle(color: textColor ?? Colors.black),
        ),
        titlePadding: const EdgeInsets.only(top: 20, left: 24, right: 24),
        contentPadding: const EdgeInsets.only(top: 12, left: 24, right: 24),
        content: content != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(content!,
                      style: TextStyle(color: textColor ?? Colors.black)),
                ],
              )
            : null,
        actions: ((actionsBuilder?.call(context, dismiss).length ?? 0) > 1)
            ? [
                Row(
                  mainAxisAlignment: actionsAlignment,
                  children: actionsBuilder!.call(context, dismiss),
                ),
              ]
            : actionsBuilder?.call(context, dismiss),
        actionsPadding: actionsPadding ??
            const EdgeInsets.only(
              top: 12,
              left: 24,
              right: 24,
              bottom: 6,
            ),
        actionsAlignment: MainAxisAlignment.start,
        buttonPadding: EdgeInsets.zero,
        elevation: 4,
        scrollable: scrollable,
        shape: RoundedRectangleBorder(
            //TODO: constans radius
            borderRadius: BorderRadius.circular(8)),
        insetPadding:
            insetPadding ?? const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor: backgroundColor ?? AppColorsScheme.white,
      ),
    );
  }

  @override
  void dismiss([T? result]) {
    if (_context == null) return;
    if (Navigator.of(_context!).canPop()) Navigator.of(_context!).pop(result);
    setCurrent();
  }
}
