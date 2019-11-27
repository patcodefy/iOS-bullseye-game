//
//  WebViewController.swift
//  bulls-eyeUiKit
//
//  Created by pat on 11/27/19.
//  Copyright © 2019 pat. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView:WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myUrl = URL(string: "https://www.patrickiradukunda.com/")
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
        // Do any additional setup after loading the view.
    }
    @IBAction func close (){
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
