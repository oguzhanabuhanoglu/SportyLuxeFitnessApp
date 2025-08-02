//
//  UserModel.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 31.07.2025.
//

import Foundation

struct UserModel: Codable, Hashable {
    let id: String
    var name: String
    var surname: String
    let identityNumber: String
    let dateOfBirth: String
    var phoneNumber: String
    var email: String
    let role: AccountType
    let avatarUrl: String?
    let membershipStartDate: Date?
    let membershipEndDate: Date?
    let membershipDuration: String?
    let measurement: MeasurementModel?
    let myProgram: ProgramModel?
    

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case surname
        case identityNumber
        case dateOfBirth
        case phoneNumber
        case email
        case role
        case avatarUrl
        case membershipStartDate
        case membershipEndDate
        case membershipDuration
        case measurement
        case myProgram
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.surname = try container.decode(String.self, forKey: .surname)
        self.identityNumber = try container.decode(String.self, forKey: .identityNumber)
        self.dateOfBirth = try container.decode(String.self, forKey: .dateOfBirth)
        self.phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        self.email = try container.decode(String.self, forKey: .email)
        self.role = try container.decodeIfPresent(AccountType.self, forKey: .role) ?? .regularMember
        self.avatarUrl = try container.decodeIfPresent(String.self, forKey: .avatarUrl)
        self.membershipStartDate = try container.decodeIfPresent(Date.self, forKey: .membershipStartDate)
        self.membershipEndDate = try container.decodeIfPresent(Date.self, forKey: .membershipEndDate)
        self.membershipDuration = try container.decodeIfPresent(String.self, forKey: .membershipDuration)
        self.measurement = try container.decode(MeasurementModel.self, forKey: .measurement)
        self.myProgram = try container.decode(ProgramModel.self, forKey: .myProgram)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(surname, forKey: .surname)
        try container.encode(identityNumber, forKey: .identityNumber)
        try container.encode(dateOfBirth, forKey: .dateOfBirth)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(email, forKey: .email)
        try container.encode(role, forKey: .role)
        try container.encodeIfPresent(avatarUrl, forKey: .avatarUrl)
        try container.encodeIfPresent(membershipStartDate, forKey: .membershipStartDate)
        try container.encodeIfPresent(membershipEndDate, forKey: .membershipEndDate)
        try container.encodeIfPresent(membershipDuration, forKey: .membershipDuration)
        try container.encodeIfPresent(measurement, forKey: .measurement)
        try container.encodeIfPresent(myProgram, forKey: .myProgram)
    }
}


enum AccountType: String, Codable, CaseIterable {
    case admin
    
    case personalTrainer
    
    case goldMember
    
    case regularMember
    
}


extension UserModel {
    var fullName: String {
        name + " " + surname
    }
}

extension UserModel {
    init(id: String,
         name: String,
         surname: String,
         email: String,
         phoneNumber: String,
         role: AccountType = .regularMember,
         identityNumber: String,
         dateOfBirth: String,
         avatarUrl: String? = nil,
         membershipStartDate: Date? = nil,
         membershipEndDate: Date? = nil,
         membershipDuration: String? = nil,
         measurement: MeasurementModel,
         myProgram: ProgramModel) {
        
        self.id = id
        self.name = name
        self.surname = surname
        self.email = email
        self.phoneNumber = phoneNumber
        self.role = role
        self.identityNumber = identityNumber
        self.dateOfBirth = dateOfBirth
        self.avatarUrl = avatarUrl
        self.membershipStartDate = membershipStartDate
        self.membershipEndDate = membershipEndDate
        self.membershipDuration = membershipDuration
        self.measurement = measurement
        self.myProgram = myProgram
    }
}
