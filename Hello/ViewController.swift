//
//  ViewController.swift
//  Hello
//  dealing with view logic
//  if you need to deal with business logic please implement in Model
//  Created by admin on 20/8/2561 BE.
//  Copyright © 2561 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var lblHello: UILabel!
    @IBOutlet weak var txtName_Change: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblHello.text = "Hello world after viewDidLoad"
        // Do any additional setup after loading the view, typically from a nib.
    }
    //Convert : Transform the object.Tran gender
    //Cast   : Represent the object with
    
    @IBAction func changeTheme(_ sender: Any) {
        view.backgroundColor = UIColor.black
        for eachView in view.subviews{
            eachView.backgroundColor = UIColor.black
            if let label = eachView as? UILabel { // This the cast
                label.textColor = UIColor.white
            }
            
        }
    }
    @IBAction func sayHi_Click(_ sender: Any) {
        self.lblHello.text = "Hello \(self.txtName_Change.text!)"
        print("")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

