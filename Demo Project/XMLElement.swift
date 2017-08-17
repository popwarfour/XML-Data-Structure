//
//  XMLElement.swift
//  Demo Project
//
//  Created by Anders Melen on 8/17/17.
//  Copyright © 2017 Anders Melen. All rights reserved.
//

import Foundation

/// Represents an single XML element
class XMLElement: XMLPrintable {

    var elementType: String
    var attributes: [XMLAttribute]?
    
    var children: [XMLElement]?
    var content: String?
    
    init(elementType: String,
         attributes: [XMLAttribute]? = nil,
         content: String? = nil,
         children: [XMLElement]? = nil) {
        
        self.elementType = elementType
        self.attributes = attributes
        
        self.content = content
        self.children = children

    }
    
    // MARK: - Convienence Methods
    // MARK: Elements
    func addChildElement(element: XMLElement) {
        
        if self.children == nil {
            self.children = []
        }
        self.children!.append(element)
        
    }
    
    func addChildElements(elements: [XMLElement]) {
        
        if self.children == nil {
            self.children = []
        }
        self.children!.append(contentsOf: elements)
        
    }
    
    // MARK: Content
    func setContent(content: String) {
        
        self.content = content
        
    }
    
    // MARK: Attribute
    func addAttribute(attribute: XMLAttribute) {
        
        if self.attributes == nil {
            self.attributes = []
        }
        self.attributes!.append(attribute)
        
    }
    
    func addAttributes(attributes: [XMLAttribute]) {
        
        if self.attributes == nil {
            self.attributes = []
        }
        self.attributes!.append(contentsOf: attributes)
        
    }
    
    // MARK: XMLPrintable Protocol
    func xmlString(indentation: Int) -> String {
        
        // Opening Tag
        var string = XMLElement.indentationString(indentation: indentation)
        
        string += "<\(elementType)"
        if let attributes = self.attributes,
            attributes.count > 0 {
            
            var attributeString = " "
            
            for i in 0..<attributes.count {
                
                let attribute = attributes[i]
                
                attributeString += attribute.xmlString(indentation: 0)
                if i < attributes.count - 1 {
                    attributeString += " "
                }
                
            }
            
            string += attributeString
            
        }
        string += ">"
        
        if self.children != nil {
            // Only elements with children go on new lines
            string += "\n"
        }
        
        // Content
        if let content = self.content {
            
            if self.children != nil {
                // Indenent if we are not a element with no children (one liner)
                string += XMLElement.indentationString(indentation: indentation + 1)
            }
            
            string += content
            
            if self.children != nil {
                string += "\n"
            }
        }
        
        // Children
        if let children = self.children {
           
            for child in children {
            
                string += child.xmlString(indentation: indentation + 1)
                string += "\n"
                
            }
            
        }

        if self.children != nil {
            // Only element with children get indented closing tags
            string += XMLElement.indentationString(indentation: indentation)
        }
        
        // Closing Tag
        string += "</\(elementType)>"
        
        return string
    }
    
}
