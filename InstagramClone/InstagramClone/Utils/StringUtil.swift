//
//  StringUtil.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 20/10/24.
//

func extractUsername(from email: String) -> String? {
    let component = email.components(separatedBy: "@")
    guard component.count > 1 else{
        return nil
    }
    return component.first
}

