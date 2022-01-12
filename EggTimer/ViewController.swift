//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Trabalhando com Dicionários
    //let eggtime = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    /*let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle
    
        if hardness == "Soft" {
            print(softTime)
        }else if hardness == "Medium" {
            print(mediumTime)
        }else{
            print(hardTime)
        }
        
        //mesmo exercicio porém feito em Switch
        
        /*
         switch hardness {
         case: "Soft":
            print(softTime)
         
         case: "Medium"
            print(mediumTime)
         
         case: "Hard"
            print("hardTime")
         
         default:
            print("Error")
         }
         */
    
    }*/
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    //Criando uma label para mudar o texto
    @IBOutlet weak var titleLabel: UILabel!
    
    
    //Colocando timer
    //Primeira coisa colocar os segundos pois o contador ele conta segundo
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    //Definir o contador
    var secondsRemaining = 60
    
    var timer = Timer()
    
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progressBar.progress = 1.0
        
        //Caso seja apertado o botão mais de uma vez, ele vai invalidar o contador que está execucando e iniciará um novo contador.
        timer.invalidate()
        
        titleLabel.text = "How do you like your eggs?"
        
        let hardness = sender.currentTitle!
        //Definir o que vai ser contado, neste cado o valor do contador vai ser o que for selecionado. Soft, Medium e Hard
       totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        //Colocando o timer, definindo o intervalo, informando também que o Repeats seja true, para que ele não pare no primeiro.
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    //Chmando o timer e mostrando que a contagem sera diminuindo 1 segundo.
    @objc func updateTimer() {
        if secondsPassed < totalTime{
            
            secondsPassed += 1
            progressBar.progress = Float (secondsPassed) / Float(totalTime)
                        
        } else{
            //Mensagem que ira aparecer no label assim que o timer acabar.
            timer.invalidate()
            titleLabel.text = "DONE"
        }
    }

}
