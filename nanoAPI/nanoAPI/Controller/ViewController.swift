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
    var cards2: [Card] = []
    var cards3: [Card] = []
    var i:Int = 1
    @IBOutlet weak var tableCollectionView: UICollectionView!
    @IBOutlet weak var tableCollection2: UICollectionView!
    @IBOutlet weak var tableCollection3: UICollectionView!
    
    @IBOutlet weak var titleCollection1: UILabel!
    @IBOutlet weak var titleCollection2: UILabel!
    @IBOutlet weak var titleCollection3: UILabel!
    @IBOutlet weak var progressBar: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.startAnimating()

        tableCollectionView.delegate = self
        tableCollectionView.dataSource = self
        
        tableCollection2.delegate = self
        tableCollection2.dataSource = self
        
        tableCollection3.delegate = self
        tableCollection3.dataSource = self
        
       
       request()
        i = i+1
        request()
        i = i+1
        
    }
    
    
    func request(){
        if let url = URL(string: "https://api.pokemontcg.io/v1/cards?page=\(i)"){
            let task = URLSession.shared.dataTask(with: url) { (data, request, err) in
                if err == nil{
                    if let dadosRetorno = data {
                        let poke = try? JSONDecoder().decode(TopLevel.self, from: dadosRetorno)
                        
                        for p in poke!.cards {
                            
                            if p.nationalPokedexNumber != nil {
                                if p.nationalPokedexNumber! <= 50  {
        
                                    self.cards.append(p)
                                    
                                }else if (p.nationalPokedexNumber! > 50 && p.nationalPokedexNumber! < 101){
                                    self.cards2.append(p)
                                }else if (p.nationalPokedexNumber! > 100 ){
                                    self.cards3.append(p)
                                }
                            }
                            
                        }
                        
                        
                        
                        
                        DispatchQueue.main.async {
                            self.tableCollectionView.reloadData()
                            self.tableCollection2.reloadData()
                            self.tableCollection3.reloadData()
                            
                            self.progressBar.stopAnimating()
                            
                            self.progressBar.isHidden = true
                        }
                        
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tableCollectionView{
            return cards.count
        }else if collectionView == tableCollection2 {
            return cards2.count
        }else  {
            return cards3.count
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        

        if collectionView == tableCollection2 {
           
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCollectionViewCell", for: indexPath) as! imageCollectionViewCell
            let card2 = cards2[indexPath.row]
            cell.imgImage.image = UIImage()
            let url = URL(string: card2.imageUrl!)
            DispatchQueue.global(qos: .background).async {
                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                DispatchQueue.main.async {
                    self.titleCollection1.text = "Rarest"
                    self.titleCollection2.text = "Limited Edition"
                    self.titleCollection3.text = "Last releases"
                    cell.imgImage.image = UIImage(data: data!)
                }
            }
            
            return cell

        } else if collectionView == tableCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCollectionViewCell", for: indexPath) as! imageCollectionViewCell
            
            
            let card = cards[indexPath.row]
            cell.imgImage.image = UIImage()
            let url = URL(string: card.imageUrl!)
            DispatchQueue.global(qos: .background).async {
                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                DispatchQueue.main.async {
                    cell.imgImage.image = UIImage(data: data!)
                }
            }
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCollectionViewCell", for: indexPath) as! imageCollectionViewCell
            
            
            let card3 = cards3[indexPath.row]
            cell.imgImage.image = UIImage()

            let url = URL(string: card3.imageUrl!)
            DispatchQueue.global(qos: .background).async {
                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                DispatchQueue.main.async {
                    cell.imgImage.image = UIImage(data: data!)
                }
            }
            
            return cell
            
        }
            
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tableCollectionView{
            performSegue(withIdentifier: "showCardDetails", sender: cards[indexPath.row])
        }else if collectionView == tableCollection2 {
            performSegue(withIdentifier: "showCardDetails", sender: cards2[indexPath.row])
        }else if collectionView == tableCollection3 {
            performSegue(withIdentifier: "showCardDetails", sender: cards3[indexPath.row])
        }
        
        
    }
    
}
