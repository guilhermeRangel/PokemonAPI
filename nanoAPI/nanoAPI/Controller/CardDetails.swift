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
    @IBOutlet weak var typeLabel2: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var weaknessLabel: UILabel!
    
    
    @IBOutlet weak var abilityTitleLabel: UILabel!
    @IBOutlet weak var abilityDescription: UILabel!
    @IBOutlet weak var abilityTypeLabel: UILabel!
    @IBOutlet weak var damageLabelStatic: UILabel!
    
    
    @IBOutlet weak var attack1Cell: UITableViewCell!
    @IBOutlet weak var attack1_name: UILabel!
    @IBOutlet weak var attack1_damage: UILabel!
    @IBOutlet weak var attack1_description: UILabel!
    
    
    
    @IBOutlet weak var attack2Cell: UITableViewCell!
    @IBOutlet weak var attack2_name: UILabel!
    @IBOutlet weak var attack2_description: UILabel!
    @IBOutlet weak var attack2_damage: UILabel!
    
    
    @IBOutlet weak var attack3_name: UILabel!
    @IBOutlet weak var attack3_description: UILabel!
    @IBOutlet weak var attack3_damage: UILabel!
    @IBOutlet weak var attack3Cell: UITableViewCell!
    
    override func viewWillAppear(_ animated: Bool) {
        
     
        
        
        let url = URL(string: (card?.imageUrl!)!)
        let data = try? Data(contentsOf: url!) 
        cardImageView.image = UIImage(data: data!)
        
        cardName.text = card?.name
        
        
        
        
        
        hpLabel.text = "HP  \(card?.hp ?? "")"
        
        if card?.types?.count == 2 {
            typeLabel.text = card?.types![0]
            typeLabel2.text = card?.types![1]
        } else {
            typeLabel.text = card?.types![0]
            typeLabel2.isHidden =  true
        }
        
        weaknessLabel.text = card?.weaknesses![0].type
        
        
        
        
        
        
        
        if card?.ability != nil {
            
            damageLabelStatic.isHidden = true
            attack1_name.isHidden = true
            attack1_damage.isHidden = true
            attack1_description.isHidden = true
            abilityTypeLabel.text = card?.ability?.type
            abilityTitleLabel.text = card?.ability?.name
            abilityDescription.text = card?.ability?.text
            
            
            if card?.attacks != nil && card?.attacks?.count == 2 {
                attack1Cell.isHidden = false
                attack2Cell.isHidden = false
                attack3Cell.isHidden = false
                
                attack2_name.text = card?.attacks![0].name
                attack2_damage.text = card?.attacks![0].damage
                attack2_description.text = card?.attacks![0].text
                
                attack3_name.text = card?.attacks![1].name
                attack3_damage.text = card?.attacks![1].damage
                attack3_description.text = card?.attacks![1].text
            } else {
                attack1Cell.isHidden = false
                attack2Cell.isHidden = false
                attack3Cell.isHidden = true
                
                attack2_name.text = card?.attacks![0].name
                attack2_damage.text = card?.attacks![0].damage
                attack2_description.text = card?.attacks![0].text
            }
            
        } else {
            damageLabelStatic.isHidden = false
            attack1_name.isHidden = false
            attack1_damage.isHidden = false
            attack1_description.isHidden = false
            abilityTypeLabel.isHidden = true
            abilityTitleLabel.isHidden = true
            abilityDescription.isHidden = true
            
            
            
            
            if card?.attacks != nil && card?.attacks?.count == 2 {
                attack1Cell.isHidden = false
                attack2Cell.isHidden = false
                attack3Cell.isHidden = true
                
                attack1_name.text = card?.attacks![0].name
                attack1_damage.text = card?.attacks![0].damage
                attack1_description.text = card?.attacks![0].text
                
                attack2_name.text = card?.attacks![1].name
                attack2_damage.text = card?.attacks![1].damage
                attack2_description.text = card?.attacks![1].text
            } else {
                attack1Cell.isHidden = false
                attack2Cell.isHidden = true
                attack3Cell.isHidden = true
                
                attack1_name.text = card?.attacks![0].name
                attack1_damage.text = card?.attacks![0].damage
                attack1_description.text = card?.attacks![0].text
            }
            
            
        }
        
        
        
        
        
    }
}
