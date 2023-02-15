//
//  Viki.swift
//  Project16
//
//  Created by Emre Bakır on 11.01.2023.
//

import UIKit
import WebKit

class Viki: UIViewController, WKNavigationDelegate {
    var websiteToLoad: String = ""
    var webView: WKWebView!
    var allowedDomain = "wikipedia.org"
    
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://" + websiteToLoad)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            title = webView.title
        }
        
        // Decide whether the navigation is allowed or not.
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            let url = navigationAction.request.url
            
            if let host = url?.host {
                if host.contains(allowedDomain) {
                    decisionHandler(.allow)
                    return
                }
            }
            let alertController = UIAlertController(title: "WARNING!", message: "This website is blocked!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            present(alertController, animated: true)
            decisionHandler(.cancel)
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
