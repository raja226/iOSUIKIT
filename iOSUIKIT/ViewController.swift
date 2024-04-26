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
        
        //Generic Type of function call :
        print( self.compareTwoObjects(a: 5, b: 5))
        
        print(self.compareTwoObjectsThribleEquable(a: "5", b: "5"))
        
        //Generic check in class:
        var obj = Person<String>()
        obj.addStrudent(obj: "GOGUL")
        obj.addStrudent(obj: "Raj")
        print(obj.students)
        print(obj.printLastObj())
        
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
    
    private func compareTwoObjects<T:Equatable>(a: T, b:T) -> Bool
    {
        return a == b
    }
    
    private func compareTwoObjectsThribleEquable<T>(a: T, b:T) -> Bool
    {
        return a as AnyObject === b as AnyObject
    }
    
    
}

struct Person<T>
{
    var students = [T]()
    
    mutating func addStrudent(obj:T)
    {
        students.append(obj)
    }
    
    mutating func printLastObj()
    {
        print(students.popLast() ?? [])
        students.popLast()
    }
}
