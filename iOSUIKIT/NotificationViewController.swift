//
//  NotificationViewController.swift
//  iOSUIKIT
//
//  Created by Administrator on 25/04/24.
//

import UIKit
import SimpleNetwork

struct YourModel: Codable {
let userID, id: Int
  let title: String
  let completed: Bool

  enum CodingKeys: String, CodingKey {
      case userID = "userId"
      case id, title, completed
  }
}

class NotificationViewController: UIViewController {
    let webservice = Webservice() // Create an instance of Webservice

    override func viewDidLoad() {
        
        super.viewDidLoad()
        getAPICall()
        // Do any additional setup after loading the view.
    }

    
    //Package : Neworkcall
    func getAPICall()
    {
        //URL:https://jsonplaceholder.typicode.com/todos
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            print("Invalid URL")
            return
        }
        
        // Define how you want to parse the response data
        let parseClosure: (Data) -> [YourModel]? = { data in
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([YourModel].self, from: data)
                return result
            } catch {
                print("Error decoding data: \(error)")
                return nil
            }
        }
        // Call the fetch function with the URL and parsing closure
               webservice.fetch(url: url, parse: parseClosure) { result in
                   switch result {
                   case .success(let data):
                       // Data successfully fetched and parsed
                       if let data = data {
                           // Use the fetched data
                           print(data)
                       } else {
                           print("No data received")
                       }
                   case .failure(let error):
                       // Error occurred during fetch or parsing
                       print("Error: \(error)")
                   }
               }
           }
}
