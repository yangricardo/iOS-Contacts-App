//
//  ViewController.swift
//  contacts
//
//  Created by Yang Ricardo  on 02/03/2018.
//  Copyright © 2018 Yang Ricardo . All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let cellID = "cellID"
    
    var namesLists = [
        ["Yang","Ricardo","Barcellos","Miranda",],
        ["Vera","Lucia","Alves","Oliveira",],
        ["Douglas","Peixoto"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "Contatos"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Seção"
        label.backgroundColor = UIColor.lightGray
        return label
    }
    
    //Numero de Seções
    override func numberOfSections(in tableView: UITableView) -> Int {
        return namesLists.count
    }
    
    //Numero de Linhas
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesLists[section].count
    }

    //Conteudo da Celula
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        let name = self.namesLists[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = "\(name) Seção: \(indexPath.section) Row: \(indexPath.row)"
        
        return cell
    }
}

