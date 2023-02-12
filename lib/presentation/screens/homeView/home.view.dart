import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voicegpt/core/notifiers/openai.notifier.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    OpenAINotifier open = Provider.of<OpenAINotifier>(context, listen: true);
    double height = MediaQuery.of(context).size.height / 815;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Column(
              children: [
                SizedBox(
                  height: height * 660,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: open.getData!.length,
                    itemBuilder: (context, index) {
                      return Text(
                        open.getData![index].text,
                        style: const TextStyle(
                          inherit: false,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.lightBlue,
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await open.getResponse(
                        parameter: "Tell me a joke about men",
                        context: context);
                  },
                  child: const Text("SPAM"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
