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
        ExpandableNames(isExpanded:false,names:["Yang","Ricardo","Barcellos","Miranda",],section:"Yang"),
        ExpandableNames(isExpanded:false,names:["Vera","Lucia","Alves","Oliveira",],section:"Vera"),

        ExpandableNames(isExpanded:false,names:["Douglas","Peixoto"],section:"Douglas"),
    ]
    
    var showIndexPaths = false
    
    @objc func handleShowIndexPath()  {
        var indexPathReloading = [IndexPath]()
        
        for section in namesLists.indices{
            for row in namesLists[section].names.indices{
                let indexPath = IndexPath(row: row, section: section)
                indexPathReloading.append(indexPath)
            }
        }
        
        showIndexPaths = !showIndexPaths
        
        let animationStyle:UITableViewRowAnimation = showIndexPaths ? .right : .left
        
        tableView.reloadRows(at: indexPathReloading, with: animationStyle)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "Contatos"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show IndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))
        
        tableView.register(ContactCell.self, forCellReuseIdentifier: cellID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //let label = UILabel()
        //label.text = "Seção"
        //label.backgroundColor = UIColor.lightGray
        //return label
        
        let closeButton = UIButton(type: .system)
        closeButton.setTitle(namesLists[section].section, for: .normal)
        closeButton.setTitleColor(.black, for: .normal)
        closeButton.backgroundColor = .yellow
        closeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        closeButton.addTarget(self, action: #selector(handleExpandCollapse), for: .touchUpInside)
        closeButton.tag = section
        return closeButton
        
    }
    
    @objc func handleExpandCollapse(button:UIButton){
        var indexPaths = [IndexPath]()
        let section = button.tag
        
        for row in namesLists[section].names.indices{
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = namesLists[section].isExpanded
        
        namesLists[section].isExpanded = !isExpanded
        
        //button.setTitle(isExpanded ? "Abrir" : "Fechar", for: .normal)
        
        if isExpanded{
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else{
            tableView.insertRows(at: indexPaths, with: .fade)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    //Numero de Seções
    override func numberOfSections(in tableView: UITableView) -> Int {
        return namesLists.count
    }
    
    //Numero de Linhas
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesLists[section].isExpanded ? namesLists[section].names.count : 0
    }

    //Conteudo da Celula
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ContactCell
        cell.controller = self
        let name = self.namesLists[indexPath.section].names[indexPath.row]
        
        cell.textLabel?.text = !showIndexPaths ? name : "\(name) Seção: \(indexPath.section) Row: \(indexPath.row)";
        cell.textLabel?.textColor = .white
        
        return cell
    }
    
    func handleMarkAsFavorite() {
        
    }
    
}

