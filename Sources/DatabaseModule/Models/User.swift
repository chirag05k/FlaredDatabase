//
//  File.swift
//
//
//  Created by Chirag Vekariya on 05/06/24.
//

import UIKit

public struct User: Codable {
    public let id: String
    public var name: String
    public var age: Int
    public var pronoun: Pronoun
    public var location: String
    public var bio: String
    public var imageUrl: String
    public var imageData: Data?
    public var instagrameProfileURL: String
    public var facebookProfileURL: String
    
    public var image: UIImage? {
        get {
            guard let imageData = imageData else { return nil }
            return UIImage(data: imageData)
        }
        set {
            imageData = newValue?.jpegData(compressionQuality: 1.0)
        }
    }
    
    public init(id: String, name: String, age: Int, pronoun: Pronoun, location: String, bio: String, imageUrl: String, image: UIImage?, instagrameProfileURL: String, facebookProfileURL: String) {
        self.id = id
        self.name = name
        self.age = age
        self.pronoun = pronoun
        self.location = location
        self.bio = bio
        self.imageUrl = imageUrl
        self.imageData = image?.jpegData(compressionQuality: 1.0)
        self.instagrameProfileURL = instagrameProfileURL
        self.facebookProfileURL = facebookProfileURL
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case age
        case pronoun
        case location
        case bio
        case imageUrl
        case imageData
        case instagrameProfileURL
        case facebookProfileURL
    }
}
