//
//  GameOverViewController.swift
//  quizNight
//
//  Created by Paulo de Tarso on 13/12/18.
//  Copyright © 2018 Paulo de Tarso. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var pontuacaoLabel: UILabel!
    
    
    var pontuacao : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pontuacaoLabel.text = "\(pontuacao)"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
