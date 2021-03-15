import 'package:flutter/material.dart';
import 'package:flutter_calculadora/calculadora_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'constants.dart' as Constants;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final title = 'Calculadora';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final keys = [
    0, 1, 2, 3, 4,
    5, 6, 7, 8, 9,
    '+', '-', '*', '/',
  ];
  final CalculadoraController controller = CalculadoraController();

  @override
  Widget build(BuildContext context) {
    final double runSpacing = 5.0;
    final double spacing = 5.0;
    final int columns = MediaQuery.of(context).orientation == Orientation.portrait ? 5 : 10;
    final w = (MediaQuery.of(context).size.width - (spacing * 2.0) - runSpacing * (columns - 1)) / columns;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(spacing),
                child: Wrap(
                  runSpacing: runSpacing,
                  spacing: spacing,
                  alignment: WrapAlignment.center,
                  children: List.generate(keys.length, (index) {
                    return Container(
                      width: w,
                      height: w,
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: RaisedButton(
                          onPressed: () => controller.addToOrUpdateOperations(keys[index]),
                          color: Colors.white,
                          child: Text(
                            '${keys[index]}',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Observer(
                    builder: (_) {
                      return RaisedButton(
                        onPressed: controller.canCalculateResults ?
                          controller.calculateResults : null,
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          'Calcular',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Theme.of(context).textTheme.headline5.fontSize,
                          ),
                        ),
                      );
                    }
                  ),
                  Observer(
                    builder: (_) {
                      return RaisedButton(
                        onPressed: controller.canClearOperations ?
                          controller.clearOperations : null,
                        color: Theme
                            .of(context)
                            .primaryColor,
                        child: Text(
                          'Zerar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Theme
                                .of(context)
                                .textTheme
                                .headline5
                                .fontSize,
                          ),
                        ),
                      );
                    }
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Operação: ',
                            style: Theme.of(context).textTheme.headline5
                        ),
                        Flexible(
                          child: Observer(
                            builder: (_) {
                              return Text(
                                  controller.operationText,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline5
                              );
                            }
                          )
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Resultado: ',
                            style: Theme.of(context).textTheme.headline5
                        ),
                        Flexible(
                          child: Observer(
                            builder: (_) {
                              return Text(
                                  controller.results == null ?
                                  Constants.DIV_BY_ZERO_RESULT : controller.results,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline5
                              );
                            }
                          )
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
