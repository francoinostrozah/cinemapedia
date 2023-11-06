import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    Stream<String> getLoadingMessage() {
      final message = <String>[
        'Cargando Películas',
        'Comprando palomitas de maíz',
        'Cargando Populares',
        'Llamando a mi novia',
        'Ya mero...',
        'Esto está tardando más de lo esperado'
      ];

      return Stream.periodic(
              const Duration(milliseconds: 1200), (step) => message[step])
          .take(message.length);
    }

    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Espere por favor'),
        const SizedBox(
          height: 10,
        ),
        const CircularProgressIndicator(
          strokeWidth: 2,
        ),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder(
            stream: getLoadingMessage(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Cargando...');

              return Text(snapshot.data!);
            }),
      ]),
    );
  }
}
