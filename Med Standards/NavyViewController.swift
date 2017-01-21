//
//  NavyViewController.swift
//  Med Standards
//
//  Created by Colby Uptegraft on 5/31/15.
//  Copyright (c) 2015 ColbyCo. All rights reserved.
//

import UIKit

struct navy {
    static var selection:String = ""
    static var link:String = ""
    
    static let waiverGuideTitle = "Navy Waiver Guide"
    static let waiverGuideDetail = "U.S. Navy Aeromedical Reference & Waiver Guide (19 Apr 2016)"
    static let waiverGuidePDF = "Navy Aeromedical Reference & Waiver Guide (19 Apr 2016)"

    static let usnManmedTitle = "Navy ManMed Chapter 15"
    static let usnManmedDetail = "Physical Exams & Standards (9 Jan 2017)"
    static let usnManmedPDF = "USN ManMed Chapter 15 Physical Exams & Standards for Enlistment, Commission, & Special Duty (9 Jan 2017)"

}

class NavyViewController: UITableViewController {
    
    let navyDocArray:NSArray = [navy.waiverGuideTitle, navy.usnManmedTitle]
    let navyDocDetailArray:NSArray = [navy.waiverGuideDetail, navy.usnManmedDetail]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return navyDocArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle,  reuseIdentifier: "Cell")
        
        let titleFont:UIFont? = UIFont(name: "Helvetica", size: 14.0)
        let detailFont:UIFont? = UIFont(name: "Helvetica", size: 12.0)
        
        let detailText:NSMutableAttributedString = NSMutableAttributedString(string: "\n" + (navyDocDetailArray[(indexPath as NSIndexPath).row] as! String), attributes: (NSDictionary(object: detailFont!, forKey: NSFontAttributeName as NSCopying) as! [String: AnyObject]))
        detailText.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGray, range: NSMakeRange(0, detailText.length))
        
        let title = NSMutableAttributedString(string: navyDocArray[(indexPath as NSIndexPath).row] as! String, attributes: (NSDictionary(object: titleFont!, forKey: NSFontAttributeName as NSCopying) as! [String: AnyObject]))
        
        title.append(detailText)
        
        cell.textLabel?.attributedText = title
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.numberOfLines = 0
        
        
        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navy.selection = ""
        
        navy.selection = navyDocArray[(indexPath as NSIndexPath).row] as! String
        
        performSegue(withIdentifier: "navyWebviewSegue", sender: nil)
        
    }
    
}
