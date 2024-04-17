//
//  ViewController.swift
//  Traffic Lights
//
//  Created by student on 27/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func unwindToRed(unwindSegue : UIStoryboardSegue){
        print("Hello World")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if textField.text != ""{
            segue.destination.navigationItem.title = textField.text
        }
    }

}
