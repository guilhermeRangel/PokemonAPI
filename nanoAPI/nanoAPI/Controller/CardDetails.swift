//
//  CardDetails.swift
//  nanoAPI
//
//  Created by Vitor Demenighi on 15/04/19.
//  Copyright © 2019 Vitor Demenighi. All rights reserved.
//

import UIKit

class CardDetails: UIViewController{
    
    
    var card: Card?
    
    @IBOutlet weak var cardName: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
        
        
        
        cardName.text = card?.name
    }
}
