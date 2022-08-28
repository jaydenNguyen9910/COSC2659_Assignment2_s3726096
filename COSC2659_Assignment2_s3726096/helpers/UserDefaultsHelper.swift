//
//  UserDefaultsHelper.swift
//  COSC2659_Assignment2_s3726096
//
//  Created by Tri Nguyen on 28/08/2022.
//

import Foundation

var users: [String:Int] = UserDefaults.standard.object(forKey: "users") as? [String:Int] ?? [:]
