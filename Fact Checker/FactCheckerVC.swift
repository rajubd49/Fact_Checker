//
//  FactCheckerVC.swift
//  Fact Checker
//
//  Created by Raju on 27/3/20.
//  Copyright © 2020 Raju. All rights reserved.
//

import UIKit

class FactCheckerVC: UIViewController {

    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func prepareUrlDetail(urlModel: URLModel?) {
        DispatchQueue.main.async {
            if let urlModel = urlModel {
                self.titleLabel.text = urlModel.title
                self.bodyLabel.text = urlModel.body
            } else {
                self.titleLabel.text = "URL record unavailable"
                self.bodyLabel.text = ""
            }
        }
    }

    @IBAction func checkButtonAction(_ sender: Any) {
        self.view.endEditing(true)
        let taskManager = TaskManager.shared
        if let urlString = urlTextField.text {
            taskManager.checkUrl(urlString: urlString) { (urlModel) in
                if let urlModel = urlModel {
                    self.prepareUrlDetail(urlModel: urlModel)
                } else {
                    self.prepareUrlDetail(urlModel: nil)
                }
            }
        }
    }
    
    @IBAction func facebookSigninAction(_ sender: Any) {
    }
    
}

