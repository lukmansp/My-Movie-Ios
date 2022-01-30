//
//  Model.swift
//  MyMovie
//
//  Created by lukmanma on 28/01/22.
//

import Foundation
import RealmSwift


struct MovieResult:Codable {
    let Search: [Movie]
}

struct Movie:Codable {
    let Title : String
    let Year: String
    let imdbID: String
    let Poster: String
}

struct Users: Decodable {
    let Title: String
    let Poster: String
}

class setUsers {
    public var users = [Users]()
    
    public func configure(){
        users.append(Users(Title: "Fast And Furios", Poster: "https://m.media-amazon.com/images/M/MV5BNzlkNzVjMDMtOTdhZC00MGE1LTkxODctMzFmMjkwZmMxZjFhXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg"))
            users.append(Users(Title: "Japanese way", Poster: "https://m.media-amazon.com/images/M/MV5BMTQ2NTMxODEyNV5BMl5BanBnXkFtZTcwMDgxMjA0MQ@@._V1_SX300.jpg"))
            users.append(Users(Title: "Fast and loos", Poster: "https://m.media-amazon.com/images/M/MV5BNmRjN2NmYTktZWY2MS00YmMyLWJlZWMtYjAyZTA0OGY2ZTAzXkEyXkFqcGdeQXVyMTIxOTk5MzY@._V1_SX300.jpg"))
            
            users.append(Users(Title: "Hard, Fast and Beautiful!", Poster: "https://m.media-amazon.com/images/M/MV5BYzRmM2FlNjEtMTgzYi00ZjhiLTlmZTctYTU2OGNlNGE4YWU2XkEyXkFqcGdeQXVyMzg1ODEwNQ@@._V1_SX300.jpg"))
    }
}

class RealmMovie: Object {
    @objc dynamic var Title: String = ""
    @objc dynamic var Poster: String = ""
}

