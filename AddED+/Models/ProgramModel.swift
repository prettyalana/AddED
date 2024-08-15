//
//  ProgramModel.swift
//  AddED+
//
//  Created by 6 GO Gantz on 7/13/24.
//

import Foundation
import SwiftUI

struct Rating: Identifiable{
    var program: Program
    var starCount: Int
    var title: String
    var description: String
    let id = UUID()
}

class Program: Identifiable {
    var name: String
    var description: String
    var time: String
    var days: String
    var place: String
    var verified: Bool
    var ratings: [Rating]
    var tags: [Tag]
    var id: Int
    var imageName: String
    init(inputName: String, inputDescription: String, inputTime: String, inputDays: String, inputPlace: String, isVerified: Bool, ratingsArray: [Rating], tagsArray: [Tag], idNumber: Int, imageID: String) {
        name = inputName
        description = inputDescription
        time = inputTime
        days = inputDays
        place = inputPlace
        verified = isVerified
        ratings = ratingsArray
        tags = tagsArray
        id = idNumber
        imageName = imageID
    }
    
    func addTag(inputTag: Tag) {
        tags.append(inputTag)
    }
    
    func removeTag(inputTag: Tag) {
        for i in 0...tags.count {
            if tags[i] === inputTag {
                tags.remove(at: i)
                break
            }
        }
    }
    func addRating(inputRating: Rating) {
        ratings.append(inputRating)
    }
    
    func toggleVerify() {
        verified.toggle()
    }
    
    func ratingsAverageScore() -> Int {
        var sum = 0
        for i in ratings {
            sum += i.starCount
        }
        return sum
    }
    
}

struct User {
    var name: String
    var username: String
    var interests: [String]
    var email: String
    var password: String
    var savedPrograms: [Int]
    var profilePicture: String = "profileImage"
    
    
    func programHasInterests(program: Program) -> Bool {
        for i in program.tags {
            if interests.contains(i.name) {
                return true
            }
        }
        return false
    }
}

class Tag: Identifiable {
    var name: String
    var type: String
    init(inputName: String, inputType: String) {
        name = inputName
        type = inputType
    }
    func getTypeColor() -> Color {
        switch type {
        case "Age Group":
            return Color.yellow
        case "Tech":
            return Color.blue
        case "Arts":
            return Color.pink
        case "Sports":
            return Color.red
        case "Culinary":
            return Color.green
        case "Civic Engagement":
            return Color.orange
        default:
            return Color.black
        }
    }
    
}

let technologyTag = Tag(inputName: "Technology", inputType: "Tech")
let paidTag = Tag(inputName: "$ Paid Internship", inputType: "Paid")
let artsTag = Tag(inputName: "Arts", inputType: "Arts")
let sportsTag = Tag(inputName: "Sports", inputType: "Sports")
let civicTag = Tag(inputName: "Civic Engagement", inputType: "Civic Engagement")
let culinaryTag = Tag(inputName: "Culinary", inputType: "Culinary")

// Sample input tags
let businessTag = Tag(inputName: "Business", inputType: "Business")
let researchTag = Tag(inputName: "Research", inputType: "Research")
let volunteerTag = Tag(inputName: "Volunteer", inputType: "Volunteer")


var placeholderTags: [Tag] = [technologyTag, paidTag, artsTag, sportsTag, civicTag]
var inputTag: [Tag] = [businessTag, researchTag, volunteerTag]

var ECCChicago = Program(inputName: "Everyone Can Code Chicago", inputDescription: "The Everyone Can Code Chicago initiative was launched as a public-private partnership that expands opportunities for youth to develop coding skills and explore career pathways.  Through this initiative, employees at local businesses share their professional experience with youth.  And the youth have the opportunity to gain work experience through internships.", inputTime: "2:00 PM - 5:00 PM", inputDays: "Weekdays 06/24/2024-8/02/2024", inputPlace: "Truman College", isVerified: true, ratingsArray: [], tagsArray: [technologyTag, paidTag], idNumber: 1, imageID: "ECC")
var afterSchoolMatters = Program(inputName: "After School Matters", inputDescription: "After School Matters inspires Chicago’s teens to discover their passions, develop skills for life beyond high school, and make friends along the way.", inputTime: "", inputDays: "07/16/2024-07/16/2025", inputPlace: "Chicago, Il", isVerified: true, ratingsArray: [], tagsArray: [technologyTag, artsTag, culinaryTag, paidTag, sportsTag, civicTag], idNumber: 2, imageID:"afterSchoolMatters")
var cyberSecurityProgram = Program(inputName: "Intro to Cybersecurity", inputDescription: "Program Info", inputTime: "07/25/24",inputDays: "08/25/24", inputPlace: "Chicago, IL", isVerified: true, ratingsArray: [], tagsArray: [technologyTag, paidTag], idNumber: 3, imageID:"Placeholder")
var webDevProgram = Program(inputName: "Intro to Web Development", inputDescription: "After School Matters inspires Chicago’s teens to discover their passions, develop skills for life beyond high school, and make friends along the way.", inputTime: "07/25/24",inputDays: "08/25/24", inputPlace: "Chicago, IL", isVerified: true, ratingsArray: [], tagsArray: [technologyTag, paidTag], idNumber: 4, imageID:"Placeholder")

var placeholderPrograms: [Program] = [ECCChicago, afterSchoolMatters, cyberSecurityProgram, webDevProgram]
var placeholderFeaturedPrograms: [Program] = [ECCChicago, afterSchoolMatters]
var savedPrograms: [Program] = [ECCChicago, cyberSecurityProgram]

var currentUser = User(name: "John Doe", username: "johndoe", interests: ["Technology"], email: "johndoe@example.com", password: "example", savedPrograms: [1, 3])

var ECCReviewOne = Rating(program: ECCChicago, starCount: 4, title: "Great Program!!!", description: "This program taught me how to code!")
var ECCReviewTwo = Rating(program: ECCChicago, starCount: 4, title: "Great Program!!!", description: "This program taught me how to code!")
var ECCReviewThree = Rating(program: ECCChicago, starCount: 4, title: "Great Program!!!", description: "This program taught me how to code!")
var placeholderRatings = [ECCReviewOne, ECCReviewTwo,ECCReviewThree]
