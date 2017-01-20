//
//  IME_VentanaDetalleVC.swift
//  IME_RetoAppTableView
//
//  Created by cice on 20/1/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class IME_VentanaDetalleVC: UIViewController {

    //MARK: - VARIABLES LOCALES
    var dataContacto: [String:String] = [:]
    
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var myImagenContaco: UIImageView!
    @IBOutlet weak var myNombreContacto: UILabel!
    @IBOutlet weak var myTelefonoContacto: UILabel!
    @IBOutlet weak var myEmailContacto: UILabel!
    @IBOutlet weak var myFechaContacto: UILabel!
    @IBOutlet weak var myDireccionContacto: UILabel!
    @IBOutlet weak var myCiudadContacto: UILabel!
    @IBOutlet weak var myTwitterContacto: UILabel!
    
    @IBOutlet weak var myViewContainer: UIView!
    
    
    //MARK: - LIFE VC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customImage = UIImage(named: dataContacto["imagen"]!)
        myImagenContaco.image = customImage
        
        myNombreContacto.text = "\(dataContacto["nombre"]!) \(dataContacto["apellidos"]!)"
        myEmailContacto.text = dataContacto["email"]
        myFechaContacto.text = dataContacto["fechaCreacion"]
        myCiudadContacto.text = dataContacto["ciudad"]
        myTelefonoContacto.text = dataContacto["telefono"]
        myTwitterContacto.text = dataContacto["twitter"]
        myDireccionContacto.text = dataContacto["direccion"]
        
        myImagenContaco.layer.cornerRadius = myImagenContaco.frame.size.width / 2
        myImagenContaco.layer.borderWidth = 6
        myImagenContaco.layer.borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        
        
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
