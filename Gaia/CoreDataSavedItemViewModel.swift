//
//  CoreDataViewModel.swift
//  CoreDataFruits
//
//  Created by Salvador Garcia on 12/6/22.
//

import Foundation
import CoreData
  
class CoreDataSavedItemViewModel: ObservableObject{
    
    let container: NSPersistentContainer
    @Published var savedItems: [SavedItem] = []
    
    init(){
        container = NSPersistentContainer(name: "SavedItemContainer")
        container.loadPersistentStores { description, error in
            if let error = error{
                print(error.localizedDescription)
            } else {
                print("Success")
            }
        }
        
        fetchSavedItems()
    }
    
    func fetchSavedItems(){
        let request = NSFetchRequest<SavedItem>(entityName: "SavedItem")
        
        do{
            savedItems = try container.viewContext.fetch(request)
        } catch let error{
            print(error.localizedDescription)
        }
        
    }
    
    func addItem(productName: String, ingredients: String){
        let newSavedItem = SavedItem(context: container.viewContext)
        newSavedItem.productName = productName
        newSavedItem.ingredientList = ingredients
        saveData()
    }
    
    func saveData(){
        do{
           try container.viewContext.save()
            fetchSavedItems()
        } catch let error{
            print(error.localizedDescription)
        }
    }
    
    func deleteItem(indexSet: IndexSet){
        guard let index = indexSet.first else {
            return
        }
        let item = savedItems[index]
        container.viewContext.delete(item)
        saveData()
    }
    
    func updateItem(item: SavedItem){
        let currentName = item.productName ?? ""
        let newName = currentName + "!"
        item.productName = newName
        saveData()
    }
}
