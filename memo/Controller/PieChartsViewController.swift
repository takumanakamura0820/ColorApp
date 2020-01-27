//
//  PieChartsViewController.swift
//  memo
//
//  Created by Tomone Saito on 2019/11/11.
//  Copyright © 2019 geeksalon. All rights reserved.
//

import UIKit
import Charts

class PieChartsViewController: UIViewController {
    
    @IBOutlet weak var pieChartsView: PieChartView!
    @IBOutlet weak var label:UILabel!
    
    
    var categoryNumberArray = [Int]()
    
    var categoryArray = ["外向的思考","内向的思考","外向的感覚","内向的感覚","内向的直感","外向的直感","外向的感情","内向的感情"]
    var doubleRate = [Double]()
    
    var colorArray = [UIColor(red:178/255,green:255/255,blue:101/255,alpha:1.0),UIColor(red:255/255,green:178/255,blue:101/255,alpha:1.0),UIColor(red:0/255,green:203/255,blue:0/255,alpha:1.0),UIColor.cyan,UIColor(red:219/255,green:187/255,blue:255/255,alpha:1.0),UIColor(red:101/255,green:140/255,blue:255/255,alpha:1.0),UIColor(red:255/255,green:255/255,blue:101/255,alpha:1.0),UIColor(red:255/255,green:153/255,blue:153/255,alpha:1.0)]
    
    
    //画面が呼び出された時に読み込まれる
    override func viewDidLoad() {
        super.viewDidLoad()
        //画面読み込み
        refresh()
    }
    
    
    
    @IBAction func refresh(){
        var dataEntries = [ChartDataEntry]()
        let ud = UserDefaults.standard
        //categoryArrayにデータが入ってるかどうか
        if ud.array(forKey: "categoryArray") == nil {
            label.text = "データを入力してください"
        }else{
            //適当な配列(list)を宣言してuserdefaultsからカテゴリーの入った配列を呼び出して、listに入れた
            categoryNumberArray = ud.array(forKey: "categoryArray") as! [Int]

            //listの中の要素数をカテゴリごとにカウント
            //カテゴリーの個数に合わせて変える
            let counter = NSCountedSet(array: categoryNumberArray)
            let counts = [1, 2, 3, 4, 5, 6, 7, 8].map { ($0, counter.count(for: $0)) }
            
            //(counts[0].0)がlistの中にある1の数
            //カテゴリーの各割合を計算
            for i in 0...(categoryArray.count - 1){
                let pieRate = Double(counts[i].1) / Double(categoryNumberArray.count) * 100
                doubleRate.append(pieRate)
            }
            
            
            // 円グラフの中心に表示するタイトル
            self.pieChartsView.centerText = "性格タイプ"
            // グラフに表示するデータのタイトルと値
            for i in 0...(categoryArray.count - 1){
                dataEntries.append(PieChartDataEntry(value: doubleRate[i], label: categoryArray[i]))
            }
            
            //0％の(データを入れていない)時、値表示が消える
            for k in 0...dataEntries.count-1{
                //Kは0から7
                // dataEntries.count-1 0から7を8回繰り返している
                // print("k: \(k)")
                
                if counts[k].1 == 0{
                    //counts[k].1　数値0のものが5個ある
                    dataEntries[k] = PieChartDataEntry(value:0, label: nil)
                    print(dataEntries)
                    //dataEntries[k] 何も入れてないのが5回
                    //PieChartDataEntry(value:0, label: nil) 要素数8
                }else{
                }
            }
            
            let dataSet = PieChartDataSet(entries: dataEntries, label: "")
            //色をカテゴリーごとにわけるところ
            //            dataSet.colors = ChartColorTemplates.joyful()
            dataSet.colors = colorArray
            // グラフのデータの値の色
            dataSet.valueTextColor = UIColor.black
            // グラフのデータのタイトルの色
            dataSet.entryLabelColor = UIColor.black
            //グラフの表示
            self.pieChartsView.data = PieChartData(dataSet: dataSet)
            
            
            // データを％表示にする
            let formatter = NumberFormatter()
            formatter.numberStyle = .percent
            formatter.maximumFractionDigits =  0
            formatter.multiplier = 1.0
            self.pieChartsView.data?.setValueFormatter(DefaultValueFormatter(formatter: formatter))
            self.pieChartsView.usePercentValuesEnabled = true
            
            view.addSubview(self.pieChartsView)
            
            
            
        }
        
    }
    
}

