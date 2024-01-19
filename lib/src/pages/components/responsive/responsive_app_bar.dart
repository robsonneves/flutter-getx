import 'package:flutter/material.dart';

class ResponsiveAppBar extends StatelessWidget {
  const ResponsiveAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 1,
      title: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: const Row(
          children: [
            Text(
              'Flutter',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}


// Assistir aula 40 
// 