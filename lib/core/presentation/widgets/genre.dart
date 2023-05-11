import 'package:sizer/sizer.dart';

import '../../../ui.dart';
import '../../../ui_kit/radius.dart';
import '../../../ui_kit/shadows.dart';
import 'dart:async'; // Import the Timer widget

class BookGenre extends StatefulWidget {
  final String name;
  final VoidCallback onTap;

  const BookGenre({Key? key, required this.name, required this.onTap})
      : super(key: key);

  @override
  _BookGenreState createState() => _BookGenreState();
}

class _BookGenreState extends State<BookGenre> {
  bool _isPressed = false; // State variable to track if the widget is pressed
  Timer? _timer; // Declare a Timer variable

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true; // Set the state to true when the widget is tapped
        });
        _timer?.cancel(); // Cancel any previous timer if it exists
        _timer = Timer(const Duration(milliseconds: 200), () {
          // Create a new timer with a short delay
          setState(() {
            _isPressed = false; // Set the state to false when the timer expires
          });
        });
      },
      onTapUp: (_) {
        widget.onTap(); // Call the original onTap callback
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        padding: EdgeInsets.symmetric(
          vertical: _isPressed ? 0.5.h : 1.h,
          horizontal: _isPressed ? 2.w : 3.w,
        ),
        margin: EdgeInsets.only(
          left: _isPressed ? 1.h : 0,
          top:  _isPressed ? 1.5.h : 1.h,
        ),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surface,
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppRadius.secondaryRadius),
          ),
        ),
        // Add a scale transform when pressed
        child: Text(
          widget.name,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.withColor(AppColorsScheme.mainColor),
        ),
      ),
    );
  }
}
