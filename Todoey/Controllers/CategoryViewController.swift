//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Saran Siriwatanametanon on 13/11/2561 BE.
//  Copyright © 2561 Saran Siriwatanametanon. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categoryItem = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()

    }

    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categoryItem[indexPath.row].name
        
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryItem.count
    }
    //MARK: - Data Mnaipulation Methods
    
    func loadData(){
        let request : NSFetchRequest<Category> = Category.fetchRequest()
        do {
            categoryItem = try context.fetch(request)
        } catch  {
            print(error)
        }
        tableView.reloadData()
        
    }
    
    func saveItem(){
        do{
           try context.save()
        }catch{
            print(error)
        }
        tableView.reloadData()
    }
    
    //MARK: - Add New Categories
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default){(action)
            in
            print("add click")
            
            let newItem = Category(context : self.context)
            newItem.name = textField.text!
            
            self.categoryItem.append(newItem)
            
            self.saveItem()
            
            
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Category Name"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - TableView  Delegate Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.selectedCategory = categoryItem[indexPath.row]
        }
        
    }
}
