//
//  ExampleModel3.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/20/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//
/*
import Foundation

class MessageSpecs {
    
    init() {
        teenProName = ""
        jobType = ""
        documentID = ""
        dateOfJob = ""
        numOfMessages = 0
        newMessageReceived = false
    }
    
    private var teenProName : String
    private var jobType : String
    private var documentID : String
    private var dateOfJob : String
    private var numOfMessages : Int
    private var newMessageReceived : Bool
    
    // MARK: Accessors
    
    public func getTeenProName() -> String {
        return teenProName
    }
    
    public func getJobType() -> String {
        return jobType
    }
    
    public func getDocumentID() -> String {
        return documentID
    }
    
    public func getDateOfJob() -> String {
        return dateOfJob
    }
    
    public func getNumOfMessages() -> Int {
        return numOfMessages
    }
    
    public func getNewMessageReceived() -> Bool {
        return newMessageReceived
    }
    
    // MARK: Mutators
    
    public func setTeenProName(teenProName : String) {
        // Return the first name + last initial to protect the teenPros identity
        let split = teenProName.split(separator: " ")
        let firstName = String(split.prefix(1).joined(separator: [" "]))
        let lastName = String(split.suffix(1).joined(separator: [" "]))
        let lastInitial = lastName.first!
        let censoredName = firstName + " " + String(lastInitial)
        
        self.teenProName = censoredName
    }
    
    public func setJobType(jobType : String) {
        self.jobType = jobType
    }
    
    public func setDocumentID(documentID : String) {
        self.documentID = documentID
    }
*/
