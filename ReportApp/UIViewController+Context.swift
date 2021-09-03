//
//  UIViewController+Context.swift
//  ReportApp
//
//  Created by Andre Lemos on 2021-09-02.
//

import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
