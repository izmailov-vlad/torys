library presentation;

import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:freezed_annotation/freezed_annotation.dart';
export '../../../../../utils/error_handler.dart';
export '../../../../../ui.dart';
export '../domain/domain.dart';
export 'widgets/base/base_loader.dart';
export 'package:sizer/sizer.dart';
export 'widgets/base/base_button.dart';
export 'widgets/base/base_title.dart';
export 'widgets/base/base_image.dart';
export 'widgets/base/base_input_text_field.dart';
export 'widgets/base/base_icon.dart';
export 'package:bloc_concurrency/bloc_concurrency.dart';
export 'package:shimmer_animation/shimmer_animation.dart';
export '../../utils/app_logger.dart';

/// models
part 'models/book/book.dart';

part 'models/book/volume_info.dart';

part 'models/book/category';

part 'models/chat_gpt/chat_gpt.dart';

part 'models/chat_gpt/chat_gpt_question.dart';

part 'models/chat_gpt/chat_gpt_questions.dart';

part 'models/book/access_info.dart';

part 'models/book/category_books.dart';

part 'models/book/comment.dart';

part 'models/book/comments.dart';

part 'models/book/image_links.dart';

part 'models/book/books.dart';

part 'models/book/categories_books.dart';

part 'models/authorization/auth.dart';

part 'models/authorization/logout.dart';

part 'models/authorization/register.dart';

part 'models/authorization/google_auth.dart';

part 'models/user.dart';

part 'presentation.freezed.dart';
