// import 'package:flutter/material.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppBar({super.key});

//   final linearColor = const LinearGradient(
//     colors: [Colors.blueAccent, Colors.redAccent],
//   );

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 70,
//         width: double.infinity,
//         child: ShaderMask(
//           shaderCallback: (bounds) {
//             return linearColor.createShader(
//               Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              
//             );
//           },child: Text(data),
//         ));
//   }
// }
