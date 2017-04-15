//
//  AFViewController.swift
//  Med Standards
//
//  Created by Colby Uptegraft on 5/31/15.
//  Copyright (c) 2015 ColbyCo. All rights reserved.
//

import UIKit

struct aF {
    static var selection:String = ""
    static var link:String = ""
    
    static let dlcTitle = "AFI 10-203"
    static let dlcDetail = "Duty Limiting Conditions (20 Nov 2014)"
    static let dlcPDF = "AFI 10-203 Duty Limiting Conditions (20 Nov 2014)"
    
    static let mesTitle = "AFI 48-123"
    static let mesDetail = "Medical Examinations & Standards (19 Sep 2016)"
    static let mesPDF = "AFI 48-123 Medical Examinations & Standards (19 Sep 2016)"
    
    static let medsTitle = "Approved Med List"
    static let medsDetail = "Official Air Force Aerospace Medicine Approved Medications (1 Jan 2017)"
    static let medsPDF = "AF Approved Med List (1 Jan 2017)"
    
    static let otcMedsTitle = "OTC Approved Med List"
    static let otcMedsDetail = "Over-the-Counter Medications Not Requiring Flight Surgeon Approval (09 Jan 2014)"
    static let otcMedsPDF = "AF OTC Approved Med List (09 Jan 2014)"
    
    static let modMedsTitle = "MOD Approved Med List"
    static let modMedsDetail = "Approved Missile Operator Medications (11 Sep 2015)"
    static let modMedsPDF = "AF Missile Operator Approved Med List (11 Sep 2015)"
    
    static let msdTitle = "MSD"
    static let msdDetail = "Medical Standards Directory (29 Nov 2016)"
    static let msdPDF = "AF Medical Standards Directory (29 Nov 2016)"
    
    static let wgTitle = "Waiver Guide"
    static let wgDetail = "Air Force Waiver Guide (10 Apr 2017)"
    static let wgPDF = "AF Waiver Guide (10 Apr 2017)"
    
    static let fsToolkitTitle = "Flight Surgeon Toolkit"
    static let fsToolkitDetail = "Useful Flight Medicine Resources"
    
    static let otherTitle = "Other AFIs"
    static let otherDetail = "Other Flight-Surgeon-Pertinent Air Force Instructions"
    
// Other AFI's
    
    static let afi10203sgTitle = "AFI 10-203 Supplemental Guidance"
    static let afi10203sgDetail = "Supplemental Guidance for DLCs (17 Nov 2016)"
    static let afi10203sgPDF = "AFI 10-203 Supplemental Guidance (17 Nov 2016)"
    
    static let afi10203sgtTitle = "AFI 10-203 Supplemental Profile Timelines"
    static let afi10203sgtDetail = "Timelines for DLCs (Jun 2014)"
    static let afi10203sgtPDF = "AFI 10-203 Supplemental Guidance Profile Timelines (Jun 2014)"
    
    static let afi10203sgtmTitle = "AFI 10-203 Supplemental Profile Templates"
    static let afi10203sgtmDetail = "Templates for DLCs (4 Dec 2016)"
    static let afi10203sgtmPDF = "AFI 10-203 Supplemental Guidance Profile Templates (4 Dec 2014)"
    
    static let afi11202v1Title = "AFI 11-202 v1"
    static let afi11202v1Detail = "Aircrew Training (22 Nov 2010)"
    static let afi11202v1PDF = "AFI 11-202V1 Aircrew Training (22 Nov 2010)"
    
    static let afi11202v2Title = "AFI 11-202 v2"
    static let afi11202v2Detail = "Aircrew Standardization/Evaluation Program (13 Sep 2010)"
    static let afi11202v2PDF = "AFI 11-202V2 Aircrew Standardization-Evaluation Program (13 Sep 2010)"
    
    static let afi11202v3Title = "AFI 11-202 v3"
    static let afi11202v3Detail = "General Flight Rules (10 Aug 2016)"
    static let afi11202v3PDF = "AFI 11-202V3 General Flight Rules (10 Aug 2016)"
    
    static let afi11301v1Title = "AFI 11-301 v1"
    static let afi11301v1Detail = "Aircrew Flight Equipment (AFE) Program (25 Feb 2009)"
    static let afi11301v1PDF = "AFI 11-301V1 Aircrew Flight Equipment Program (25 Feb 2009)"
    
