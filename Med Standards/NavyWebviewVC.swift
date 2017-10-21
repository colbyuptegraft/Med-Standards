//
//  NavyWebviewVC.swift
//  Med Standards
//
//  Created by Colby Uptegraft on 6/1/15.
//  Copyright (c) 2015 ColbyCo. All rights reserved.
//

import UIKit

class NavyWebviewVC: UIViewController, UIWebViewDelegate {
    
    @IBOutlet var navyWebview: UIWebView!
    
    var docController: UIDocumentInteractionController?
    let downloadIcon:UIImage = UIImage(named: "download.png")!
    let redoIcon:UIImage = UIImage(named: "redo.png")!
    let backArrow:UIImage = UIImage(named: "backArrow.png")!

    override func viewDidLoad() {
        super.viewDidLoad()
        navy.link = "PDFs_Navy/"
        
        let reloadButton = UIBarButtonItem(image: redoIcon, style: .plain, target: self, action: #selector(NavyWebviewVC.webViewLoad))
        let iBooksButton:UIBarButtonItem = UIBarButtonItem(image: downloadIcon, style: .plain, target: self, action: #selector(NavyWebviewVC.iBooksLaunch))
        let backButton = UIBarButtonItem(image: backArrow, style: .plain, target: self, action: #selector(NavyWebviewVC.goBack))
        self.navigationItem.setRightBarButtonItems([backButton, reloadButton, iBooksButton], animated: false)
        
        navyWebview.scalesPageToFit = true
        navyWebview.isMultipleTouchEnabled = true
        
        webViewLoad()
        
        
        
    }
    
    @objc func webViewLoad(){
        if navy.selection == navy.waiverGuideTitle {
            self.title = navy.waiverGuideTitle
            navy.link += navy.waiverGuidePDF
            let path = Bundle.main.url(forResource: "pdfjs/web/NavyWaiverGuideViewer", withExtension: "html")
            let request = URLRequest(url: path!)
            navyWebview?.loadRequest(request)
        } else if navy.selection == navy.usnManmedTitle {
            self.title = navy.usnManmedTitle
            navy.link += navy.usnManmedPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/NavyManmed", withExtension: "html")
            let request = URLRequest(url: path!)
            navyWebview?.loadRequest(request)
        }
        else {
            docError()
        }

    }
    
    @objc func iBooksLaunch() {
        print("button pressed")
        
        if let path = Bundle.main.path(forResource: navy.link, ofType: "pdf") {
            let targetURL = URL(fileURLWithPath: path)
            docController = UIDocumentInteractionController(url: targetURL)
            let url = URL(string:"itms-books:");
            if UIApplication.shared.canOpenURL(url!) {
                docController!.presentOpenInMenu(from: CGRect.zero, in: self.view, animated: true)
                print("iBooks is installed")
            } else {
                print("iBooks is not installed")
                iBooksError()
            }
        }
    }
    
    func iBooksError() {
        let title = NSLocalizedString("Error", comment: "")
        let message = NSLocalizedString("iBooks is not installed.", comment: "")
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { action in
            NSLog("The simple alert's cancel action occured.")
        }
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func docError() {
        let title = NSLocalizedString("Error", comment: "")
        let message = NSLocalizedString("Document not found.  Please contact ColbyCoApps@gmail.com.", comment: "")
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { action in
            NSLog("The simple alert's cancel action occured.")
        }
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }

    @objc func goBack() {
        navyWebview.goBack()
    }
        
}
