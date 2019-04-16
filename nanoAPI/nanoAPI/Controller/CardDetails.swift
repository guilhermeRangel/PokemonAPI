//
//  CardDetails.swift
//  nanoAPI
//
//  Created by Vitor Demenighi on 15/04/19.
//  Copyright © 2019 Vitor Demenighi. All rights reserved.
//

import UIKit

class CardDetails: UITableViewController{
    
    
    var card: Card?
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var weaknessLabel: UILabel!
    
    
    @IBOutlet weak var abilityCell: UITableViewCell!
    @IBOutlet weak var abilityTitleLabel: UILabel!
    @IBOutlet weak var abilityDescription: UILabel!
    @IBOutlet weak var abilityTypeLabel: UILabel!
    
    
    @IBOutlet weak var attack1Cell: UITableViewCell!
    @IBOutlet weak var attack1_name: UILabel!
    @IBOutlet weak var attack1_damage: UILabel!
    @IBOutlet weak var attack1_description: UILabel!
    
    @IBOutlet var tableViewDetails: UITableView!
    
    
    @IBOutlet weak var attack2Cell: UITableViewCell!
    @IBOutlet weak var attack2_name: UILabel!
    @IBOutlet weak var attack2_description: UILabel!
    @IBOutlet weak var attack2_damage: UILabel!
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
     
        
        
        let url = URL(string: (card?.imageUrl!)!)
        let data = try? Data(contentsOf: url!) 
        cardImageView.image = UIImage(data: data!)
        
        cardName.text = card?.name
        hpLabel.text = "HP  \(card?.hp ?? "")"
        typeLabel.text = card?.types![0]
        weaknessLabel.text = card?.weaknesses![0].type
        
        
        
        
        
        
        
        if card?.ability != nil {
            abilityCell.isHidden = false
            
            abilityTypeLabel.text = card?.ability?.type
            abilityTitleLabel.text = card?.ability?.name
            abilityDescription.text = card?.ability?.text
            
        } else {
            abilityCell.isHidden = true
        }
        
        
        if card?.attacks != nil && card?.attacks?.count == 2 {
            attack1Cell.isHidden = false
            attack2Cell.isHidden = false
            
            attack1_name.text = card?.attacks![0].name
            attack1_damage.text = card?.attacks![0].damage
            attack1_description.text = card?.attacks![0].text
            
            attack2_name.text = card?.attacks![1].name
            attack2_damage.text = card?.attacks![1].damage
            attack2_description.text = card?.attacks![1].text
        } else {
            attack1Cell.isHidden = false
            attack2Cell.isHidden = true
            
            attack1_name.text = card?.attacks![0].name
            attack1_damage.text = card?.attacks![0].damage
            attack1_description.text = card?.attacks![0].text
        }
        
        
    }
}
