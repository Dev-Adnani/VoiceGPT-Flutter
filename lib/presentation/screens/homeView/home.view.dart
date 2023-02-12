import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:voicegpt/app/constants/app.animation.dart';
import 'package:voicegpt/core/notifiers/openai.notifier.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 815;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Consumer<OpenAINotifier>(
              builder: (context, notifier, _) {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 3.0),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        "Press The Voice Button",
                        style: TextStyle(
                          inherit: false,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: height * 560,
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
                    InkWell(
                      child: Lottie.asset(
                        AppAnimation.noPush,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                      onTap: () async {
                        await notifier.getResponse(
                            parameter:
                                "Tell me something About Lionel Messi in Depth",
                            context: context);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
