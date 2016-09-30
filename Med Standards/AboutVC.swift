//
//  AboutVC.swift
//  Med Standards
//
//  Created by Colby Uptegraft on 7/12/15.
//  Copyright (c) 2015 ColbyCo. All rights reserved.
//

import UIKit

class AboutVC: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.label.text = "\n\n\n\nThis application presents the medical standards for special duty personnel of the United States Air Force, Army, and Navy as well as other useful tools and information for Aerospace Medicine professionals. \n\nFor maximum utilization, you may download each PDF to iBooks by selecting the \"Download\" icon at the top right of each PDF screen.  While you may view and search PDFs within this application, viewing the PDFs in iBooks will allow for faster document searching and better document resolution. \n\nAll AFIs, ARs, and Navy documents were screened and approved for inclusion in this application by Air Force Public Affairs. \n\nUpdates with new document versions will occur once per month.  For questions, concerns, and/or suggestions, please eMail Colby at ColbyCoApps@gmail.com."
        
        self.label.sizeToFit()
        
    }
 
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let scrollHeight = screenHeight * 1.5
        self.scrollView.isUserInteractionEnabled = true
        self.scrollView.contentSize = CGSize(width: screenWidth, height: scrollHeight)
        self.scrollView.showsVerticalScrollIndicator = true
        
      
    
    }

  
}
