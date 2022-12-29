//
//  Tutor.swift
//  Tutors
//
//  Created by Sai Kambampati on 6/5/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import SwiftUI

struct Mentor: Identifiable {
    var id = UUID()
    var name: String
    var headline: String
    var bio: String
    var live: String
    
    var imageName: String { return name }
}

#if DEBUG
let mentorData = [
    Mentor(name: "Dr.Nora", headline: "Clinical Psychologist", bio: "I’m a Licensed Professional Counselor and virtual counselor in Denver, but you can also call me a Life-Untangler, a Performance Coach, and a Thought Mediator.",live: "Be Kind"),
    Mentor(name: "Dr.Ali", headline: "Psychologist", bio: "I’m a Licensed Mental Health Counselor. I’ve been a therapist for 10 years and absolutely love what I do. I’ve worked with teenagers overcome problems, young adults go off to college and become successful, and young adults overcome depression and anxiety.",live: "Let it go"),
    Mentor(name: "Dr.Sara", headline: "Social Specialist", bio: "I’m a Licensed Professional Counselor and virtual counselor in Denver, but you can also call me a Life-Untangler, a Performance Coach, and a Thought Mediator.",live: "Self-Worth"),
    Mentor(name: "Dr.Ahmad", headline: "Social Specialist", bio: "I’m a Licensed Mental Health Counselor. I’ve been a therapist for 10 years and absolutely love what I do. I’ve worked with teenagers overcome problems, young adults go off to college and become successful, and young adults overcome depression and anxiety.",live: "Belonging"),
    Mentor(name: "Dr.Fay", headline: "Psychologist", bio: "I’m a Licensed Professional Counselor and virtual counselor in Denver, but you can also call me a Life-Untangler, a Performance Coach, and a Thought Mediator.",live: "Anxity"),
    Mentor(name: "Dr.Khaled", headline: "Psychologist", bio: "I’m a Licensed Mental Health Counselor. I’ve been a therapist for 10 years and absolutely love what I do. I’ve worked with teenagers overcome problems, young adults go off to college and become successful, and young adults overcome depression and anxiety.",live: "Be Kind"),
    Mentor(name: "Dr.Nawal", headline: "Psychologist", bio: "I’m a Licensed Professional Counselor and virtual counselor in Denver, but you can also call me a Life-Untangler, a Performance Coach, and a Thought Mediator.",live: "Healing"),
    Mentor(name: "Dr.Sumia", headline: "Clinical Psychologist", bio: "I’m a Licensed Mental Health Counselor. I’ve been a therapist for 10 years and absolutely love what I do. I’ve worked with teenagers overcome problems, young adults go off to college and become successful, and young adults overcome depression and anxiety.",live: "Be positive"),
    Mentor(name: "Dr.Lama", headline: "Social Specialist", bio: "I’m a Licensed Professional Counselor and virtual counselor in Denver, but you can also call me a Life-Untangler, a Performance Coach, and a Thought Mediator.",live: "Be positive"),
    Mentor(name: "Dr.Sarah", headline: "Social Specialist", bio: "I’m a Licensed Mental Health Counselor. I’ve been a therapist for 10 years and absolutely love what I do. I’ve worked with teenagers overcome problems, young adults go off to college and become successful, and young adults overcome depression and anxiety.",live: "Be positive"),
    Mentor(name: "Dr.Fouz", headline: "Social Specialist", bio: "I’m a Licensed Professional Counselor and virtual counselor in Denver, but you can also call me a Life-Untangler, a Performance Coach, and a Thought Mediator.",live: "Be positive"),
    Mentor(name: "Dr.Fawaz", headline: "Psychologist", bio: "I’m a Licensed Mental Health Counselor. I’ve been a therapist for 10 years and absolutely love what I do. I’ve worked with teenagers overcome problems, young adults go off to college and become successful, and young adults overcome depression and anxiety.",live: "Be positive"),
]
#endif
