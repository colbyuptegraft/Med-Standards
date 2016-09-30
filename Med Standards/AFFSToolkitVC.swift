//
//  AFFSToolkitVC.swift
//  Med Standards
//
//  Created by Colby Uptegraft on 7/3/15.
//  Copyright (c) 2015 ColbyCo. All rights reserved.
//

import UIKit

class AFFSToolkitVC: UITableViewController {
    
    let aFDocArray:NSArray = [aF.nutSupTitle, aF.oxConTitle, aF.pracGuidTitle, aF.rsvTitle, aF.sgpTitle, aF.specDescTitle]
    let aFDocDetailArray:NSArray = [aF.nutSupDetail, aF.oxConDetail, aF.pracGuidDetail, aF.rsvDetail, aF.sgpDetail, aF.specDescDetail]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "FS Toolkit"
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aFDocArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle,  reuseIdentifier: "Cell")
        
        let titleFont:UIFont? = UIFont(name: "Helvetica", size: 14.0)
        let detailFont:UIFont? = UIFont(name: "Helvetica", size: 12.0)
        
        let detailText:NSMutableAttributedString = NSMutableAttributedString(string: "\n" + (aFDocDetailArray[(indexPath as NSIndexPath).row] as! String), attributes: (NSDictionary(object: detailFont!, forKey: NSFontAttributeName as NSCopying) as! [String: AnyObject]))
        detailText.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGray, range: NSMakeRange(0, detailText.length))
        
        let title = NSMutableAttributedString(string: aFDocArray[(indexPath as NSIndexPath).row] as! String, attributes: (NSDictionary(object: titleFont!, forKey: NSFontAttributeName as NSCopying) as! [String: AnyObject]))
        
        title.append(detailText)
        
        cell.textLabel?.attributedText = title
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.numberOfLines = 0
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        aF.selection = ""
        
        aF.selection = aFDocArray[(indexPath as NSIndexPath).row] as! String
        
        if aF.selection == aF.rsvTitle  {
            performSegue(withIdentifier: "rsvTableviewSegue", sender: nil)
        } else if aF.selection == aF.oxConTitle {
            performSegue(withIdentifier: "OxConvSegue", sender: nil)
        } else {
            performSegue(withIdentifier: "fSToolkitWebviewSegue", sender: nil)
        }
        
        
    }
    
}
