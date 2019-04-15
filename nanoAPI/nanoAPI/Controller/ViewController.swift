//
//  ViewController.swift
//  nanoAPI
//
//  Created by Vitor Demenighi on 12/04/19.
//  Copyright © 2019 Vitor Demenighi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let url = URL(string: "https://api.pokemontcg.io/v1/cards"){
            let task = URLSession.shared.dataTask(with: url) { (data, request, err) in
                if err == nil{
                    if let dadosRetorno = data {
                        var poke = try? JSONDecoder().decode(TopLevel.self, from: dadosRetorno)
                        //print(poke?.cards)
                        
                        for p in poke!.cards {
                           // print(p.name)
                        
                            //self.namesAndImg.append(Card(id: p.id!, name: p.name!, imageUrl: p.imageUrl!))
                            
                        }
                        
                    }
                }
                
                
                
                
                
            }
            
            task.resume()
            
        }
    }

    
}

