//
//  DetailVC.swift
//  Split
//
//  Created by Jigisha Patel on 2018-03-06.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit



class DetailVC: UIViewController {

    @IBOutlet var lblItem: UILabel!
    
    var music: String?{
        didSet {
            reloadUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reloadUI(){
        loadViewIfNeeded()
        lblItem.text = music
    }
}

extension DetailVC: MusicSelectionDelegate {
    func musicSelected(_ newMusic: String) {
        music = newMusic
    }
}
