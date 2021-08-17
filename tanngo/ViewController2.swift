//
//  ViewController2.swift
//  tanngo
//
//  Created by 山邉瑛愛 on 2021/07/11.
//

import UIKit
import RealmSwift

class ViewController2: UIViewController {
    
    let realm = try! Realm()
    let memo = try! Realm().objects(Memo.self)
    
    @IBOutlet var eitangolabel :UILabel!
    @IBOutlet var nihongolabel :UILabel!
    @IBOutlet var tangokakusubutton :UIButton!
    @IBOutlet var nihongodasubutton :UIButton!
    
    var a : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
            eitangolabel.text = memo[a].tango
            nihongolabel.text = memo[a].imi
    }
    
   
    
    @IBAction func mae(){
        if a > 0 - 1 {
            a = a - 1
    }else{
        a = memo.count
    }
        setUI()
    }
    
    @IBAction func tugi(){
        if a < memo.count - 1 {
            a = a + 1
    }else{
    a = 0
    }
        
        setUI()
    }
    func setUI(){
        eitangolabel.text = memo[a].tango
        nihongolabel.text = memo[a].imi
    }
    
    @IBAction func kakusu() {
        if eitangolabel.isHidden == false {
                eitangolabel.isHidden = true
            }else{
                eitangolabel.isHidden = false
        }
    }
    

        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
