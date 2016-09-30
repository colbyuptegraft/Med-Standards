//
//  AFOtherAFIVC.swift
//  Med Standards
//
//  Created by Colby Uptegraft on 6/6/15.
//  Copyright (c) 2015 ColbyCo. All rights reserved.
//

import UIKit


class AFOtherAFIVC: UITableViewController {
    
    let aFDocArray:NSArray = [aF.afi10203sgTitle, aF.afi10203sgtTitle, aF.afi11202v1Title, aF.afi11202v2Title, aF.afi11202v3Title, aF.afi11301v1Title, aF.afi11301v2Title, aF.afi11301v4Title, aF.afi11401Title, aF.afi11402Title, aF.afi362101Title, aF.afi362905Title, aF.afi41307Title, aF.afi44103Title, aF.afi44170Title, aF.afi44171Title, aF.afi44172Title, aF.afi48101Title, aF.afi48145Title, aF.afi48149Title, aF.afi91202Title, aF.afi91204Title, aF.afecdp1Title, aF.aetci48102Title, aF.aetci48103Title, aF.afman48147Title, aF.afman91223Title, aF.afocdTitle, aF.afpam48133Title, aF.afpd481Title]
    let aFDocDetailArray:NSArray = [aF.afi10203sgDetail, aF.afi10203sgtDetail, aF.afi11202v1Detail, aF.afi11202v2Detail, aF.afi11202v3Detail, aF.afi11301v1Detail, aF.afi11301v2Detail, aF.afi11301v4Detail, aF.afi11401Detail, aF.afi11402Detail, aF.afi362101Detail, aF.afi362905Detail, aF.afi41307Detail, aF.afi44103Detail, aF.afi44170Detail, aF.afi44171Detail, aF.afi44172Detail, aF.afi48101Detail, aF.afi48145Detail, aF.afi48149Detail, aF.afi91202Detail, aF.afi91204Detail, aF.afecdp1Detail, aF.aetci48102Detail, aF.aetci48103Detail, aF.afman48147Detail, aF.afman91223Detail, aF.afocdDetail, aF.afpam48133Detail, aF.afpd481Detail]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.title = "Other AFIs"
        
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
        
        performSegue(withIdentifier: "aFOtherAFIWebviewSegue", sender: nil)
        
    }
    
}

