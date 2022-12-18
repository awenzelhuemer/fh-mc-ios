//
//  SecondViewController.swift
//  StoryboardTest
//
//  Created by Andreas Wenzelhuemer on 15.12.22.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.title = "Test"
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
