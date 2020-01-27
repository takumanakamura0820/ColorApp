//
//  ViewController.swift
//  memo
//
//  Created by Tomone Saito on 2019/10/30.
//  Copyright © 2019 geeksalon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate  {
    
    var colorArray = [UIColor(red:178/255,green:255/255,blue:101/255,alpha:1.0),UIColor(red:255/255,green:178/255,blue:101/255,alpha:1.0),UIColor(red:0/255,green:203/255,blue:0/255,alpha:1.0),UIColor.cyan,UIColor(red:219/255,green:187/255,blue:255/255,alpha:1.0),UIColor(red:101/255,green:140/255,blue:255/255,alpha:1.0),UIColor(red:255/255,green:255/255,blue:101/255,alpha:1.0),UIColor.red,UIColor.red
]
        var categoryArray = ["外向的思考","内向的思考","外向的感覚","内向的感覚","内向的直感","外向的直感","外向的感情","内向的感情"]
    var memoArray = [String]()
     var categryArray = [Int]()
     var dateArray = [String]()
    
    @IBOutlet var memoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        memoTableView.dataSource = self
        memoTableView.delegate = self
         loadMemo()
        memoTableView.register(UINib(nibName: "DiaryTableViewCell", bundle: nil), forCellReuseIdentifier: "MemoCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        loadMemo()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell") as! DiaryTableViewCell
        cell.commentLabel?.text = memoArray[indexPath.row]
      
        for kk in stride(from: 1, to: colorArray.count ,by: 1){
          if categryArray[indexPath.row] == kk{
            cell.categoryLabel.text = categoryArray[kk-1]
            cell.categoryLabel.textColor = colorArray[kk-1]
          }
        }
       

        
        //数字とカテゴリーをリンクさせる
        if categryArray[indexPath.row] == 1{
            cell.categoryLabel.text = "外向的思考"
        }else if (categryArray[indexPath.row] == 2){
            cell.categoryLabel.text = "内向的思考"
        }else if (categryArray[indexPath.row] == 3){
            cell.categoryLabel.text = "外向的感覚"
        }else if (categryArray[indexPath.row] == 4){
            cell.categoryLabel.text = "内向的感覚"
        }else if (categryArray[indexPath.row] == 5){
            cell.categoryLabel.text = "内向的直感"
        }else if (categryArray[indexPath.row] == 6){
            cell.categoryLabel.text = "外向的直感"
        }else if (categryArray[indexPath.row] == 7){
            cell.categoryLabel.text = "外向的感情"
        }else if (categryArray[indexPath.row] == 8){
            cell.categoryLabel.text = "内向的感情"
        }
        cell.dateLabel.text = dateArray[indexPath.row]
        return cell
    }
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      self.performSegue(withIdentifier: "toDetail", sender: indexPath.row)
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
      let detailViewController = segue.destination as! DetailViewController
      let selectedIndex = memoTableView.indexPathForSelectedRow!
      detailViewController.number = selectedIndex.row
        }else{
            
        }
       
    }
    
    func loadMemo() {
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil {
            memoArray = ud.array(forKey: "memoArray") as! [String]
            categryArray = ud.array(forKey: "categoryArray") as! [Int]
            dateArray = ud.array(forKey: "dateArray") as! [String]
            
            memoTableView.reloadData()
        }
    }
    
}
