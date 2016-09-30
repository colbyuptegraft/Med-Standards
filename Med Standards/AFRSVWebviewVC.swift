//
//  AFRSVWebview.swift
//  Med Standards
//
//  Created by Colby Uptegraft on 7/4/15.
//  Copyright (c) 2015 ColbyCo. All rights reserved.
//

import UIKit

class AFRSVWebviewVC: UIViewController, UIWebViewDelegate {
    
    @IBOutlet var aFWebview: UIWebView!
    var docController: UIDocumentInteractionController?
    let downloadIcon:UIImage = UIImage(named: "download.png")!
    let redoIcon:UIImage = UIImage(named: "redo.png")!
    let backArrow:UIImage = UIImage(named: "backArrow.png")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aF.link = "PDFs_AirForce/Toolkit/RSV/"
        
        let reloadButton = UIBarButtonItem(image: redoIcon, style: .plain, target: self, action: #selector(AFRSVWebviewVC.webViewLoad))
        let iBooksButton:UIBarButtonItem = UIBarButtonItem(image: downloadIcon, style: .plain, target: self, action: #selector(AFRSVWebviewVC.iBooksLaunch))
        let backButton = UIBarButtonItem(image: backArrow, style: .plain, target: self, action: #selector(AFRSVWebviewVC.goBack))
        self.navigationItem.setRightBarButtonItems([backButton, reloadButton, iBooksButton], animated: false)
        
        aFWebview.scalesPageToFit = true
        aFWebview.isMultipleTouchEnabled = true
        
        webViewLoad()
    }
    
    
    func webViewLoad(){
        if aF.selection == aF.rsvOverviewTitle {
            self.title = aF.rsvOverviewTitle
            aF.link += aF.rsvOverviewPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFrsvOverview", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.rsv1aTitle {
            self.title = aF.rsv1aTitle
            aF.link += aF.rsv1aPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFrsv1a", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.rsv1aNotesTitle {
            self.title = aF.rsv1aNotesTitle
            aF.link += aF.rsv1aNotesPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFrsv1aNotes", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.rsv1b1Title {
            self.title = aF.rsv1b1Title
            aF.link += aF.rsv1b1PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFrsv1b1", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.rsv1b2Title {
            self.title = aF.rsv1b2Title
            aF.link += aF.rsv1b2PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFrsv1b2", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.rsv1b3Title {
            self.title = aF.rsv1b3Title
            aF.link += aF.rsv1b3PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFrsv1b3", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.rsv1b4Title {
            self.title = aF.rsv1b4Title
            aF.link += aF.rsv1b4PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFrsv1b4", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.rsv1cTitle {
            self.title = aF.rsv1cTitle
            aF.link += aF.rsv1cPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFrsv1c", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.rsv1dTitle {
            self.title = aF.rsv1dTitle
            aF.link += aF.rsv1dPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFrsv1d", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.rsv1e1Title {
            self.title = aF.rsv1e1Title
            aF.link += aF.rsv1e1PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFrsv1e1", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.rsv1e2Title {
            self.title = aF.rsv1e2Title
            aF.link += aF.rsv1e2PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFrsv1e2", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.rsv2aTitle {
            self.title = aF.rsv2aTitle
            aF.link += aF.rsv2aPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFrsv2a", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.rsv3aTitle {
            self.title = aF.rsv3aTitle
            aF.link += aF.rsv3aPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFrsv3a", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.rsv4aTitle {
            self.title = aF.rsv4aTitle
            aF.link += aF.rsv4aPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFrsv4a", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.rsv5aTitle {
            self.title = aF.rsv5aTitle
            aF.link += aF.rsv5aPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFrsv5a", withExtension: "html")
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
    
    func goBack() {
        aFWebview.goBack()
    }
    
}

