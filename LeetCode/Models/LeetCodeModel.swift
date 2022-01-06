//
//  LeetCodeModel.swift
//  LeetCodeStats
//
//  Created by Devang Papinwar on 06/11/21.
//

import Foundation

struct LeetCodeModel: Codable
{
    var username: String?
    var streak: Int? 
    var ranking: Int
    var totalMedium: Int
    var totalQuestions: Int
    var acceptanceRate: Double
    var easySolved: Int
    var totalSolved: Int
    var hardSolved: Int
    var submissionCalendar: [String: Int]
    var mediumSolved: Int
    var contributionPoints: Int
    var totalEasy: Int
    var message: String
    var status: String
    var totalHard: Int
    var reputation: Int
}
