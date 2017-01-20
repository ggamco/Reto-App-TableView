//
//  IME_VistaTablaTVC.swift
//  IME_RetoAppTableView
//
//  Created by cice on 20/1/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class IME_VistaTablaTVC: UITableViewController {

    //MARK: - Variables LOCALES
    var contactos: [[String:String]] = []
    var perfil: [[String:String]] = []
    
    //creamos una instancia de nuestra clase navigationcontroller
    
    
    
    //MARK: - LIFE VC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //cargo la ruta donde encontraremos el array de diccionarios
        let rutaFichero = Bundle.main.path(forResource: "contactos", ofType: "plist")
        contactos = NSArray(contentsOfFile: rutaFichero!) as! [[String : String]]
        
        //cargo la ruta donde encontraremos el array de diccionarios
        let rutaPerfil = Bundle.main.path(forResource: "perfil", ofType: "plist")
        perfil = NSArray(contentsOfFile: rutaPerfil!) as! [[String : String]]
        
        //cargamos el item customizado
        crearItemNavigation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //conseguimos que el boton flotante aparezca cuando se carga la vista de la tabla
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navController = self.navigationController as! IME_HomeNavigationController
        navController.botonFlotante.isHidden = false
    }
    
    //conseguimos que el boton flotante desaparezca cuando se entra en un detalle de vista
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let navController = self.navigationController as! IME_HomeNavigationController
        navController.botonFlotante.isHidden = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CeldaBasica", for: indexPath) as! IME_CeldaBasicaTVCell
        
        //recuperamos los datos del usuario dependiendo de la fila a pintar
        let contactosDiccionario = contactos[indexPath.row]
        
        //cargamos la imagen de contacto en la celda
        let imagenContacto = UIImage(named: contactosDiccionario["imagen"]!)
        cell.myImagenContacto.image = imagenContacto
        
        //cargamos el resto de datos en la celda
        cell.myNombreContacto.text = contactosDiccionario["nombre"]
        cell.myApellidosContacto.text = contactosDiccionario["apellidos"]
        cell.myFechaContacto.text = contactosDiccionario["fechaCreacion"]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 //devuelvo el valor establecido en el storyboard
    }
    
    
    
    //MARK: - CONTROL SEGUE CELDAS
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let ventanaDetalle = self.storyboard?.instantiateViewController(withIdentifier: "VistaDetalleContacto") as! IME_VentanaDetalleVC
        
        ventanaDetalle.dataContacto = contactos[indexPath.row]
        
        self.navigationController?.pushViewController(ventanaDetalle, animated: true)
        
    }
    
    
    
    //MARK: - METODOS PARA CREAR ITEMS EN NAVIGATIONBAR
    func crearItemNavigation(){
        
        //creamos un UIButton
        let customBoton = UIButton(type: .custom)
        
        //cargamos la imagen
        customBoton.setImage(UIImage(named: "gmb.jpg"), for: .normal)
        customBoton.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        customBoton.layer.cornerRadius = customBoton.frame.size.width / 2
        customBoton.imageView?.contentMode = .scaleAspectFill
        customBoton.clipsToBounds = true
        
        //creamos un border al item
        customBoton.layer.borderWidth = 1
        customBoton.layer.borderColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.1).cgColor
        
        //añadimos el target -> el selector llama a una funcion propia
        customBoton.addTarget(self, action: #selector(IME_VistaTablaTVC.showAlertVC), for: .touchUpInside)
        
        //creamos una nueva instancia barbuttonitem y seteamos nuestro custombutton
        let barButtonItem = UIBarButtonItem(customView: customBoton)
        //cargamos el uibarButton en el navigationBar
        self.navigationItem.rightBarButtonItem = barButtonItem
        
        
        
    }
    
    func showAlertVC(){
    
        /*
        let alertVC = UIAlertController(title: "Hola", message: "Esto es una prueba", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertVC.addAction(alertAction)
        present(alertVC, animated: true, completion: nil)
        */
        
        let perfilVC = self.storyboard?.instantiateViewController(withIdentifier: "VistaDetallePerfil") as! IME_VentanaDetalleVC
        perfilVC.dataContacto = perfil[0]
        self.navigationController?.pushViewController(perfilVC, animated: true)
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
