//
//  ViewController.swift
//  PinApp
//
//  Created by Andreas Wenzelhuemer on 17.12.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelPin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelPin.text = ""
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(self.clearPIN(notification:)), name: Notification.Name("ClearPIN"), object: nil)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if let buttonTitle = sender.configuration?.title {
            print(buttonTitle)
            if let pin = labelPin.text {
                labelPin.text = pin + buttonTitle
            } else {
                labelPin.text = buttonTitle
            }
        }
    }
    
    deinit {
      NotificationCenter.default.removeObserver(self, name: Notification.Name("ClearPIN"), object: nil)
    }
    
    
    @objc func clearPIN(notification: Notification) {
        print("clearPIN")
        labelPin.text = ""
    }
}

