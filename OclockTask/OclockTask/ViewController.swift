//
//  ViewController.swift
//  OclockTask
//
//  Created by apple on 15/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
                let parameters = ["API_KEY": "atelierwyrnmfxjksfi"]
        
                    guard let url = URL(string: "https://www.atelier-cocktail.com/API/cocktail/sync") else { return }
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
                    request.httpBody = httpBody
        
                    let session = URLSession.shared
                    session.dataTask(with: request) { (data, response, error) in
                        if let response = response {
                            print(response)
                        }
        
                        if let data = data {
                            do {
                                let json = try JSONSerialization.jsonObject(with: data, options: [])
                                print(json)
                            } catch {
                                print(error)
                            }
                        }
        
                        }.resume()
        
                }

        
    }




