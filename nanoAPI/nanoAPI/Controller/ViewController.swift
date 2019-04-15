//
//  ViewController.swift
//  nanoAPI
//
//  Created by Vitor Demenighi on 12/04/19.
//  Copyright © 2019 Vitor Demenighi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var cards: [Card] = []

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        if let url = URL(string: "https://api.pokemontcg.io/v1/cards"){
            let task = URLSession.shared.dataTask(with: url) { (data, request, err) in
                if err == nil{
                    if let dadosRetorno = data {
                        var poke = try? JSONDecoder().decode(TopLevel.self, from: dadosRetorno)
                        //print(poke?.cards)
                        
                        
                        for p in poke!.cards {
                           // print(p.name)
                            
                            
                            self.cards.append(p)
                            //self.namesAndImg.append(Card(id: p.id!, name: p.name!, imageUrl: p.imageUrl!))
                            
                        }
                        
                        DispatchQueue.main.async { self.tableView.reloadData() }
                    }
                }
                

                
                
                
                
            
                
                
            }
            
            task.resume()
            
        }
    
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let card = sender as? Card {
            if let nextViewController = segue.destination as? CardDetails {
                nextViewController.card = card
            }
        }
    }

    
}




extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        print(cards.count)
        return cards.count

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell") as? tableCell else {
            return UITableViewCell()
        }

        let card = cards[indexPath.row]

        
         cell.nameLabel?.text = card.name
        cell.cardImage.image = UIImage()
        
        let url = URL(string: card.imageUrl!)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        cell.cardImage.image = UIImage(data: data!)
        
        return cell

    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showCardDetails", sender: cards[indexPath.row])
    }
}

