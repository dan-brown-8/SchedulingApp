//
//  ExampleModel.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/20/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//
/*
struct AcceptedTeenPro {
    private var email: String?
    private var firstName: String?
    private var lastName: String?
    private var stripeID: String?
    
    init() {}
    
    init(teenPro: [String:Any]) {
        setEmail(email: teenPro["emailAddress"] as? String ?? "")
        setFirstName(firstName: teenPro["firstName"] as? String ?? "")
        setLastName(lastName: teenPro["lastName"] as? String ?? "")
        setStripeID(stripeID: teenPro["stripeID"] as? String ?? "")
    }
    
    public func getEmail() -> String {
        return email ?? ""
    }
    
    public func getFirstName() -> String {
        return firstName ?? ""
    }
    
    public func getLastName() -> String {
        return lastName ?? ""
    }
    
    public func getStripeID() -> String {
        return stripeID ?? ""
    }
    
    mutating func setEmail(email: String) {
        self.email = email
    }
    
    mutating func setFirstName(firstName: String) {
        self.firstName = firstName
    }
    
    mutating func setLastName(lastName: String) {
        self.lastName = lastName
    }
    
    mutating func setStripeID(stripeID: String) {
        self.stripeID = stripeID
    }
    
    public func asDictionary() -> [String : Any] {
        var teenPro: [String : Any] = [:]
        
        teenPro["emailAddress"] = getEmail()
        teenPro["firstName"] = getFirstName()
        teenPro["lastName"] = getLastName()
        teenPro["stripedID"] = getStripeID()
        
        return teenPro
    }
}
*/
