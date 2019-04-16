//
//  ViewController.swift
//  nanoAPI
//
//  Created by Vitor Demenighi on 12/04/19.
//  Copyright © 2019 Vitor Demenighi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var cards: [Card] = []
    
    @IBOutlet weak var tableCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableCollectionView.delegate = self
        tableCollectionView.dataSource = self
        
        
        if let url = URL(string: "https://api.pokemontcg.io/v1/cards"){
            let task = URLSession.shared.dataTask(with: url) { (data, request, err) in
                if err == nil{
                    if let dadosRetorno = data {
                        var poke = try? JSONDecoder().decode(TopLevel.self, from: dadosRetorno)

                        for p in poke!.cards {
                            
                            if p.nationalPokedexNumber != nil {
                                if p.nationalPokedexNumber! < 200  {
                                    self.cards.append(p)
                                    
                                }
                            }
                            
                            }
                        
                        
                        
                        
                        DispatchQueue.main.async { self.tableCollectionView.reloadData() }
                    }
                }
            }
            
            task.resume()
            
        }
        print(cards.count)
    
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let card = sender as? Card {
            if let nextViewController = segue.destination as? CardDetails {
                nextViewController.card = card
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(cards.count)
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCollectionViewCell", for: indexPath) as! imageCollectionViewCell
        
        let card = cards[indexPath.row]
        
        cell.imgImage.image = UIImage()
        
        
        let url = URL(string: card.imageUrl!)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        cell.imgImage.image = UIImage(data: data!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         performSegue(withIdentifier: "showCardDetails", sender: cards[indexPath.row])
    }
    
    

    
}



//
//extension ViewController: UITableViewDataSource {
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//
//        return cards.count
//
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell") as? tableCell else {
//            return UITableViewCell()
//        }
//
//        let card = cards[indexPath.row]
//
//
//
//        //cell.nameLabel?.text = card.name
//
//
//        cell.cardImage.image = UIImage()
//
//        let url = URL(string: card.imageUrl!)
//        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
//        cell.cardImage.image = UIImage(data: data!)
//
//        return cell
//
//    }
//
//}
//
//extension ViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "showCardDetails", sender: cards[indexPath.row])
//    }
//}

