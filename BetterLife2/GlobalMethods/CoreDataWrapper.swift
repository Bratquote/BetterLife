//
//  CoreDataWrapper.swift
//  BetterLife2
//
//  Created by Timur Karimov on 01.03.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit
import CoreData


class CoreDataWrapper {
    static let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    static func city(_ city: CityItem, action: ActionType) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "City")
        
        switch action {
        case .create:
            let cityInfoEntity =
                NSEntityDescription.entity(forEntityName: "City",
                                           in: managedContext)!
            let newCity = NSManagedObject(entity: cityInfoEntity, insertInto: managedContext)
            
            //newCard.setValue(UserDefaultsWrapper.lastCardIndex(), forKey: "id")
            newCity.setValue(city.id, forKey: "id")
            newCity.setValue(city.isSelected, forKey: "isSelected")
            newCity.setValue(city.name, forKey: "name")
            break
        case .edit:
            fetchRequest.predicate = NSPredicate(format: "id = \(Int64(city.id))")
            do {
                if let oldCity = try managedContext.fetch(fetchRequest).first {
                    oldCity.setValue(city.id, forKey: "id")
                    oldCity.setValue(city.isSelected, forKey: "isSelected")
                    oldCity.setValue(city.name, forKey: "name")
                } else {}
            } catch {
                print(error)
            }
            break
        case .delete:
            fetchRequest.predicate = NSPredicate(format: "id = \(Int64(city.id))")
            do {
                if let city = try managedContext.fetch(fetchRequest).first {
                    managedContext.delete(city)
                   
                }
            } catch {
                print(error)
            }
            break
        }
        do {
         try managedContext.save()
        } catch {
            print(error)
        }
    }
    
    static func getCityList() -> [CityItem] {
        var list: [CityItem] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "City")
        
        do {
            let cities = try managedContext.fetch(fetchRequest)
            
            for i in cities {
                let city: CityItem = CityItem(
                    id: i.value(forKey: "id") as! Int,
                    name: i.value(forKey: "name") as! String,
                    isSelected: i.value(forKey: "isSelected") as! Bool)
                list.append(city)
            }
        } catch {
            print(error)
        }

        return list
    }
    
    static func person(_ person: PersonItem, action: ActionType) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        switch action {
        case .create:
            let personInfoEntity =
                NSEntityDescription.entity(forEntityName: "Person",
                                           in: managedContext)!
            let newPerson = NSManagedObject(entity: personInfoEntity, insertInto: managedContext)
            
            newPerson.setValue(person.id, forKey: "id")
            newPerson.setValue(person.name, forKey: "name")
            break
        case .edit:
            fetchRequest.predicate = NSPredicate(format: "id = \(Int64(person.id))")
            do {
                if let oldPerson = try managedContext.fetch(fetchRequest).first {
                    oldPerson.setValue(person.id, forKey: "id")
                    oldPerson.setValue(person.name, forKey: "name")
                } else {}
            } catch {
                print(error)
            }
            break
        case .delete:
            fetchRequest.predicate = NSPredicate(format: "id = \(Int64(person.id))")
            do {
                if let card = try managedContext.fetch(fetchRequest).first {
                    managedContext.delete(card)
                }
            } catch {
                print(error)
            }
            break
        }
        do {
         try managedContext.save()
        } catch {
            print(error)
        }
    }
    
    static func getPersonsList() -> [PersonItem] {
        var list: [PersonItem] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do {
            let persons = try managedContext.fetch(fetchRequest)
            
            for i in persons {
                let person: PersonItem = PersonItem(
                    id: i.value(forKey: "id") as! Int,
                    name: i.value(forKey: "name") as! String)
                list.append(person)
            }
        } catch {
            print(error)
        }

        return list
    }
    
    
    static func updateQLItem(_ item: QLItem, action: ActionType) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "QualityLifeItem")
        switch action {
        case .create:
            let personInfoEntity =
                NSEntityDescription.entity(forEntityName: "QualityLifeItem",
                                           in: managedContext)!
            let newQLItem = NSManagedObject(entity: personInfoEntity, insertInto: managedContext)
            
            newQLItem.setValue(item.id ?? UserDefaultsWrapper.lastCardIndex(of: .QLItem), forKey: "id")
            newQLItem.setValue(item.name, forKey: "name")
            newQLItem.setValue(item.important, forKey: "important")
            newQLItem.setValue(item.satisfaction, forKey: "satisfaction")
            newQLItem.setValue(item.comment, forKey: "comment")
            newQLItem.setValue(item.category.rawValue, forKey: "category")
            break
        case .edit:
           fetchRequest.predicate = NSPredicate(format: "id = \(Int64(item.id!))")
            do {
                if let oldItem = try managedContext.fetch(fetchRequest).first {
                    oldItem.setValue(item.id!, forKey: "id")
                    oldItem.setValue(item.name, forKey: "name")
                    oldItem.setValue(item.important, forKey: "important")
                    oldItem.setValue(item.satisfaction, forKey: "satisfaction")
                    oldItem.setValue(item.comment, forKey: "comment")
                    oldItem.setValue(item.category.rawValue, forKey: "category")
                } else {}
            } catch {
                print(error)
            }
            break
        case .delete:
            fetchRequest.predicate = NSPredicate(format: "id = \(Int64(item.id!))")
            do {
                if let card = try managedContext.fetch(fetchRequest).first {
                    managedContext.delete(card)
                }
            } catch {
                print(error)
            }
            break
        }
        do {
         try managedContext.save()
        } catch {
            print(error)
        }
    }
    
    
    static func getQLList() -> [QLItem] {
        var list: [QLItem] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "QualityLifeItem")
        
        do {
            let items = try managedContext.fetch(fetchRequest)
            
            for i in items {
                let item: QLItem = QLItem(id: i.value(forKey: "id") as! Int,
                                                  name: i.value(forKey: "name") as! String,
                                                  satisfaction: i.value(forKey: "satisfaction") as! Int,
                                                  important: i.value(forKey: "important") as! Int,
                                                  category: QLListCategory(rawValue: i.value(forKey: "category") as! String) ?? QLListCategory.none,
                                                  comment: i.value(forKey: "comment") as! String)
                list.append(item)
            }
        } catch {
            print(error)
        }
        return list
    }
    
    
    static func updateTarget(item: TargetItem, action: ActionType) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Target")
               switch action {
               case .create:
                   let personInfoEntity =
                       NSEntityDescription.entity(forEntityName: "Target",
                                                  in: managedContext)!
                   let newItem = NSManagedObject(entity: personInfoEntity, insertInto: managedContext)
                   
                   newItem.setValue(item.id ?? UserDefaultsWrapper.lastCardIndex(of: .target), forKey: "id")
                   newItem.setValue(item.name, forKey: "name")
                   newItem.setValue(item.isCompleted, forKey: "isCompleted")
                   newItem.setValue(item.date, forKey: "date")
                   newItem.setValue(item.type.rawValue, forKey: "period")
                   
                   break
               case .edit:
                  fetchRequest.predicate = NSPredicate(format: "id = \(Int64(item.id!))")
                   do {
                       if let oldItem = try managedContext.fetch(fetchRequest).first {
                           oldItem.setValue(item.id!, forKey: "id")
                           oldItem.setValue(item.name, forKey: "name")
                           oldItem.setValue(item.isCompleted, forKey: "isCompleted")
                           oldItem.setValue(item.date, forKey: "date")
                           oldItem.setValue(item.type.rawValue, forKey: "period")
                       } else {}
                   } catch {
                       print(error)
                   }
                   break
               case .delete:
                   fetchRequest.predicate = NSPredicate(format: "id = \(Int64(item.id!))")
                   do {
                       if let item = try managedContext.fetch(fetchRequest).first {
                           managedContext.delete(item)
                       }
                   } catch {
                       print(error)
                   }
                break
                    }
        
               do {
                try managedContext.save()
               } catch {
                   print(error)
               }
    }
    
    static func getTargetList(type: DateType, date: Date? = nil) -> [TargetItem] {
        var list: [TargetItem] = []
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Target")
        
        do {
            let items = try managedContext.fetch(fetchRequest)
            print(type)
            print(date)
            for i in items {
                let item: TargetItem = TargetItem(id: i.value(forKey: "id") as! Int,
                                                  name: i.value(forKey: "name") as! String,
                                                  date: i.value(forKey: "date") as! Date,
                                                  type: DateType(rawValue: i.value(forKey: "period") as! String)!,
                                                isCompleted: i.value(forKey: "isCompleted") as! Bool )
                
                if type == item.type {
                    if let date = date {
                            switch type {
                            case .year:
                                if date.getYear() == item.date.getYear() {
                                    list.append(item)
                                }
                                break
                            case .month:
                                if date.getYear() == item.date.getYear() && date.getMonth() == item.date.getMonth() {
                                    list.append(item)
                                }
                                break
                            case .week:
                                if date.getYear() == item.date.getYear() && date.getMonth() == item.date.getMonth() && date.getDay() == item.date.getDay() {
                                    list.append(item)
                                }
                                break
                            case .day:
                                if date.getYear() == item.date.getYear() && date.getMonth() == item.date.getMonth() && date.getDay() == item.date.getDay() {
                                    list.append(item)
                                }
                                break
                            default:
                                break
                            }
                    } else {
                    list.append(item)
                    }
                }
                
            }
        } catch {
            print(error)
        }
        
        
        return list
    }
    
    
    
    
    
    
    
    static func updateNote(item: DateItem, text: String, action: ActionType) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Note")
                switch action {
                    case .create:
                        let personInfoEntity =
                            NSEntityDescription.entity(forEntityName: "Note",
                                                                in: managedContext)!
                        let newItem = NSManagedObject(entity: personInfoEntity, insertInto: managedContext)
                            
                        newItem.setValue((item.date ?? Date(timeIntervalSince1970: 0)).getDateString(), forKey: "date")
                        newItem.setValue(item.type.rawValue, forKey: "type")
                        newItem.setValue(text, forKey: "text")
                            break
                    case .edit:
                        fetchRequest.predicate = NSPredicate(format: "date = \"\((item.date ?? Date(timeIntervalSince1970: 0)).getDateString())\"")
                            do {
                                if let items = try? managedContext.fetch(fetchRequest){
                                    for i in items {
                                        if i.value(forKey: "type") as! String == item.type.rawValue {
                                            i.setValue((item.date ?? Date(timeIntervalSince1970: 0)).getDateString(), forKey: "date")
                                            i.setValue(item.type.rawValue, forKey: "type")
                                            i.setValue(text, forKey: "text")
                                        }
                                    }
                                    
                                } else {}
                            } catch {
                                    print(error)
                                 }
                                 break
                             case .delete:
                               fetchRequest.predicate = NSPredicate(format: "date == \((item.date ?? Date(timeIntervalSince1970: 0)).getDateString())")
                                 do {
                                    if let items = try? managedContext.fetch(fetchRequest) {
                                        for i in items {
                                            if i.value(forKey: "type") as! String == item.type.rawValue {
                                                managedContext.delete(i)
                                            }
                                        }
                                         //managedContext.delete(item)
                                     }
                                 } catch {
                                     print(error)
                                 }
                              break
                                  }
                      
                             do {
                              try managedContext.save()
                             } catch {
                                 print(error)
                             }
    }
    
    
    static func getNoteValue(item: DateItem) -> String {
         let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Note")
       fetchRequest.predicate = NSPredicate(format: "date = \"\((item.date ?? Date(timeIntervalSince1970: 0)).getDateString())\"")
       do {
           if let items = try? managedContext.fetch(fetchRequest){
               for i in items {
                   if i.value(forKey: "type") as! String == item.type.rawValue {
                    let text = i.value(forKey: "text") as! String
                    return text
                   }
               }
               
           } else {}
       } catch {
               print(error)
            }
        CoreDataWrapper.updateNote(item: item, text: "", action: .create)
        return ""
    }
    
    
    static func factor(_ factor: FactorItem, action: ActionType) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Factor")
        
        switch action {
        case .create:
            
            let factorsEntity =
                            NSEntityDescription.entity(forEntityName: "Factor",
                                                     in: managedContext)!
            let newFactor = NSManagedObject(entity: factorsEntity, insertInto: managedContext)
            
            newFactor.setValue(UserDefaultsWrapper.lastCardIndex(of: .factor), forKey: "id")
            newFactor.setValue(factor.name, forKey: "name")
            newFactor.setValue(factor.emotion.rawValue, forKey: "emotion")
            newFactor.setValue(factor.position.rawValue, forKey: "position")
            break
        case .edit:
            fetchRequest.predicate = NSPredicate(format: "id = \(Int64(factor.id!))")
            do {
                if let oldFactor = try managedContext.fetch(fetchRequest).first {
                    oldFactor.setValue(factor.id, forKey: "id")
                    oldFactor.setValue(factor.emotion.rawValue, forKey: "emotion")
                    oldFactor.setValue(factor.position.rawValue, forKey: "position")
                    oldFactor.setValue(factor.name, forKey: "name")
                    } else {}
                } catch {
                    print(error)
                }
            break
        case .delete:
            fetchRequest.predicate = NSPredicate(format: "id = \(Int64(factor.id!))")
                do {
                    if let factor = try managedContext.fetch(fetchRequest).first {
                    managedContext.delete(factor)
                    }
                } catch {
                    print(error)
                }
            break
        }
        do {
            try managedContext.save()
        } catch {
            print(error)
        }
    }
    
    
    static func getFactorsList() -> [FactorItem] {
        var list: [FactorItem] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Factor")
        do {
            let factors = try managedContext.fetch(fetchRequest)
            
            for i in factors {
                let factor: FactorItem = FactorItem(
                    id: (i.value(forKey: "id") as! Int),
                    name: i.value(forKey: "name") as! String,
                    emotion: EmotionType(rawValue: i.value(forKey: "emotion") as! String)!,
                    position: PositionType(rawValue: i.value(forKey: "position") as! String)!)
                list.append(factor)
            }
        } catch {
            print(error)
        }
        return list
    }
    
}



