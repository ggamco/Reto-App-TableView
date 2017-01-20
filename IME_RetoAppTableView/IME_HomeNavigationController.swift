//
//  IME_HomeNavigationController.swift
//  IME_RetoAppTableView
//
//  Created by cice on 20/1/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class IME_HomeNavigationController: UINavigationController {

    
    let botonFlotante = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        botonFlotante.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 44.0, height: 44.0))
        botonFlotante.setImage(UIImage(named: "navigation.png"), for: UIControlState())
        botonFlotante.center = CGPoint(x: self.view.bounds.width - 42.0, y: self.view.bounds.height - 42.0)
        botonFlotante.layer.backgroundColor = UIColor(red: 150.0/255.0, green: 150.0/255.0, blue: 150.0/255.0, alpha: 1.0).cgColor
        botonFlotante.layer.cornerRadius = botonFlotante.frame.size.width / 2
        botonFlotante.layer.borderWidth = 1
        botonFlotante.layer.borderColor = UIColor.black.cgColor
        botonFlotante.contentEdgeInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        self.view.addSubview(botonFlotante)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
