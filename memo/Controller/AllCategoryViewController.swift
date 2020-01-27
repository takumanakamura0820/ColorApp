//
//  allCtegoryViewController.swift
//  memo
//
//  Created by Tomone Saito on 2019/12/18.
//  Copyright © 2019 geeksalon. All rights reserved.
//

import UIKit

class AllCategoryViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet var categoryTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTableView.dataSource = self
        categoryTableView.register(UINib(nibName: "AllCategoryTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "categoryCell")
        categoryTableView.rowHeight = 100
        categoryTableView.tableFooterView = UIView()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as! AllCategoryTableViewCell
        switch indexPath.row {
        case 0:
            cell.categoryTextView.text = "内向感情 喜怒哀楽内包型 → 大人しいけれど実は豊かな感情を秘める"
            cell.categoryTextView.textColor = UIColor(red: 250/250, green: 22/250, blue: 0/250, alpha: 1)
            
        case 1:
            cell.categoryTextView.text = "内向思考 理屈先行型 → 物事に常に論理と意味を求める"
            cell.categoryTextView.textColor = UIColor(red: 250/250, green: 150/250, blue: 0/250, alpha: 1)
            
        case 2:
            cell.categoryTextView.text = "外向感情 ストレート反応型 → 好き嫌い/快不快の判断が早い"
            cell.categoryTextView.textColor = UIColor(red: 250/250, green: 220/250, blue: 0/250, alpha: 1)
            
        case 3:
            cell.categoryTextView.text = "外向感覚 自己プロデュース型 → 自分の感覚を羅針盤にする"
            cell.categoryTextView.textColor = UIColor(red: 0/250, green: 220/250, blue: 0/250, alpha: 1)
            
        case 4:
            cell.categoryTextView.text = "外向思考 心よりモノ重視型 → 物事を冷徹に分析する"
            cell.categoryTextView.textColor = UIColor(red: 155/250, green: 220/250, blue: 0/250, alpha: 1)
            
        case 5:
            cell.categoryTextView.text = "内向感覚 マイワールド型 → 独特な感性で自分の世界を築いていく"
            cell.categoryTextView.textColor = UIColor(red: 0/250, green: 230/250, blue: 240/250, alpha: 1)
            
        case 6:
            cell.categoryTextView.text = "外向直感　アイデア瞬発型 → 本質を見抜いてひらめきを発揮する"
            cell.categoryTextView.textColor = UIColor(red: 0/250, green: 50/250, blue: 240/250, alpha: 1)
        case 7:
            cell.categoryTextView.text = "内向直感 不思議ちゃん型 → 見えないものを見通す目を持つ"
            cell.categoryTextView.textColor = UIColor(red: 135/250, green: 90/250, blue: 204/250, alpha: 1)
        default:
            cell.categoryTextView.text = ""
        }
        
        return cell
    }
    
    
//    ["外向的思考","内向的思考","外向的感覚","内向的感覚","内向的直感","外向的直感","外向的感情","内向的感情"]
//
//
//    var colorArray = [UIColor(red:178/255,green:255/255,blue:101/255,alpha:1.0),UIColor(red:255/255,green:178/255,blue:101/255,alpha:1.0),UIColor(red:0/255,green:203/255,blue:0/255,alpha:1.0),UIColor.cyan,UIColor(red:219/255,green:187/255,blue:255/255,alpha:1.0),UIColor(red:101/255,green:140/255,blue:255/255,alpha:1.0),UIColor(red:255/255,green:255/255,blue:101/255,alpha:1.0),UIColor(red:255/255,green:153/255,blue:153/255,alpha:1.0)]
}
