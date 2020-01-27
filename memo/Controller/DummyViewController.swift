//
//  DummyViewController.swift
//  memo
//
//  Created by Tomone Saito on 2019/12/18.
//  Copyright © 2019 geeksalon. All rights reserved.
//

import UIKit
import Charts

class DummyViewController: UIViewController {
    var valuee = 12.5
    var categoryArray = ["外向的思考","内向的思考","外向的感覚","内向的感覚","内向的直感","外向的直感","外向的感情","内向的感情"]
    var dataEntries = [ChartDataEntry]()
    @IBOutlet weak var pieChartsView: PieChartView!
    var colorArray = [UIColor(red:178/255,green:255/255,blue:101/255,alpha:1.0),UIColor(red:255/255,green:178/255,blue:101/255,alpha:1.0),UIColor(red:0/255,green:203/255,blue:0/255,alpha:1.0),UIColor.cyan,UIColor(red:219/255,green:187/255,blue:255/255,alpha:1.0),UIColor(red:101/255,green:140/255,blue:255/255,alpha:1.0),UIColor(red:255/255,green:255/255,blue:101/255,alpha:1.0),UIColor(red:255/255,green:153/255,blue:153/255,alpha:1.0)]
    
    override func viewDidLoad() {
      super.viewDidLoad()
      // 円グラフの中心に表示するタイトル
      self.pieChartsView.centerText = "性格タイプ"
       
      // グラフに表示するデータのタイトルと値
      for i in 0...7{
        dataEntries.append(PieChartDataEntry(value: 12.5, label: categoryArray[i]))
      }
        // グラフに表示するデータのタイトルと値
        let dataEntries = [
            PieChartDataEntry(value: 12.5, label: "外向直感"),
            PieChartDataEntry(value: 25, label: "外向思考"),
            PieChartDataEntry(value: 25, label: "内向感情"),
            PieChartDataEntry(value: 37.5, label: "内向感覚")
        ]
        
        let dataSet = PieChartDataSet(entries: dataEntries, label: "")

        // グラフの色
        dataSet.colors = [UIColor(red:219/255,green:187/255,blue:255/255,alpha:1.0),UIColor(red:0.8,green:1.0,blue:0.5,alpha:0.5),UIColor(red:240/255,green:128/255,blue:128/255,alpha:1.0),UIColor.cyan]
        // グラフのデータの値の色
        dataSet.valueTextColor = UIColor.black
        // グラフのデータのタイトルの色
        dataSet.entryLabelColor = UIColor.black

        self.pieChartsView.data = PieChartData(dataSet: dataSet)
        
        // データを％表示にする
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        formatter.multiplier = 1.0
        self.pieChartsView.data?.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        self.pieChartsView.usePercentValuesEnabled = true
        
        view.addSubview(self.pieChartsView)
    }
}
