//
//  LineChartView.swift
//  Tender App
//
//  Created by Roman Rakhlin on 4/17/22.
//

import SwiftUI
import Charts

struct OffersChart: View {
    
    @Binding var entries: [ChartDataEntry]
   
    var body: some View {
        VStack{
            Spacer()
            MultiLineChartView(entries: entries)
            .frame(height: 220)
            Spacer()
        }
    }
}

struct MultiLineChartView : UIViewRepresentable {
    
    var entries: [ChartDataEntry]
    
    func makeUIView(context: Context) -> LineChartView {
        let chart = LineChartView()
        return createChart(chart: chart)
    }
    
    func updateUIView(_ uiView: LineChartView, context: Context) {
        uiView.data = addData()
    }
    
    func createChart(chart: LineChartView) -> LineChartView{
        let lineChartView = LineChartView()
        
        lineChartView.legend.enabled = false
        lineChartView.rightAxis.enabled = false
        lineChartView.doubleTapToZoomEnabled = false
        lineChartView.scaleXEnabled = false
        lineChartView.scaleYEnabled = false
        lineChartView.highlightPerDragEnabled = false
        lineChartView.highlightPerTapEnabled = false
        lineChartView.xAxis.axisMaxLabels = 10
        
        lineChartView.data = addData()
        
        return lineChartView
    }
    
    func addData() -> LineChartData {
        let data = LineChartData(dataSets: [
            //Schedule Trips Line
            generateLineChartDataSet(dataSetEntries: entries, color: UIColor(Color.red), fillColor: UIColor(Color.clear)),
        ])
        
        return data
    }
    
    func generateLineChartDataSet(dataSetEntries: [ChartDataEntry], color: UIColor, fillColor: UIColor) -> LineChartDataSet{
        let dataSet = LineChartDataSet(entries: dataSetEntries, label: "")
        dataSet.colors = [color]
        dataSet.mode = .cubicBezier
        dataSet.circleRadius = 5
        dataSet.circleHoleColor = UIColor(Color(#colorLiteral(red: 0.003921568627, green: 0.231372549, blue: 0.431372549, alpha: 1)))
        dataSet.fill = Fill.fillWithColor(fillColor)
        dataSet.drawFilledEnabled = true
        dataSet.setCircleColor(UIColor.clear)
        dataSet.lineWidth = 2
        dataSet.valueTextColor = color
        dataSet.valueFont = UIFont(name: "Avenir", size: 12)!
        
        return dataSet
    }
}
