//
//  BadResultsData.swift
//  SearchResultControllerTest
//
//  Created by Dongwoo Pae on 9/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

let badResultData = """

{
  "resultCount": 2,
  "results": [
    {

      "trackName": "GarageBand",
      "artistName": "Apple",
    },
    {
      "trackName": "Shortcut: GarageBand Edition",
      "artistName": "Mark Keroles",
    }
  ]


""".data(using: .utf8)!

let noResultsData =  """
{
"resultCount": 0,
"results": []
}
""".data(using: .utf8)!
