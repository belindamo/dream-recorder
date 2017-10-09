//
//  Entry+CoreDataProperties.swift
//  Dream Recorder
//
//  Created by Belinda Mo on 9/27/17.
//  Copyright © 2017 Belinda Mo. All rights reserved.
//
//

import Foundation
import CoreData


extension Entry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entry> {
        return NSFetchRequest<Entry>(entityName: "Entry")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var title: String?
    @NSManaged public var emotion: Int16
    @NSManaged public var content: String?
    @NSManaged public var toTag: NSSet?

}

// MARK: Generated accessors for toTag
extension Entry {

    @objc(addToTagObject:)
    @NSManaged public func addToToTag(_ value: Tag)

    @objc(removeToTagObject:)
    @NSManaged public func removeFromToTag(_ value: Tag)

    @objc(addToTag:)
    @NSManaged public func addToToTag(_ values: NSSet)

    @objc(removeToTag:)
    @NSManaged public func removeFromToTag(_ values: NSSet)

}
