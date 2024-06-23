import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageWidget extends StatelessWidget {
  final String? text;
  final bool isFromUser;
  final Image? image;
  const MessageWidget(
      {super.key,required this.text, required this.isFromUser, this.image});

  @override
  Widget build(BuildContext context) {
    Radius radiusCurv = Radius.circular(20);
    return Row(
      mainAxisAlignment:
         isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints:const BoxConstraints(maxWidth: 350),
            decoration: BoxDecoration(
              color: isFromUser ? Colors.grey : Colors.blue,
              borderRadius: isFromUser?  BorderRadius.only( topLeft: radiusCurv,bottomLeft: radiusCurv,bottomRight: radiusCurv,topRight:const Radius.circular(3)):
                BorderRadius.only(topRight: radiusCurv,bottomRight: radiusCurv,bottomLeft: radiusCurv,topLeft:const Radius.circular(3)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
            margin: const EdgeInsets.only(bottom: 8),

            child: Column(
              children: [
                if(text case final text?)MarkdownBody(data: text),
                if(image case final image?)image,
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//==================================================


// class MessageWidget extends StatelessWidget {
//   final String? text;
//   final bool isFromUser;
//   final Image? image;
//   const MessageWidget(
//       {super.key, required this.text, required this.isFromUser,this.image});
//   @override
//   Widget build(BuildContext context) {
//     Radius radiusCurv = Radius.circular(20);
//     return Row(
//       mainAxisAlignment:
//           isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
//       children: [
//         Flexible(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
              
//               constraints: const BoxConstraints(maxWidth: 350),
//               decoration: BoxDecoration(
//                 color: isFromUser
//                     ? const Color.fromARGB(255, 105, 105, 105)
//                     : const Color.fromARGB(255, 23, 110, 181),
//                 borderRadius: isFromUser?  BorderRadius.only( topLeft: radiusCurv,bottomLeft: radiusCurv,bottomRight: radiusCurv,topRight:const Radius.circular(3)):
//                 BorderRadius.only(topRight: radiusCurv,bottomRight: radiusCurv,bottomLeft: radiusCurv,topLeft:const Radius.circular(3)),
//               ),
//               padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//               margin: const EdgeInsets.only(bottom: 8),
//               child: Column(
//                 children: [
//                    if(text case final text?)MarkdownBody(data: text),
//                  if(image case final image?)image,
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
