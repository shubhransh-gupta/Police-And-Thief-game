//
//  ViewController.swift
//  GhostAndPolice
//
//  Created by Shubhransh Gupta on 21/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var columnsTextField: UITextField!
    @IBOutlet weak var rowsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func OnPressOfGenerateCTA(_ sender: Any) {
        let vc = GridsViewController()
        vc.rows = Int(rowsTextField.text ?? "") ?? 5
        vc.columns = Int(columnsTextField.text ?? "") ?? 4
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

