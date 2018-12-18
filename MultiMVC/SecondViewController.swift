//
//  SecondViewController.swift
//  MultiMVC
//
//  Created by apple on 2018/12/8.
//  Copyright © 2018年 mlj. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{

    var delegate: StudentProtocol?
//    var name = ""
//    var no = ""

    var stu: Student!
    
    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfNo.text = stu.no
        tfName.text = stu.name
    }

    
    @IBAction func Back(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
        
        stu.no = tfNo.text!
        stu.name = tfName.text!
        
        //破坏了MVC的性质，造成了强耦合，是错误的做法
//        for vc in self.navigationController!.viewControllers{
//            if let firstVC = vc as? FirstViewController{
//                firstVC.no = no
//                firstVC.name = name
//            }
//        }
        
        delegate?.change(name: stu.name, no: stu.no)
        
        navigationController?.popViewController(animated: true)
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
