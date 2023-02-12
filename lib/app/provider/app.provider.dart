import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:voicegpt/core/notifiers/openai.notifier.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => OpenAINotifier()),
  ];
}