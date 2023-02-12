import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voicegpt/core/notifiers/openai.notifier.dart';
import 'package:voicegpt/core/notifiers/speech.notifier.dart';
import 'package:voicegpt/presentation/widgets/loader.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 815;
    double width = MediaQuery.of(context).size.width / 815;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Consumer<OpenAINotifier>(
              builder: (context, notifier, _) {
                return Column(
                  children: [
                    SizedBox(
                        height: height * 600,
                        child: notifier.getCheck
                            ? ListView.builder(
                                shrinkWrap: true,
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 5),
                                itemCount: notifier.getData!.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    notifier.getData![index].text,
                                    style: const TextStyle(
                                      inherit: false,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.lightBlue,
                                    ),
                                  );
                                },
                              )
                            : null),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: height * 150,
                        width: width * 600,
                        margin: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 3.0),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Consumer<SpeechNotifier>(
                            builder: (builder, notifier, _) {
                          return Text(
                            notifier.getTextSpeech,
                            style: const TextStyle(
                              inherit: false,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800,
                              color: Colors.lightBlue,
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Consumer<OpenAINotifier>(builder: (context, notifier, _) {
            return FloatingActionButton(
              onPressed: () async {
                SpeechNotifier speechNotifier =
                    Provider.of<SpeechNotifier>(context, listen: false);
                showLoaderDialog(context);
                await notifier.getResponse(
                  parameter: speechNotifier.getTextSpeech,
                  context: context,
                );
              },
              child: const Center(
                child: Icon(Icons.check),
              ),
            );
          }),
          const SizedBox(
            height: 20,
          ),
          Consumer<SpeechNotifier>(builder: (context, notifier, _) {
            return FloatingActionButton(
              onPressed: () {
                notifier.onListen();
              },
              child: AvatarGlow(
                animate: notifier.getIsListening,
                endRadius: 80,
                glowColor: Theme.of(context).primaryColor,
                duration: const Duration(milliseconds: 2000),
                repeatPauseDuration: const Duration(milliseconds: 100),
                repeat: true,
                child: Center(
                  child: Icon(
                      notifier.getIsListening ? Icons.mic : Icons.mic_none),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
