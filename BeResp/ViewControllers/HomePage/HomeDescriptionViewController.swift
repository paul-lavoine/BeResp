//
//  HomeDescriptionViewController.swift
//  BeResp
//
//  Created by Paul Lavoine on 26/02/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

struct homeConfigurationStruct {
    var title: String!
    var subtitle: String!
    var image: UIImage!
    
    init(position: Int) {
        var title: String, subtitle: String, imageName: String
        
        switch position {
        case 1:
            title = "évènements"
            subtitle = "Cherchez, créez et participez à des évènements\nresponsables qui ont lieux autour de vous"
            imageName = "home_logo_planet"
            break
        case 2:
            title = "lieux et commerces"
            subtitle = "Identifiez et géolocalisez des producteurs,\ndes distributeurs et des restaurants qui travaillent\nde façon responsable"
            imageName = "home_logo_cabane"
            break
        default:
            title = "organisations"
            subtitle = "Créez des groupes de quartiers, mobilisez vous,\naidez des associations et menez des actions\nconcrètes près de chez vous."
            imageName = "home_logo_home"
            break
        }
        
        self.title = title
        self.subtitle = subtitle
        self.image = UIImage.init(named: imageName)
    }
}

class HomeDescriptionViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var currentPosition: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView(position: currentPosition)
    }
    
    func configureView(position: Int) {
        if currentPosition == 0 {
            fatalError("Current Home position == 0")
        }
        let homeConfiguration = homeConfigurationStruct(position: position)
        titleLabel.text = homeConfiguration.title
        subtitleLabel.text = homeConfiguration.subtitle
        imageView.image = homeConfiguration.image
    }
}

