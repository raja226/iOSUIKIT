//
//  ViewController.swift
//  iOSUIKIT
//
//  Created by Administrator on 25/04/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pushTapped(_ sender: Any) {
        
        if let navationVc = navigationController
        {
            let storboard = UIStoryboard(name: "DashBoard", bundle: nil)
            if let vC = storboard.instantiateViewController(identifier: "DashBoardViewController") as? DashBoardViewController
            {
                navationVc.pushViewController(vC, animated: true)
            }
            
        }else
        {
            print("No navigation controller Embaded")
        }
    }
    
    @IBAction func notificationTapped(_ sender: Any) {
        
        if let nav = navigationController
        {
            let noticicationStoryBoard = UIStoryboard(name: "Notification", bundle: nil)
            let vC = noticicationStoryBoard.instantiateViewController(identifier: "NotificationViewController") as NotificationViewController
            nav.pushViewController(vC, animated: true)
        }else
        {
            print("No Naviagtion Embeded")
        }
       
        
        
    }
    
}

