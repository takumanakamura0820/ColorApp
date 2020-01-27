//
//  DetailViewController.swift
//  memo
//
//  Created by Tomone Saito on 2019/10/30.
//  Copyright © 2019 geeksalon. All rights reserved.
//

import UIKit
class DetailViewController: UIViewController {
    var memoArray = [String]()
    var categoryNumberArray = [Int]()
    var dateArray = [String]()
    var number :Int!
    @IBOutlet var categoryLabel : UILabel!
    @IBOutlet var memoTextView : UITextView!
    @IBOutlet var dateLabel : UILabel!
    var categoryArray = ["外向的思考","内向的思考","外向的感情","内向的感情","外向的感覚","内向的感覚","外向的直感","内向的直感"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMemo()
        categoryLabel.text = categoryArray[categoryNumberArray[number]-1]
        memoTextView.text = memoArray[number]
        dateLabel.text = dateArray[number]
        
        
        
    }
    
    func loadMemo() {
    let ud = UserDefaults.standard
    if ud.array(forKey: "memoArray") != nil {
        memoArray = ud.array(forKey: "memoArray") as! [String]
        categoryNumberArray = ud.array(forKey: "categoryArray") as! [Int]
        dateArray = ud.array(forKey: "dateArray") as! [String]
    
    }
    
    }    
}
