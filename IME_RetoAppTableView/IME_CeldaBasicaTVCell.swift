//
//  IME_CeldaBasicaTVCell.swift
//  IME_RetoAppTableView
//
//  Created by cice on 20/1/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class IME_CeldaBasicaTVCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var myImagenContacto: UIImageView!
    @IBOutlet weak var myNombreContacto: UILabel!
    @IBOutlet weak var myApellidosContacto: UILabel!
    @IBOutlet weak var myFechaContacto: UILabel!
    
    //MARK: -LIFE VC
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myImagenContacto.layer.cornerRadius = myImagenContacto.frame.size.width / 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
