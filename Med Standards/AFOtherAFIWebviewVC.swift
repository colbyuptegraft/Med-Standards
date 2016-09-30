//
//  AFOtherAFIWebviewVC.swift
//  Med Standards
//
//  Created by Colby Uptegraft on 6/6/15.
//  Copyright (c) 2015 ColbyCo. All rights reserved.
//

import UIKit

class AFOtherAFIWebviewVC: UIViewController, UIWebViewDelegate {
    
    @IBOutlet var aFWebview: UIWebView!
    var docController: UIDocumentInteractionController?
    let downloadIcon:UIImage = UIImage(named: "download.png")!
    let redoIcon:UIImage = UIImage(named: "redo.png")!
    let backArrow:UIImage = UIImage(named: "backArrow.png")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aF.link = "PDFs_AirForce/Other_AFIs/"
        
        let reloadButton = UIBarButtonItem(image: redoIcon, style: .plain, target: self, action: #selector(AFOtherAFIWebviewVC.webViewLoad))
        let iBooksButton:UIBarButtonItem = UIBarButtonItem(image: downloadIcon, style: .plain, target: self, action: #selector(AFOtherAFIWebviewVC.iBooksLaunch))
        let backButton = UIBarButtonItem(image: backArrow, style: .plain, target: self, action: #selector(AFOtherAFIWebviewVC.goBack))
        self.navigationItem.setRightBarButtonItems([backButton, reloadButton, iBooksButton], animated: false)

        aFWebview.scalesPageToFit = true
        aFWebview.isMultipleTouchEnabled = true
        
        webViewLoad()
    }
    
    
    func webViewLoad(){
        if aF.selection == aF.aetci48102Title {
            self.title = aF.aetci48102Title
            aF.link += aF.aetci48102PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAETCI48-102", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.aetci48103Title {
            self.title = aF.aetci48103Title
            aF.link += aF.aetci48103PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAETCI48-103", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi11202v1Title {
            self.title = aF.afi11202v1Title
            aF.link += aF.afi11202v1PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI11-202v1", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi11202v2Title {
            self.title = aF.afi11202v2Title
            aF.link += aF.afi11202v2PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI11-202v2", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi11202v3Title {
            self.title = aF.afi11202v3Title
            aF.link += aF.afi11202v3PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI11-202v3", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi11301v1Title {
            self.title = aF.afi11301v1Title
            aF.link += aF.afi11301v1PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI11-301v1", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi11301v2Title {
            self.title = aF.afi11301v2Title
            aF.link += aF.afi11301v2PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI11-301v2", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi11301v4Title {
            self.title = aF.afi11301v4Title
            aF.link += aF.afi11301v4PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI11-301v4", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi11401Title {
            self.title = aF.afi11401Title
            aF.link += aF.afi11401PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI11-401Viewer", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi11402Title {
            self.title = aF.afi11402Title
            aF.link += aF.afi11402PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI11-402", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi362905Title {
            self.title = aF.afi362905Title
            aF.link += aF.afi362905PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI36-2905Viewer", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi41307Title {
            self.title = aF.afi41307Title
            aF.link += aF.afi41307PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI41-307", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi44170Title {
            self.title = aF.afi44170Title
            aF.link += aF.afi44170PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI44-170Viewer", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi44172Title {
            self.title = aF.afi44172Title
            aF.link += aF.afi44172PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI44-172Viewer", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi48101Title {
            self.title = aF.afi48101Title
            aF.link += aF.afi48101PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI48-101Viewer", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi48145Title {
            self.title = aF.afi48145Title
            aF.link += aF.afi48145PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI48-145", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi48149Title {
            self.title = aF.afi48149Title
            aF.link += aF.afi48149PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI48-149Viewer", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi91202Title {
            self.title = aF.afi91202Title
            aF.link += aF.afi91202PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI91-202", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi91204Title {
            self.title = aF.afi91204Title
            aF.link += aF.afi91204PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI91-204Viewer", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afman48147Title {
            self.title = aF.afman48147Title
            aF.link += aF.afman48147PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFMAN48-147", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afman91223Title {
            self.title = aF.afman91223Title
            aF.link += aF.afman91223PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFMAN91-223", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afpd481Title {
            self.title = aF.afpd481Title
            aF.link += aF.afpd481PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFPD48-1", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afecdp1Title {
            self.title = aF.afecdp1Title
            aF.link += aF.afecdp1PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFafecdp1", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afocdTitle {
            self.title = aF.afocdTitle
            aF.link += aF.afocdPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFafocd", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afpam48133Title {
            self.title = aF.afpam48133Title
            aF.link += aF.afpam48133PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFafpam48133", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi362101Title {
            self.title = aF.afi362101Title
            aF.link += aF.afi362101PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI36-2101", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi44171Title {
            self.title = aF.afi44171Title
            aF.link += aF.afi44171PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI44-171", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi44103Title {
            self.title = aF.afi44103Title
            aF.link += aF.afi44103PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI44-103", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi10203sgTitle {
            self.title = aF.afi10203sgDetail
            aF.link += aF.afi10203sgPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI10-203sg", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.afi10203sgtTitle {
            self.title = aF.afi10203sgtDetail
            aF.link += aF.afi10203sgtPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI10-203sgt", withExtension: "html")
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
