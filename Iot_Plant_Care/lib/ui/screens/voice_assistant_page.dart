
import 'package:Iot_Plant_Care/constants.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceAssistant extends StatefulWidget {
  const VoiceAssistant({Key? key}) : super(key: key);

  @override
  State<VoiceAssistant> createState() => _VoiceAssistantState();
}
class _VoiceAssistantState extends State<VoiceAssistant> {
  TextEditingController userInput = TextEditingController();
  final SpeechToText speechToTextInstance = SpeechToText();
  String recordedAudioString = "";
  bool isLoading = false;

  void initializeSpeechToText() async {
    await speechToTextInstance.initialize();

    setState(() {});
  }

  void startListeningNow() async {
    FocusScope.of(context).unfocus();

    await speechToTextInstance.listen(onResult: onSpeechToTextResult);

    setState(() {});
  }

  void stopListeningNow() async {
    await speechToTextInstance.stop();
    setState(() {});
  }

  void onSpeechToTextResult(SpeechRecognitionResult recognitionResult) {
    recordedAudioString = recognitionResult.recognizedWords;

    print("Speech Result: ");
    print(recordedAudioString);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initializeSpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Image.asset(
          'assets/images/sound.png',
          color: Constants.primaryColor,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Text("Voice Assistant"),
      ),
      body: SingleChildScrollView(

        child: Center(
          child: Padding(
            padding: EdgeInsets.all(100),
            child: Column(
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      speechToTextInstance.isListening
                          ? stopListeningNow()
                          : startListeningNow();
                    },
                    child: speechToTextInstance.isListening
                        ? Center(
                      child: LoadingAnimationWidget.beat(
                        size: 300 ,
                        color: speechToTextInstance.isListening
                            ? Constants.primaryColor
                            : isLoading
                            ? Colors.green[50]!
                            : Colors.greenAccent[50]!,
                      ),
                    )
                        : Image.asset(
                      "assets/images/assistant.png",
                      height: 400,
                      width: 400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                // Row(
                //   children: [
                //     //text Field
                //     Expanded(
                //         child: Padding(
                //           padding: const EdgeInsets.only(left: 4.0),
                //           child: TextField(
                //             controller: userInput,
                //             decoration: InputDecoration(
                //               border: OutlineInputBorder(),
                //               labelText: "Search Here !!",
                //             ),
                //           ),
                //         )),
                //
                //     const SizedBox(
                //       width: 10,
                //     ),
                //
                //     InkWell(
                //       onTap: () {
                //         print("send user input");
                //         // stopListeningNow();
                //       },
                //       child: AnimatedContainer(
                //         padding: const EdgeInsets.all(15),
                //         decoration: BoxDecoration(
                //           shape: BoxShape.rectangle,
                //           color: Colors.deepPurple,
                //         ),
                //         duration: const Duration(
                //           milliseconds: 1000,
                //         ),
                //         curve: Curves.bounceInOut,
                //         child: const Icon(
                //           Icons.search_rounded,
                //           color: Colors.white,
                //           size: 28,
                //         ),
                //       ),
                //     )
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

