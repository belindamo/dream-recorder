//
//  Tag+CoreDataProperties.swift
//  Dream Recorder
//
//  Created by Belinda Mo on 9/27/17.
//  Copyright © 2017 Belinda Mo. All rights reserved.
//
//

import Foundation
import CoreData


extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag")
    }

    @NSManaged public var name: String?
    @NSManaged public var toEntry: NSSet?

}

// MARK: Generated accessors for toEntry
extension Tag {

    @objc(addToEntryObject:)
    @NSManaged public func addToToEntry(_ value: Entry)

    @objc(removeToEntryObject:)
    @NSManaged public func removeFromToEntry(_ value: Entry)

    @objc(addToEntry:)
    @NSManaged public func addToToEntry(_ values: NSSet)

    @objc(removeToEntry:)
    @NSManaged public func removeFromToEntry(_ values: NSSet)

}
