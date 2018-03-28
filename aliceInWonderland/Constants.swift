//
//  Constants.swift
//  aliceInWonderland
//
//  Created by Mokhamad Valid Kazimi on 27.03.2018.
//  Copyright © 2018 Mokhamad Valid Kazimi. All rights reserved.
//

import Foundation

// HTTP Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

let BEARER: [String: String] = [
    "Authorization": "Bearer \(AuthService.instance.accessToken)"
]

// URLs
let BASE_URL = "https://apiecho.cf/"
let SIGNUP_URL = "\(BASE_URL)api/signup/"
let LOGIN_URL = "\(BASE_URL)api/login/"
let GET_TEXT_URL = "\(BASE_URL)api/get/text/"

// Storyboard IDs
let FETCH_VC = "FetchVC"

// TableViewCell Identifier
let TABLE_CELL_ID = "tableViewCell"
