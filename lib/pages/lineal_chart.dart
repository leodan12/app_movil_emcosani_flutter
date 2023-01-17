

import 'package:appemcosani/utils/responsive.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/src/text_element.dart' as elements;
import 'package:charts_flutter/src/text_style.dart' as styles;
import 'package:flutter/material.dart';
import 'dart:math';

class LinearChart extends StatelessWidget {
  const LinearChart({super.key});
  static String? pointerAmount;
  static String? pointerDay;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final data = [
      Expenses(1, 5000),
      Expenses(2, 1500),
      Expenses(3, 1500),
      Expenses(4, 800),
      Expenses(5, 1500),
      Expenses(6, 1500),
      Expenses(7, 3700),
    ];

    List<charts.Series<Expenses,int>> series = [
      charts.Series<Expenses,int>(
        id: 'Lineal',
        domainFn: (v,i) => v.day,
        measureFn: (v,i) => v.expense,
        data: data,
      )
    ];


    return Center(
      child: SizedBox(
        height: responsive.hp(80),
        width: responsive.wp(90),
        child: charts.LineChart(
          series,
          selectionModels: [
            charts.SelectionModelConfig(
              changedListener: (charts.SelectionModel model){
                if(model.hasDatumSelection){
                  pointerAmount = model.selectedSeries[0]
                  .measureFn(model.selectedDatum[0].index)
                  ?.toStringAsFixed(2);
                  pointerDay = model.selectedSeries[0]
                  .domainFn(model.selectedDatum[0].index)
                  ?.toString();
                }
              }
            ),
          ],
          behaviors: [
            charts.LinePointHighlighter(
              symbolRenderer: MySymbolRenderer(),
            ),
          ],
        ),
      ),
    );
  }
}

class MySymbolRenderer extends charts.CircleSymbolRenderer{
  @override
  void paint(
    charts.ChartCanvas canvas, 
    Rectangle<num> bounds, 
    {List<int>? dashPattern, 
    charts.Color? fillColor, 
    charts.FillPatternType? fillPattern, 
    charts.Color? strokeColor, 
    double? strokeWidthPx}) {
    
    super.paint(
      canvas, 
      bounds, 
      dashPattern: dashPattern, 
      fillColor: fillColor, 
      fillPattern: fillPattern, 
      strokeColor: strokeColor, 
      strokeWidthPx: strokeWidthPx,
      );

      canvas.drawRRect(
        Rectangle(
        bounds.left -25,
        bounds.top -25,
        bounds.width -25,
        bounds.height -25,
      ),
      fill: charts.ColorUtil.fromDartColor(Colors.grey),
      stroke: charts.ColorUtil.fromDartColor(Colors.blue),
      strokeWidthPx: 2,
      );

    var myStyle = styles.TextStyle();
    myStyle.fontSize =10;
    myStyle.color = charts.ColorUtil.fromDartColor(Colors.green);  ;

      canvas.drawText(
        elements.TextElement(
          'Dia ${LinearChart.pointerDay} \n${LinearChart.pointerAmount}',
           style: myStyle,
          ), 
          (bounds.left -20).round(),
          (bounds.top -25).round(),
        ); 
  }
}


class Expenses {
  final int day;
  final double expense;

  Expenses(this.day, this.expense);
  
}