    static let afi11301v2Title = "AFI 11-301 v2"
    static let afi11301v2Detail = "Management & Configuration Requirements for Aircrew Flight Equipment (AFE) (20 Dec 2013)"
    static let afi11301v2PDF = "AFI 11-301V2 Management & Configuration Req for AFE (20 Dec 2013)"
    
    static let afi11301v4Title = "AFI 11-301 v4"
    static let afi11301v4Detail = "Aircrew Laser Eye Protection (ALEP) (17 Feb 2010)"
    static let afi11301v4PDF = "AFI 11-301V4 Aircrew Laser Eye Program (17 Feb 2010)"
    
    static let afi11401Title = "AFI 11-401"
    static let afi11401Detail = "Aviation Management (18 Mar 2016)"
    static let afi11401PDF = "AFI 11-401 Aviation Management (18 Mar 2016)"
    
    static let afi11402Title = "AFI 11-402"
    static let afi11402Detail = "Aviation & Parachutist Service, Aeronautical Ratings & Aviation Badges (4 Nov 2016)"
    static let afi11402PDF = "AFI 11-402 Aviation & Parachutist Service Aeronautical Ratings & Aviation Badges (4 Nov 2016)"
    
    static let afi362101Title = "AFI 36-2101"
    static let afi362101Detail = "Classifying Military Personnel (9 Mar 2017)"
    static let afi362101PDF = "AFI 36-2101 Classifying Military Personnel (9 Mar 2017)"
    
    static let afi362905Title = "AFI 36-2905"
    static let afi362905Detail = "Fitness Program (21 Oct 2013 + 27 Aug 2015 Updates)"
    static let afi362905PDF = "AFI 36-2905 Fitness Program (21 Oct 2013 + 27 Aug 2015 Updates).pdf"
    
    static let afi41307Title = "AFI 41-307"
    static let afi41307Detail = "Aeromedical Evacuation Patient Considerations & Standards of Care (05 Jul 2011)"
    static let afi41307PDF = "AFI 41-307 Aeromedical Evacuation Patient Considerations & Standards of Care (05 Jul 2011)"
    
    static let afi44103Title = "AFI 44-103"
    static let afi44103Detail = "Air Force IDMT Program (06 Dec 2013)"
    static let afi44103PDF = "AFI 44-103 Air Force IDMT Program (06 Dec 2013)"
    
    static let afi44170Title = "AFI 44-170"
    static let afi44170Detail = "Preventive Health Assessment (19 Jan 2016)"
    static let afi44170PDF = "AFI 44-170 Preventive Health Assessment (19 Jan 2016)"
    
    static let afi44171Title = "AFI 44-171"
    static let afi44171Detail = "Patient Centered Medical Home Operations (28 Nov 2014)"
    static let afi44171PDF = "AFI 44-171 Patient Centered Medical Home Operations (28 Nov 2014)"
    
    static let afi44172Title = "AFI 44-172"
    static let afi44172Detail = "Mental Health (13 Nov 2015)"
    static let afi44172PDF = "AFI 44-172 Mental Health (13 Nov 2015)"
    
    static let afi48101Title = "AFI 48-101"
    static let afi48101Detail = "Aerospace Medicine Enterprise (08 Dec 2014)"
    static let afi48101PDF = "AFI 48-101 Aerospace Medicine Enterprise (08 Dec 2014)"
    
    static let afi48145Title = "AFI 48-145"
    static let afi48145Detail = "Occupational & Environmental Health Program (22 Jul 2014 + 27 Aug 2015 Updates)"
    static let afi48145PDF = "AFI 48-145 Occupational & Environmental Health Program (22 Jul 2014 + 27 Aug 2015 Updates)"
    
    static let afi48149Title = "AFI 48-149"
    static let afi48149Detail = "Flight & Operational Medicine Program (FOMP) (18 Dec 2015)"
    static let afi48149PDF = "AFI 48-149 Flight & Operational Medicine Program (18 Dec 2015)"
    
    static let afi91202Title = "AFI 91-202"
    static let afi91202Detail = "The US Air Force Mishap Prevention Program (15 Feb 2017)"
    static let afi91202PDF = "AFI 91-202 USAF Mishap Prevention Program (15 Feb 2017).pdf"
    
    static let afi91204Title = "AFI 91-204"
    static let afi91204Detail = "Safety Investigations & Reports (19 Jan 2017)"
    static let afi91204PDF = "AFI 91-204 Safety Investigations & Reports (19 Jan 2017)"
    
