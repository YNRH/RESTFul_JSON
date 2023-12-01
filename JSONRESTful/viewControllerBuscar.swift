//
//  viewControllerBuscar.swift
//  JSONRESTful
//
//  Created by yrojas on 1/12/23.
//

import UIKit

class viewControllerBuscar: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tablaPeliculas: UITableViewCell!
    @IBOutlet weak var txtBuscar: UITextField!
    var peliculas = [Peliculas]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tablaPeliculas.delegate = self
        tablaPeliculas.dataSource = self
        
        let ruta = "http://localhost:3000/peliculas/"
        cargarPeliculas(ruta: ruta){
            self.tablaPeliculas.reloadData()
        }
    }
    
    @IBAction func btnBuscar(_ sender: Any) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return peliculas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(peliculas[indexPath.row].nombre)"
        cell.detailTextLabel?.text = "Genero:\(peliculas[indexPath.row].genero) Duración:\(peliculas[indexPath.row].duracion)"
        return cell
    }
    
    func cargarPeliculas(ruta:String, completed: @escaping () -> ()){
        let url = URL(string: ruta)
        URLSession.shared.dataTask(with:url!){(data, response, error) in if error == nil {
            do{
                self.peliculas = try JSONDecoder().decode ([Peliculas].self, from: data!)
                DispatchQueue.main.async{
                    completed()
                }
                
            }catch{
                print("Error en JSON" )
            }
        }.resume()

    }
    }
    
    
    
    
    func mostrarAlerta(titulo: String, mensaje: String, accion: String) {
        let alerta =    UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let btnOK = UIAlertAction(title: accion, style: .default, handler: nil)
        alerta.addAction(btnOK)
        present(alerta, animated: true, completion: nil)
    }
                                              
                                              
                                              
                                              
    // +++++++++++++
}
