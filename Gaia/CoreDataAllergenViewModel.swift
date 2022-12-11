//
//  CoreDataViewModel.swift
//  CoreDataFruits
//
//  Created by Salvador Garcia on 12/6/22.
//

import Foundation
import CoreData
  
class CoreDataAllergenViewModel: ObservableObject{
    
    let container: NSPersistentContainer
    @Published var savedAllergens: [Allergen] = []
    
    init(){
        container = NSPersistentContainer(name: "AllergenContainer")
        container.loadPersistentStores { description, error in
            if let error = error{
                print(error.localizedDescription)
            } else {
                print("Success")
            }
        }
        
        fetchAllergen()
    }
    
    func fetchAllergen(){
        let request = NSFetchRequest<Allergen>(entityName: "Allergen")
        
        do{
            savedAllergens = try container.viewContext.fetch(request)
        } catch let error{
            print(error.localizedDescription)
        }
        
    }
    
    func addAllergen(allergenName: String){
        let newSavedItem = Allergen(context: container.viewContext)
        newSavedItem.allergenName = allergenName
        //newSavedItem.isChecked = true
        saveAllergenData()
    }
    
    func saveAllergenData(){
        do{
           try container.viewContext.save()
            fetchAllergen()
        } catch let error{
            print(error.localizedDescription)
        }
    }
    
    func deleteAllegen(indexSet: IndexSet){
        guard let index = indexSet.first else {
            return
        }
        let item = savedAllergens[index]
        container.viewContext.delete(item)
        saveAllergenData()
    }
    
    /*func updateAllergen(item: Allergen){
        let currentName = item.allergenName ?? ""
        let newName = currentName + "!"
        item.allergenName = newName
        saveAllergenData()
    }
    
    func updateAllergenList(newArray: [String]){
        savedAllergens = []
        var updatedArray: [Allergen] = []
        for allergy in newArray {
            let newSavedItem = Allergen(context: container.viewContext)
            newSavedItem.allergenName = allergy
            updatedArray.append(newSavedItem)
        }
            
        savedAllergens = updatedArray
        saveAllergenData()
    }*/
}
