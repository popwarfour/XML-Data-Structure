//
//  XMLObject.swift
//  Demo Project
//
//  Created by Jordan Rouille on 8/17/17.
//  Copyright © 2017 Anders Melen. All rights reserved.
//

import Foundation

/// An XML object container as specifically required by the coding challenge description. Creates a default <root></root> element by default.
class XMLObject {
    
    let root = XMLElement(elementType: "root")
    
    func xmlString() -> String {
        return self.root.xmlString(indentation: 0)
    }
    
}
