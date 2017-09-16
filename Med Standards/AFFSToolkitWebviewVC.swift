//
//  AFFSToolkitWebview.swift
//  Med Standards
//
//  Created by Colby Uptegraft on 7/4/15.
//  Copyright (c) 2015 ColbyCo. All rights reserved.
//

import UIKit

class AFFSToolkitWebviewVC: UIViewController, UIWebViewDelegate {
    
    @IBOutlet var aFWebview: UIWebView!
    var docController: UIDocumentInteractionController?
    let downloadIcon:UIImage = UIImage(named: "download.png")!
    let redoIcon:UIImage = UIImage(named: "redo.png")!
    let backArrow:UIImage = UIImage(named: "backArrow.png")!
    let forwardArrow:UIImage = UIImage(named: "forwardArrow.png")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aF.link = "PDFs_AirForce/Toolkit/"
        
        let reloadButton = UIBarButtonItem(image: redoIcon, style: .plain, target: self, action: #selector(AFFSToolkitWebviewVC.webViewLoad))
        let iBooksButton:UIBarButtonItem = UIBarButtonItem(image: downloadIcon, style: .plain, target: self, action: #selector(AFFSToolkitWebviewVC.iBooksLaunch))
        let backButton = UIBarButtonItem(image: backArrow, style: .plain, target: self, action: #selector(AFFSToolkitWebviewVC.goBack))
        let forwardButton = UIBarButtonItem(image: forwardArrow, style: .plain, target: self, action: #selector(AFFSToolkitWebviewVC.goForward))
        
        if aF.selection == aF.pracGuidTitle {
            self.navigationItem.setRightBarButtonItems([forwardButton, backButton, reloadButton], animated: false)
        } else {
            self.navigationItem.setRightBarButtonItems([backButton, reloadButton, iBooksButton], animated: false)
        }
        
        aFWebview.scalesPageToFit = true
        aFWebview.isMultipleTouchEnabled = true
        
        webViewLoad()
    }
    
    
    func webViewLoad(){
        if aF.selection == aF.nutSupTitle {
            self.title = aF.nutSupTitle
            aF.link += aF.nutSupPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFDietarySupp", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.sgpTitle {
            self.title = aF.sgpTitle
            aF.link += aF.sgpPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFSGPearls", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.specDescTitle {
            self.title = aF.specDescTitle
            aF.link += aF.specDescPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFSpecDesc", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.pracGuidTitle {
            self.title = aF.pracGuidTitle
            let url = "http://www.asams.org/guidelines.htm"
            let requestUrl = URL(string: url)
            let request = URLRequest(url: requestUrl!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.fsfogTitle {
            self.title = aF.fsfogTitle
            aF.link += aF.fsfogPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFfsfog", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.fsqrTitle {
            self.title = aF.fsqrTitle
            aF.link += aF.fsqrPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFfsqr", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.metalsTitle {
            self.title = aF.metalsTitle
            aF.link += aF.metalsPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFmetals", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.phsExMtxTitle {
            self.title = aF.phsExMtxTitle
            aF.link += aF.phsExMtxPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFphsExMtx", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else {
            docError()
        }
    }
    
    func iBooksLaunch() {
        print("button pressed")
        
        if let path = Bundle.main.path(forResource: aF.link, ofType: "pdf") {
            let targetURL = URL(fileURLWithPath: path)
            docController = UIDocumentInteractionController(url: targetURL)
            let url = URL(string:"itms-books:");
            if UIApplication.shared.canOpenURL(url!) {
                self.docController!.presentOpenInMenu(from: CGRect.zero, in: self.view, animated: true)
                print("iBooks is installed")
            } else {
                print("iBooks is not installed")
                self.iBooksError()
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
    
    func goBack() {
        aFWebview.goBack()
    }
    
    func goForward(){
        aFWebview.goForward()
    }
    
    
    
}
