//
//  XMLAttribute.swift
//  Demo Project
//
//  Created by Anders Melen on 8/17/17.
//  Copyright © 2017 Anders Melen. All rights reserved.
//

import Foundation

/// An XML attribute. Normally found inside an `XMLElement` object.
class XMLAttribute: XMLPrintable {
    
    let name: String
    let value: String
    
    init(name: String,
         value: String) {
        
        self.name = name
        self.value = value
        
    }
    
    // MARK: - XMLPrintable Protocol
    func xmlString(indentation: Int) -> String {
        
        var indentationString = XMLAttribute.indentationString(indentation: indentation)
        indentationString += "\(name)=\"\(value)\""
        return indentationString
        
    }
    
}
