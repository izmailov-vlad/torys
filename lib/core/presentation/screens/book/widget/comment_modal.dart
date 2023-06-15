import '../../../presentation.dart';
import '../../../widgets/base/base_icon.dart';

class CommentModal extends StatefulWidget {
  final String bookId;
  final Function({required String text, required String bookId}) onSubmit;

  const CommentModal({
    Key? key,
    required this.bookId,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<CommentModal> createState() => _CommentModalState();
}

class _CommentModalState extends State<CommentModal> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      height: context.screenSize.height * 0.8,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 16,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0, right: 16, left: 16),
                  child: Column(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          maxLines: null,
                          onChanged: (text) {},
                          decoration: InputDecoration(
                            hintText: 'Введите комментарий',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppMargin.mediumMargin.h),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.largePadding.w),
                  child: BaseButton(
                    onPressed: () => widget.onSubmit(
                      bookId: widget.bookId,
                      text: _controller.text,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: BaseText(
                        title: 'Добавить отзыв',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppMargin.largeMargin.h),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(
                top: AppMargin.mediumMargin.h,
                right: AppMargin.mediumMargin.w,
              ),
              child: BaseIcon(
                icon: Icon(Icons.close),
                onTap: () => context.router.pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
