//
//  MyTipsViewModel.swift
//  App236
//
//  Created by IGOR on 26/10/2023.
//

import SwiftUI
import CoreData

final class MyTipsViewModel: ObservableObject {
    
    @Published var isAdd: Bool = false
    
    @Published var text: String = ""
    @Published var title: String = ""
    
    @Published var tips: [MyTipsModel] = []
    
    func addTip(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "MyTipsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "MyTipsModel", into: context) as! MyTipsModel
        
        trans.text = text
        trans.title = title

        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchTips() {
        
        CoreDataStack.shared.modelName = "MyTipsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MyTipsModel>(entityName: "MyTipsModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.tips = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.tips = []
        }
    }
}
