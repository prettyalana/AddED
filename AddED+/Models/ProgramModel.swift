//
//  ProgramModel.swift
//  AddED+
//
//  Created by 6 GO Gantz on 7/13/24.
//

import Foundation
import SwiftUI

struct Rating {
    var starCount: Int
    var title: String
    var description: String
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
    init(inputName: String, inputDescription: String, inputTime: String, inputDays: String, inputPlace: String) {
        name = inputName
        description = inputDescription
        time = inputTime
        days = inputDays
        place = inputPlace
        verified = false
        ratings = []
        tags = [technologyTag, paidTag]
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
    var savedPrograms: [Program]
    
    
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
        default:
            return Color.black
        }
    }
    
}

let technologyTag = Tag(inputName: "Technology", inputType: "Tech")
let paidTag = Tag(inputName: "Paid Internship", inputType: "Paid")
let artsTag = Tag(inputName: "Arts", inputType: "Art")
let sportsTag = Tag(inputName: "Sports", inputType: "Sports")

var placeholderTags: [Tag] = [technologyTag, paidTag, artsTag, sportsTag]

var ECCChicago = Program(inputName: "Everyone Can Code Chicago", inputDescription: "The Everyone Can Code Chicago initiative was launched as a public-private partnership that expands opportunities for youth to develop coding skills and explore career pathways.  Through this initiative, employees at local businesses share their professional experience with youth.  And the youth have the opportunity to gain work experience through internships.", inputTime: "2:00 PM - 5:00 PM", inputDays: "Weekdays 06/24/2024-8/02/2024", inputPlace: "Truman College")
var afterSchoolMatters = Program(inputName: "After School Matters", inputDescription: "After School Matters inspires Chicago’s teens to discover their passions, develop skills for life beyond high school, and make friends along the way.", inputTime: "", inputDays: "07/16/2024-07/16/2025", inputPlace: "Chicago, Il")
var cyberSecurityProgram = Program(inputName: "Intro to Cybersecurity", inputDescription: "Program Info", inputTime: "07/25/24",inputDays: "08/25/24", inputPlace: "Chicago, IL")
var webDevProgram = Program(inputName: "Intro to Web Development", inputDescription: "Learn the fundamentals of web development, including HTML, CSS, and JavaScript. Build your first websites and explore the possibilities of a career in web design and development.", inputTime: "07/25/24",inputDays: "08/25/24", inputPlace: "Chicago, IL")

var placeholderPrograms: [Program] = [ECCChicago, afterSchoolMatters, cyberSecurityProgram, webDevProgram]
var placeholderFeaturedPrograms: [Program] = [ECCChicago, afterSchoolMatters]

var currentUser = User(name: "John Doe", username: "johndoe", interests: ["Technology"], email: "johndoe@example.com", password: "example", savedPrograms: [ECCChicago])
