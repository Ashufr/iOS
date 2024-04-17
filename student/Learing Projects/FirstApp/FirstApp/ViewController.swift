//
//  ViewController.swift
//  FirstApp
//
//  Created by Student on 19/02/24.
//

import UIKit

class ViewController: UIViewController {
    var y = 30
    var x = 30
    var c = 20
    @IBOutlet var myButton: UIButton!
    @IBOutlet var name: UITextField!
    
    @IBOutlet weak var myLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hello World!")
        myButton.tintColor = .red
        name.placeholder = "Name"
    }
    @IBAction func buttonPressed(_ sender: Any) {
//        print(sender)
//        if let nameText = name.text {
//            print(nameText)
//            myLabel.text = "Welcome Back \(nameText)"
//        }
//        print("Hello Button")
//        if(myButton.tintColor == .red){
//            myButton.tintColor = .blue
//        }else {
//            myButton.tintColor = .red
//        }
        
        let heading = UILabel(frame: CGRect(x: x, y: y, width: 200, height: 100))
        y += c
        if(y >= 780){
            c = -20
            y += c
            x += 50
        }
        if(y <= 10){
            c = 20
            y += c
            x += 50
        }
        heading.text = "Sher"
        view.addSubview(heading)
                
    }
  
}


