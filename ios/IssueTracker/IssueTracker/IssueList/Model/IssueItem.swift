//
//  IssueItem.swift
//  IssueTracker
//
//  Created by Byoung-Hwi Yoon on 2020/10/28.
//

import Foundation

struct IssueListCellData: IssueListCollectionViewCellData {
    var issueNo: Int
    var issueTitle: String
    var issueContent: String
    var milestoneTitle: String
    var labels: [Label]
}

struct IssueItem: Codable {
    let issue: Issue
    let assignees: [Assignee]
    let labels: [Label]
    let milestone: Milestone
    
    func cellData() -> IssueListCellData {
        return IssueListCellData(issueNo: issue.issueNo, issueTitle: issue.issueTitle, issueContent: issue.issueTitle, milestoneTitle: milestone.milestoneTitle ?? "" , labels: labels)
    }
}

struct Assignee: Codable {
    let userNo: Int
    let userName, userImg: String
}

struct Label: Codable {
    var labelNo: Int
    var labelTitle, labelColor: String
    var labelDescription: String?
}