    static let aetci48102Title = "AETCI 48-102"
    static let aetci48102Detail = "Medical Management of Undergraduate Flying Students (05 Nov 2013)"
    static let aetci48102PDF = "AF AETCI 48-102 Medical Management of UFT Students (05 Nov 2013)"
    
    static let aetci48103Title = "AETCI 48-103"
    static let aetci48103Detail = "Training Health & Human Performance (10 Dec 2014)"
    static let aetci48103PDF = "AF AETCI 48-103 Training Health & Human Performance Program (10 Dec 2014)"
    
    static let afecdp1Title = "AFECD"
    static let afecdp1Detail = "Air Force Enlisted Classification Directory (30 Apr 2017)"
    static let afecdp1PDF = "AFECD (30 Apr 2017)"
    
    static let afman48147Title = "AFMAN 48-147"
    static let afman48147Detail = "Tri-Service Food Code (30 Apr 2014)"
    static let afman48147PDF = "AFMAN 48-147_IP Tri-Service Food Code (30 Apr 2014)"
    
    static let afman91223Title = "AFMAN 91-223"
    static let afman91223Detail = "Aviation Safety Investigations & Reports (8 Jun 2016)"
    static let afman91223PDF = "AFMAN 91-223 Aviation Safety Investigations & Reports (8 Jun 2016).pdf"
    
    static let afocdTitle = "AFOCD"
    static let afocdDetail = "Air Force Officer Classification Directory (30 Apr 2017)"
    static let afocdPDF = "AFOCD (30 Apr 2017)"
    
    static let afpam48133Title = "AFPAM 48-133 (Rescinded)"
    static let afpam48133Detail = "Physical Examination Techniques (1 Jun 2000)"
    static let afpam48133PDF = "AFPAM 48-133 Physical Examination Techniques (1 Jun 2000)"
    
    static let afpd481Title = "AFPD 48-1"
    static let afpd481Detail = "Aerospace Medicine Enterprise (23 Aug 2011)"
    static let afpd481PDF = "AFPD 48-1 Aerospace Medicine Enterprise (23 Aug 2011)"
    
// FS Toolkit Items
    
    static let fsfogTitle = "Flying Operations Guide"
    static let fsfogDetail = "AF Flight Surgeon Flying Operations Guide (4 Oct 2013)"
    static let fsfogPDF = "AF Flight Surgeon Flying Operations Guide (4 Oct 2013)"
    
    static let fsqrTitle = "Quick Reference Guide"
    static let fsqrDetail = "AF Flight Surgeon Quick Reference Guide (16 Feb 2016)"
    static let fsqrPDF = "AF Flight Surgeon Quick Reference (16 Feb 2016)"
    
    static let nutSupTitle = "Dietary Supplements"
    static let nutSupDetail = "Nutritional & Ergogenic Supplements: Guidance & Policy"
    static let nutSupPDF = "Dietary Supplements"
    
    static let oxConTitle = "Altitude Oxygen Converter"
    static let oxConDetail = "Converts Ground-Level FiO2 to Cabin-Altitude Needs for Aeromedical Evacuations"
    
    static let pracGuidTitle = "Practice Guidelines"
    static let pracGuidDetail = "American Society of Aerospace Medicine Specialists (ASAMS) Practice Guidelines"
    
    static let rsvTitle = "RSV Sample Briefings"
    static let rsvDetail = "Readiness Skills Verification (RSV) Briefings"
    
    static let sgpTitle = "SGP-earls (v10.15)"
    static let sgpDetail = "Overview of the Chief of Aerospace Medicine (SGP) Roles & Responsibilities"
    static let sgpPDF = "SGP-earls (v10.15)"
    
    static let metalsTitle = "Sample METALS Table"
    static let metalsDetail = "Flight Surgeon Mission-Essential Tasks / Activities for Line Support Table (26 Jun 2014)"
    static let metalsPDF = "Sample METALS Table (26 Jun 2014)"
    
    static let specDescTitle = "Speciality Descriptions"
    static let specDescDetail = "48AX, 48GX, 48RX, & 48VX Specialty Descriptions (30 Apr 2015)"
    static let specDescPDF = "Specialty Description 48XX (30 Apr 2015)"
    
// RSV Items
    
    static let rsvOverviewTitle = "RSV Overview"
    static let rsvOverviewDetail = "RSV for 48XX Flight Surgeons (48A/48G/48R) (02 Jul 2014)"
    static let rsvOverviewPDF = "RSV Overview"
    
