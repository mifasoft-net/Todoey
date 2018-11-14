//
//  Items.swift
//  Todoey
//
//  Created by Saran Siriwatanametanon on 13/11/2561 BE.
//  Copyright © 2561 Saran Siriwatanametanon. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreate : Date = Date()
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
