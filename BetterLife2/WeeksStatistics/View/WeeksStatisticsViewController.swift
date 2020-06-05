//
//  WeeksStatisticsViewController.swift
//  BetterLife2
//
//  Created by Timur Karimov on 29.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit
import Charts

class WeeksStatisticsViewController: UIViewController {

    var presenter: WeeksStatisticsPresenter!
    //let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    //var months = [1.0,2.0,3.0,4.0,5.0,6.0,7.0]
    let unitsSold = [5.0, 3.0, 4.0, 1.0, 0.0, 2.0, 3.0, 5.0]
    var xList: [String] = []
    let kek = [2.0, 2.0, 1.0, 5.0, 3.0, 0.0, 2.0, 1.0]
    
    var charts: [ChartDataEntry] = [ChartDataEntry(x: 0.0, y: 0.0), ChartDataEntry(x: 1.0, y: 5.0)]
    
    
    var weekStats: [WeekItem] = []
    
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var bottomDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        //setChart0(dataPoints: months, values: unitsSold)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.requestList()
    }
    
    
    func setChart() {
        var emotionEntires: [ChartDataEntry] = []
        var importantEntires: [ChartDataEntry] = []
        
        for i in 0..<weekStats.count {
            let dE = ChartDataEntry(x: Double(i), y: Double(weekStats[i].happiness))
            let dI = ChartDataEntry(x: Double(i), y: Double(weekStats[i].important))
            
            emotionEntires.append(dE)
            importantEntires.append(dI)
        }
        
        let eLineDS = LineChartDataSet(entries: emotionEntires, label: "Счастье")
        eLineDS.colors = [NSUIColor(red: 1, green: 0, blue: 0, alpha: 1.0)]
        eLineDS.circleColors = [NSUIColor(red: 1, green: 0, blue: 0, alpha: 1.0)]
        
        let iLineDS = LineChartDataSet(entries: importantEntires, label: "Важность")
        iLineDS.colors = [NSUIColor(red: 0, green: 0, blue: 1, alpha: 1.0)]
        iLineDS.circleColors = [NSUIColor(red: 0, green: 0, blue: 1, alpha: 1.0)]
        
        let lineChartData = LineChartData(dataSets: [eLineDS,iLineDS])
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: xList)
        lineChartView.xAxis.setLabelCount(weekStats.count, force: true)
        lineChartView.setVisibleYRangeMinimum(0.0, axis: .left)
        lineChartData.calcMinMax(entry: charts[0], axis: .left)
        lineChartView.data = lineChartData
        
        
    }
    
    
    func updateList(list: [WeekItem]) {
        updateLabel(list: list)
        weekStats = list
        xList = []
        for i in 0..<list.count {
            xList.append("\(i+1)")
        }
        setChart()
    }
    
    
    func updateLabel(list: [WeekItem]) {
        bottomDescriptionLabel.text = ""
        for i in 0..<list.count {
            bottomDescriptionLabel.text! += "\(i+1)) Неделя \(list[i].date) \n"
        }
    }
    

    func setChart0(dataPoints: [Double], values: [Double]) {
        lineChartView.noDataText = "You need to provide data for the chart."
            
        var dataEntries: [ChartDataEntry] = []
        var dataEntires2: [ChartDataEntry] = []
        
                
        for i in 0..<dataPoints.count {
            let dataEntry =  ChartDataEntry(x: dataPoints[i], y: unitsSold[i])
            let dataEntry2 = ChartDataEntry(x: dataPoints[i], y: kek[i])
            dataEntries.append(dataEntry)
            dataEntires2.append(dataEntry2)
        }
        
        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Units Sold")
        let lineChartDataSet2 = LineChartDataSet(entries: dataEntires2, label: "Kek")
        lineChartDataSet2.colors = [NSUIColor(red: 1, green: 0, blue: 0, alpha: 1.0)]
        lineChartDataSet.colors = [NSUIColor(red: 0, green: 0, blue: 1, alpha: 1.0)]
        lineChartDataSet.circleColors = [NSUIColor(red: 0, green: 0, blue: 1, alpha: 1.0)]
        lineChartDataSet2.circleColors = [NSUIColor(red: 1, green: 0, blue: 0, alpha: 1.0)]
        let lineChartData = LineChartData(dataSets: [lineChartDataSet2,lineChartDataSet])
        lineChartView.data = lineChartData

    }
}