    static let rsv1aTitle = "RSV-1A"
    static let rsv1aDetail = "Mishap Investigation"
    static let rsv1aPDF = "RSV-1A Mishap Investigation"
    
    static let rsv1aNotesTitle = "RSV-1A Notes"
    static let rsv1aNotesDetail = "Mishap Investigation Slide Notes"
    static let rsv1aNotesPDF = "RSV-1A Mishap Investigation (Slide Notes)"
    
    static let rsv1b1Title = "RSV-1B1"
    static let rsv1b1Detail = "Aeromedical & Physiological Aspects of Acceleration"
    static let rsv1b1PDF = "RSV-1B1 Aeromedical and Physiologic Aspects of Acceleration"
    
    static let rsv1b2Title = "RSV-1B2"
    static let rsv1b2Detail = "Spatial Disorientation"
    static let rsv1b2PDF = "RSV-1B2 Spatial Disorientation"
    
    static let rsv1b3Title = "RSV-1B3"
    static let rsv1b3Detail = "Barotrauma"
    static let rsv1b3PDF = "RSV-1B3 Barotrauma"
    
    static let rsv1b4Title = "RSV-1B4"
    static let rsv1b4Detail = "Decompression Sickness & Hypoxia"
    static let rsv1b4PDF = "RSV-1B4 Decompression Sickness and Hypoxia"
    
    static let rsv1cTitle = "RSV-1C"
    static let rsv1cDetail = "Travel Medicine"
    static let rsv1cPDF = "RSV-1C Travel Medicine"
    
    static let rsv1dTitle = "RSV-1D"
    static let rsv1dDetail = "Water & Food Vulnerability"
    static let rsv1dPDF = "RSV-1D Water and Food Vulnerability"
    
    static let rsv1e1Title = "RSV-1E1"
    static let rsv1e1Detail = "Aeromedical Aspects of Night Operations"
    static let rsv1e1PDF = "RSV-1E1 Aeromedical Aspects of Night Operations"
    
    static let rsv1e2Title = "RSV-1E2"
    static let rsv1e2Detail = "Thermal Stresses in Fighter Aviation"
    static let rsv1e2PDF = "RSV-1E2 Thermal Stresses in Fighter Aviation"
    
    static let rsv2aTitle = "RSV-2A"
    static let rsv2aDetail = "Medical Clearance for Aeromedical Evacuation"
    static let rsv2aPDF = "RSV-2A Medical Clearance for Aeromedical Evacuation"
    
    static let rsv3aTitle = "RSV-3A"
    static let rsv3aDetail = "Human Performance Sustainment"
    static let rsv3aPDF = "RSV-3A Human Performance Sustainment"
    
    static let rsv4aTitle = "RSV-4A"
    static let rsv4aDetail = "Occupational Health Assessment"
    static let rsv4aPDF = "RSV-4A Occupational Health Assessment"
    
    static let rsv5aTitle = "RSV-5A"
    static let rsv5aDetail = "Aeromedical Summaries"
    static let rsv5aPDF = "RSV-5A Aeromedical Summaries"
    
    
}

class AFViewController: UITableViewController {
    
    let aFDocArray:NSArray = [aF.dlcTitle, aF.mesTitle, aF.medsTitle, aF.fsToolkitTitle, aF.otcMedsTitle, aF.modMedsTitle, aF.msdTitle, aF.wgTitle,  aF.otherTitle]
    let aFDocDetailArray:NSArray = [aF.dlcDetail, aF.mesDetail, aF.medsDetail, aF.fsToolkitDetail, aF.otcMedsDetail, aF.modMedsDetail, aF.msdDetail, aF.wgDetail, aF.otherDetail]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
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
        
        let title = NSMutableAttributedString(string: aFDocArray[(indexPath as NSIndexPath).row] as! String, attributes: (NSDictionary(object: titleFont!, forKey: NSFontAttributeName as NSCopying) as! [String : AnyObject]))
        
        title.append(detailText)
        
        cell.textLabel?.attributedText = title
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        aF.selection = ""
        
        aF.selection = aFDocArray[(indexPath as NSIndexPath).row] as! String
        
        if aF.selection == aF.otherTitle {
            performSegue(withIdentifier: "aFOtherAFISegue", sender: nil)
        } else if aF.selection == aF.fsToolkitTitle {
            performSegue(withIdentifier: "AFFSToolkitSegue", sender: nil)
        }else {
            performSegue(withIdentifier: "aFWebviewSegue", sender: nil)
        }
       
    }
    
}
