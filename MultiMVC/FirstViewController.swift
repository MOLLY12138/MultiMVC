//
//  ViewController.swift
//  MultiMVC
//
//  Created by apple on 2018/12/8.
//  Copyright © 2018年 mlj. All rights reserved.
//

import UIKit

//用协议实现反向传参
protocol StudentProtocol{
    func change(name: String , no: String)
}

class FirstViewController: UIViewController {
    
    var stu = Student()
    
//    func change(name: String, no: String){
//        self.name = name
//        self.no = no
//    }
//
//    var name = ""
//    var no = ""
    
    
    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    //viewDidLoad只会被调用一次
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    //viewWillAppear会被调用多次
    override func viewWillAppear(_ animated: Bool) {
        tfNo.text = stu.no
        tfName.text = stu.name
    }
   
    @IBAction func showSecondVC(_ sender: Any) {

        //从文件里面恢复界面
        let secVC  = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        
        stu.no = tfNo.text!
        stu.name = tfName.text!
        

        secVC.stu = stu
//        secVC.no = stu.no
//        secVC.name = stu.name
//        secVC.delegate = self
        
        //破坏了MVC最基本的一个性质：每个界面的视图只被它自己的控制器控制
//        secVC.tfNo.text = tfNo.text
//        secVC.tfName.text = tfName.text
        self.navigationController?.pushViewController(secVC, animated: true)
//        self.present(secVC, animated: true, completion: nil)
    }
    
    @IBAction func showThirdVC(_ sender: Any) {
        //从文件里面恢复界面
        let thirdVC  = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdVC")
        
        self.present(thirdVC, animated: true, completion: nil)
    }
    
}

