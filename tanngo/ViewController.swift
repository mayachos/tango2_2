//
//  ViewController.swift
//  tanngo
//
//  Created by 山邉瑛愛 on 2021/05/30.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITextFieldDelegate {
    
    let realm = try! Realm()
    let memo = try! Realm().objects(Memo.self)
    var image = UIImage(named: "rillakuma")!
    
    // ドキュメントディレクトリの「ファイルURL」（URL型）定義
    var documentDirectoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

    // ドキュメントディレクトリの「パス」（String型）定義
    let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]

    
    @IBOutlet var tangoTextField: UITextField!
    @IBOutlet var imiTextFiled: UITextField!
    
    var eigotext :String = ""
    var nihongotext :String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tangoTextField.delegate = self
        imiTextFiled.delegate = self
    }
    
    //②保存するためのパスを作成する
     func createLocalDataFile() {
         // 作成するテキストファイルの名前
        let fileName = image.accessibilityIdentifier

         // DocumentディレクトリのfileURLを取得
         if documentDirectoryFileURL != nil {
             // ディレクトリのパスにファイル名をつなげてファイルのフルパスを作る
            let path = documentDirectoryFileURL.appendingPathComponent(fileName!)
             documentDirectoryFileURL = path
         }
     }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let fileUrl = info[UIImagePickerController.InfoKey.imageURL.rawValue] as? URL else { return }
        print(fileUrl.lastPathComponent)
    }
    
    @IBAction func save() {
        let tango: String = tangoTextField.text!
        let imi: String = imiTextFiled.text!
       
    
            let newMemo = Memo()
            newMemo.tango = tango
            newMemo.imi = imi
        newMemo.image=image
        
        
            
            try! realm.write {
                realm.add(newMemo)
            }
        for i in 0..<memo.count{
            print(memo[i].tango)
        }
        
        let alert: UIAlertController = UIAlertController(title: "完了", message: "保存しました",preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default,handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func tangoFieldShouldReturn(_ tangoField: UITextField) -> Bool {
        tangoField.resignFirstResponder()
    }


}

