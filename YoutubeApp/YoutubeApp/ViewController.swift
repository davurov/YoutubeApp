//
//  ViewController.swift
//  YoutubeApp
//
//  Created by Abduraxmon on 26/03/23.
//

import UIKit

class ViewController: UIViewController {

    let model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getVideos()
    }


}

