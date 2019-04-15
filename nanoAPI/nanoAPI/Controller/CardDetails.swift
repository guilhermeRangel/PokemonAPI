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
        cardName.text = card?.name
    }
}
