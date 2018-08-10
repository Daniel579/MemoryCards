//
//  ViewController.swift
//  MemoryCards
//
//  Created by HsiaoHsien Huang on 2018/8/6.
//  Copyright © 2018年 HsiaoHsien Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let CardsImages = ["heartJ", "heartQ", "heartK", "Joker", "clubJ", "clubQ", "clubK", "diamondJ", "diamondQ", "diamondK" ]
    
    var carArray1:[String] = []
    var carArray2:[String] = []
    var carArray3:[String] = []
    
    var butimageName: UIImage?
    var cardNum = 0
    var cardimg = ""
    var indexA: Int?
    var indexB: Int?
    var match:[String] = []
    
    @IBOutlet var CardsCollection: [UIButton]!
    
    
    @IBAction func FlipCard(_ sender: UIButton) {
        
        if (indexA == nil || indexB == nil), indexA != sender.tag {
            SelectCard(tag: sender.tag)
            CardsCollection[sender.tag].setImage(butimageName!, for: .normal)
            Match(index: cardNum, cardimg: cardimg)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RandomCards()
    }

    func RandomCards() {
        
        carArray1 = CardsImages.shuffled()
        carArray2 = CardsImages.shuffled()
        carArray3 = carArray1 + carArray2
        carArray3 = carArray3.shuffled()
    }
    //產生亂數牌組
    
    func SelectCard(tag: Int) {
        
        
        var aryimageName = ""
        switch tag {
        case 0:
            aryimageName = carArray3[0]
            cardNum = 0
        case 1:
            aryimageName = carArray3[1]
            cardNum = 1
        case 2:
            aryimageName = carArray3[2]
            cardNum = 2
        case 3:
            aryimageName = carArray3[3]
            cardNum = 3
        case 4:
            aryimageName = carArray3[4]
            cardNum = 4
        case 5:
            aryimageName = carArray3[5]
            cardNum = 5
        case 6:
            aryimageName = carArray3[6]
            cardNum = 6
        case 7:
            aryimageName = carArray3[7]
            cardNum = 7
        case 8:
            aryimageName = carArray3[8]
            cardNum = 8
        case 9:
            aryimageName = carArray3[9]
            cardNum = 9
        case 10:
            aryimageName = carArray3[10]
            cardNum = 10
        case 11:
            aryimageName = carArray3[11]
            cardNum = 11
        case 12:
            aryimageName = carArray3[12]
            cardNum = 12
        case 13:
            aryimageName = carArray3[13]
            cardNum = 13
        case 14:
            aryimageName = carArray3[14]
            cardNum = 14
        case 15:
            aryimageName = carArray3[15]
            cardNum = 15
        case 16:
            aryimageName = carArray3[16]
            cardNum = 16
        case 17:
            aryimageName = carArray3[17]
            cardNum = 17
        case 18:
            aryimageName = carArray3[18]
            cardNum = 18
        case 19:
            aryimageName = carArray3[19]
            cardNum = 19
        default:
            print("SelectCard Error")
        }
        
        butimageName = UIImage(named: "\(aryimageName)")
        cardimg = aryimageName
    }
    //選擇牌後比對亂數牌組，把對應的牌面指定給選擇的牌
    
    func Match(index: Int, cardimg: String){
        
        if indexA == nil {
            indexA = index
        }else{
            indexB = index
        }
        
        if indexA != nil, indexB != nil {
            if carArray3[indexA!] == carArray3[indexB!]{
                match.removeAll()
                CardsCollection[indexA!].isHidden = true
                CardsCollection[indexB!].isHidden = true
                indexA = nil
                indexB = nil
            }else {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    let cardback = UIImage(named: "PokerBack")
                    self.match.removeAll()
                    self.CardsCollection[self.indexA!].setImage(cardback, for: .normal)
                    self.CardsCollection[self.indexB!].setImage(cardback, for: .normal)
                    self.indexA = nil
                    self.indexB = nil
                    
                }
            }
        }
        
    }
    //比對牌面，如果只有一張，會直接跳出

}

