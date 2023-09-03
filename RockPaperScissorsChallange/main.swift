//
//  main.swift
//  RockPaperScissorsChallange
//
//  Created by Beyza Sude Erol on 3.09.2023.
//

import Foundation

enum Choices: String {
    case rock = "Taş"
    case paper = "Kağıt"
    case scissors = "Makas"
}

func computerChoice() -> Choices {
    let choice: [Choices] = [.rock, .paper, .scissors]
    let randomNumber = Int.random(in: 0..<choice.count)
    return choice[randomNumber]
}


func gameResult(userChoice: Choices, computerChoice: Choices) -> String {
    var result = ""
    switch userChoice {
    case .rock:
        result = computerChoice == .rock ? "BERABERE." : (computerChoice == .paper ? "KAYBETTİNİZ." : "KAZANDINIZ.")
    case .paper:
        result = computerChoice == .paper ? "BERABERE." : (computerChoice == .scissors ? "KAYBETTİNİZ." : "KAZANDINIZ.")
    case .scissors:
        result = computerChoice == .scissors ? "BERABERE." : (computerChoice == .rock ? "KAYBETTİNİZ." : "KAZANDINIZ.")
    }
    return result
}

func playGame() {
    print("******************* Taş, Kağıt, Makas Oyununa Hoş Geldiniz!*******************")
    
    var continuePlaying = true
    
    while continuePlaying {
        print("Taş, Kağıt veya Makas (Oyundan çıkmak için 'q' girin):")
        
        if let userInput = readLine()?.lowercased() {
            if userInput == "q" {
                continuePlaying = false
                print("Oyundan çıkıldı.")
                continue
            }
            
            if let userChoice = Choices(rawValue: userInput.capitalized) {
                let computerChoice = computerChoice()
                let result = gameResult(userChoice: userChoice, computerChoice: computerChoice)
                
                print("Bilgisayarın seçimi: \(computerChoice.rawValue)")
                print(result)
                
            } else {
                print("Geçersiz seçim. Lütfen Taş, Kağıt veya Makas seçin.")
            }
        } else {
            print("Seçim alınamadı. Tekrar deneyin.")
        }
    }
}

playGame()
