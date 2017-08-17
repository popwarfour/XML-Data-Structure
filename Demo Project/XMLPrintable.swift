//
//  XMLPrintable.swift
//  Demo Project
//
//  Created by Anders Melen on 8/17/17.
//  Copyright © 2017 Anders Melen. All rights reserved.
//

import Foundation

/// A protocol, specifically for `XMLElement` objects
protocol XMLPrintable {
    
    func xmlString(indentation: Int) -> String
    
}


extension XMLPrintable {
    
    static func indentationString(indentation: Int) -> String {
        
        var string = ""
        for _ in 0..<indentation {
            string += "\t"
        }
        return string
        
    }
    
}
