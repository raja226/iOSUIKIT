//
//  ViewController.swift
//  iOSUIKIT
//
//  Created by Administrator on 25/04/24.
//

import UIKit
import SimpleNetwork

class ViewController: UIViewController {
    
    var myarray :[Any] = [[1,2,3,4],["bab","test"],1,"go"]
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
        
        //Higher order func
        
        var resultofcompactMap =  myarray.compactMap { item in
            
            if let value = item as? [Any]
            {
                return value
            }else
            {
                return nil
            }
            
            // return item
        }
        
        print(resultofcompactMap)
        
        var resultofFlatMap = resultofcompactMap.flatMap { item in
            return item
        }
        
        print(resultofFlatMap)
        
        var resultofMap = resultofFlatMap.map { String(describing: $0)}
        
        print(resultofMap)
        
        
        var integerValue = 100_00
        debugPrint(integerValue)
        
        //Mutilple Line :
        
        var pargraph = """
HI I am Gogula rajasekhar i m  good at ios development and xamarin in flutter need to workout
so could be do it .

Iam happy in this mutiline concept "OM Narayana Adinamryana"

thanks
G Rakaselhar

"""
        
        print(pargraph)
        
        //Array:
        
        var temparature = ["test"]
        debugPrint(temparature)
        temparature = []
        debugPrint(temparature)
        temparature = ["test1","bala"]
        
        debugPrint(temparature)
        
        
        print(stringINterpolation())
        
    }
    
    
    @IBAction func pushTapped(_ sender: Any) {
        
        if let navationVc = navigationController
        {
            let storboard = UIStoryboard(name: "DashBoard", bundle: nil)
            if let vC = storboard.instantiateViewController(identifier: "DashBoardViewController") as? DashBoardViewController
            {
                vC.closureHandlerBlock = { [weak self] data in
                    
                    guard let self = self else {
                        return
                    }
                    print("Receiving the data: \(data)")
                    
                }
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
            if let vC = noticicationStoryBoard.instantiateViewController(identifier: "NotificationViewController") as? NotificationViewController
            {
                nav.pushViewController(vC, animated: true)
                
            }
        }else
        {
            print("No Naviagtion Embeded")
        }
        setConcepts()
        
        parsetheJSONString()
        
        toupleinSwift()
    }
    
    private func compareTwoObjects<T:Equatable>(a: T, b:T) -> Bool
    {
        return a == b
    }
    
    private func compareTwoObjectsThribleEquable<T>(a: T, b:T) -> Bool
    {
        return a as AnyObject === b as AnyObject
    }
    
    
    func stringINterpolation() -> String
    
    {
        var firstName = "Raja"
        var lastName = "Sekhar"
        var name = "\(firstName) \(lastName)"
        return name
    }
    
    func typeannotation()
    {
        var number = 123
        print(number)
    }
    
    func setConcepts()
    {
        //In Swift, a set is an unordered collection of unique elements.
        
        var setArray = Set([1,1,2,3,3])
        print(setArray)
        
        var anySet = Set<Int>()
        anySet.insert(1)
        anySet.insert(2)
        anySet.insert(3)
        anySet.insert(4)
        anySet.insert(1)
        anySet.insert(2)
        anySet.insert(3)
        anySet.insert(4)
        
        print(anySet)
        
    }
    
    func toupleinSwift()
    {
        //Tuples in Swift are lightweight data structures used to group multiple values together into a single compound value.
        /*
         1.Returning Multiple Values from Functions:
         2.Passing Data Between Components:(parent View to child view
         3.
         */
        
        
        var persontouple:(String, Int) = ("Rajasekhar",31)
        //Access
        
        print("\(persontouple.0) and \(persontouple.1)")
        
        
        
        //        func apiFetch() -> (data:Data?, error:Error?)
        //        {
        //            if let data = responseData
        //            {
        //                return (data,nil)
        //            }else
        //            {
        //                return (nil,APIEror.notFound)
        //            }
        //        }
        
        //        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //            if segue.identifier == "ShowDetail" {
        //                if let destinationVC = segue.destination as? DetailViewController {
        //                    destinationVC.data = ("Title", "Description")
        //                }
        //            }
        //        }
        
    }
    
    
    func parsetheJSONString()
    {
        
        // Properly formatted JSON string
        let myJsonString = """
            {
                "name": "Rajasekhar",
                "age": 33,
                "email": "iosrajasekhar@gmail.com"
            }
            """
        
        debugPrint(myJsonString)
        
        
        //String to Data :
        
        guard let data = myJsonString.data(using: .utf8) else {
            return
        }
        debugPrint(data)
        
        //Data -> Decoder :
        do
        {
            var decoder = JSONDecoder()
            var result = try decoder.decode(RajasekharStruct.self, from: data)
            debugPrint(result)
        }
        catch
        {
            print("Error in JSON parsing")
        }
        
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


struct RajasekharStruct: Codable
{
    var name: String?
    var age: Int?
    var email: String?
}
