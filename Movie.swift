//
//  Movie.swift
//  movie list.x
//
//  Created by ahmed aelsebaay on 24/04/2021.
//

import UIKit

struct Movie :Codable
{
    
    var Title : String?
    
    var Year   : String?
    var `Type` : String?
    var Poster :String?
    var imdbID:String?
    
}
struct Searchresults:Codable {
    var Search:[Movie]
    var Response : String?
    

}
