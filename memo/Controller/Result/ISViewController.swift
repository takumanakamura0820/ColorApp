//
//  ISViewController.swift
//  memo
//
//  Created by Tomone Saito on 2019/12/12.
//  Copyright © 2019 geeksalon. All rights reserved.
//

import UIKit

class ISViewController: UIViewController,UITextViewDelegate {
    
    //UITextfieldに紐づいてる
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet var memoTextView: UITextView!
    var dateVariable :String!
    
    //UIDatePickerを定義するための変数
    var datePicker: UIDatePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ピッカー設定
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        dateField.inputView = datePicker
        
        // 決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        // インプットビュー設定(紐づいているUITextfieldへ代入)
        dateField.inputView = datePicker
        dateField.inputAccessoryView = toolbar
    }
    
    //    キーボードの出し入れ
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(self.memoTextView.isFirstResponder){
            self.memoTextView.resignFirstResponder()
        }
    }
    
    
    // UIDatePickerのDoneを押したら発火
          @objc func done() {
              dateField.endEditing(true)
              
              // 日付のフォーマット
              let formatter = DateFormatter()
              
              //"yyyy年MM月dd日"を"yyyy/MM/dd"したりして出力の仕方を好きに変更できるよ
              formatter.dateFormat = "yyyy/MM/dd"
              
              //(from: datePicker.date))を指定してあげることで
              //datePickerで指定した日付が表示される
             
              dateVariable = "\(formatter.string(from: datePicker.date))"
               dateField.text = dateVariable
              
              
              
          }
    
    //関連付け忘れずに
    @IBAction func save(){
        let inputText = memoTextView.text
        let ud = UserDefaults.standard
        //初めて記入するかどうか
        //すでに書いたことがある場合
        if ud.array(forKey: "memoArray") != nil {
            
            //userdefaultsからmemoarrayとcategoryarrayを呼び出してくる
            var saveMemoArray = ud.array(forKey:"memoArray") as! [String]
            var categoryArray = ud.array(forKey: "categoryArray")as! [Int]
            var saveDateArray = ud.array(forKey:"dateArray") as! [String]
            //textviewに文字が入力されているかどうか
            if inputText != ""  && dateField.text != ""{
                //入力されていたら
                saveMemoArray.append(inputText!)
//数字変更忘れずに
                categoryArray.append(4)
                
                saveDateArray.append(dateVariable)
                //白紙にする
                memoTextView.text = ""
                dateField.text = ""
                
            } else {
                //入力されていなかったら
                print("何も入力されていません")
            }
            ud.set(saveMemoArray, forKey:"memoArray")
            ud.set(categoryArray, forKey: "categoryArray")
            ud.set(saveDateArray, forKey: "dateArray")
        }else{
            //初めて書く場合
            var newMemoArray = [String]()
            var newCategoryArray = [Int]()
            var newDateArray = [String]()
            //テキストビューとDatefieldに文字が入っているかどうか
            if inputText != "" && dateField.text != ""{
                //入っている場合newMemoArrayに追加
                newMemoArray.append(inputText!)
//数字変更忘れずに
                newCategoryArray.append(4)
                
                newDateArray.append(dateVariable)
                //白紙にする
                memoTextView.text = ""
                dateField.text = ""
            } else {
                print("何も入力されていません")
            }
            ud.set(newMemoArray,forKey: "memoArray")
            ud.set(newCategoryArray,forKey: "categoryArray")
            ud.set(newDateArray, forKey: "dateArray")
            
        }

        ud.synchronize()
        
    }
    
}

