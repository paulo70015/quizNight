//
//  BotaoComBorda.swift
//  quizNight
//
//  Created by Paulo de Tarso on 05/12/18.
//  Copyright © 2018 Paulo de Tarso. All rights reserved.
//

import UIKit

class BotaoComBorda: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 5
        
    }

}
