//
//  AppDelegate.swift
//  Demo Project
//
//  Created by Anders Melen on 8/17/17.
//  Copyright © 2017 Anders Melen. All rights reserved.
//

// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------- Service Fusion Coding Challenge --------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------
/*
 
    Challenge Part 1)
     
         Write a simple program to store some simple XML - basic tags and attributes. Don't worry about the encoding or XML features except for the tags and tag attributes. You cannot use any existing XML libraries or APIs. Your code should compile and run and demonstrate the abilities of the your XML classes.
         
         
         Example code in C#
         
         XMLObject x = new XMLObject();
         XMLTag root = x.GetRoot();
         root.SetName("People");
         XMLTag person = root.NewTag("Person");
         person.AddAttribute("id", "2323");
         person.AddAttribute("DOB", "1/1/1901");
         XMLTag fname = person.NewTag("FirstName", "John");
         XMLTag lname = person.NewTag("LastName", "Smith");
         XMLTag address = person.NewTag("address");
         address.NewTag("street", "123 NW 45th street");
         address.NewTag("city", "Gaithersburg");
         address.NewTag("zip", "21234");
         address.NewTag("state", "MD");
         x.Print();
         
         Example output
         <people>
             <person id="2323" DOB="1/1/1901">
                 <firstname>John</firstname>
                 <lastname>Smith</lastname>
                 <address>
                    <street>123 NW 45th street</street>
                    <city>Gaithersuburg</city>
                    <zip>21234</zip>
                    <state>MD</state>
                 </address>
             </person>
         </people>
 
    ------------------------------------------------------------------------------------------
    Challenge Part 2)
    
        - Include a second <person> object.

    ------------------------------------------------------------------------------------------
    Challenge Part 3)
    
        - Include a <apartment> element  under <street> while maintaining the content already inside street.
 
 
*/
// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------


import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Create and print the coding test material
        AppDelegate.codingTest()
        
        return true
    }
    
    // MARK: - Tests
    static func codingTest() {
        
        // Create XLM Object
        let xmlObject = XMLObject()
        
        // Set Root As `People` Type
        let root = xmlObject.root
        root.elementType = "people"
        
        let john = AppDelegate.createPerson(firstName: "John",
                                            lastName: "Smith",
                                            id: "2323",
                                            dob: "1/1/1901",
                                            street: "123 NW 45th street",
                                            apartment: "Johns pad",
                                            city: "Gaithersuburg",
                                            zip: "21234",
                                        	state: "MD")
        let anders = AppDelegate.createPerson(firstName: "Anders",
                                              lastName: "Melene",
                                              id: "4345",
                                              dob: "1f43/1/1901",
                                              street: "123 NW 45th ave",
                                              apartment: "My Apartment",
                                              city: "Gaithersuburg",
                                              zip: "2f1234",
                                              state: "VT")
        root.addChildElements(elements: [john,
                                         anders])
        
        // Print the XML
        print("\(root.xmlString(indentation: 0))")
        
    }
    
    // MARK: - Common Constructors
    static func createPerson(firstName: String,
                             lastName: String,
                             id: String,
                             dob: String,
                             street: String,
                             apartment: String,
                             city: String,
                             zip: String,
                             state: String) -> XMLElement {
        
        // Create `Person` element
        let person = XMLElement(elementType: "person")
        
        
        // Create `Person` Attributes
        let idAttribute = XMLAttribute(name: "id",
                                       value: id)
        let dobAttribute = XMLAttribute(name: "DOB",
                                        value: dob)
        person.addAttributes(attributes: [idAttribute,
                                          dobAttribute])
        
        // Add children to `Person`
        // First / Last Name
        let firstNameElement = XMLElement(elementType: "firstname",
                                          attributes: nil,
                                          content: firstName,
                                          children: nil)
        let lastNameElement = XMLElement(elementType: "lastname",
                                         attributes: nil,
                                         content: lastName,
                                         children: nil)
        
        // Address
        let addressElement = XMLElement(elementType: "address")
        
        let apartmentElement = XMLElement(elementType: "apartment",
                                          attributes: nil,
                                          content: apartment,
                                          children: nil)
        
        let streetElement = XMLElement(elementType: "street",
                                       attributes: nil,
                                       content: street,
                                       children: [apartmentElement])
        let cityElement = XMLElement(elementType: "city",
                                     attributes: nil,
                                     content: city,
                                     children: nil)
        let zipElement = XMLElement(elementType: "zip",
                                    attributes: nil,
                                    content: zip,
                                    children: nil)
        let stateElement = XMLElement(elementType: "state",
                                      attributes: nil,
                                      content: state,
                                      children: nil)
        addressElement.addChildElements(elements: [streetElement,
                                                   cityElement,
                                                   zipElement,
                                                   stateElement])
        
        // Add children to `Person`
        person.addChildElements(elements: [firstNameElement,
                                           lastNameElement,
                                           addressElement])
        
        return person
        
    }

}

