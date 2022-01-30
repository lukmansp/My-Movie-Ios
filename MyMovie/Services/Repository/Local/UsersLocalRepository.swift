//
//  UsersLocalRepository.swift
//  MyMovie
//
//  Created by lukmanma on 30/01/22.
//

import RealmSwift

import Foundation

class MovieLocalRepository {

   
   public func setLocalMovie(item: RealmMovie) {
        let realmDb = try! Realm()
    
    do {
       try! realmDb.write{
            realmDb.add(item)
        }
    }catch{
    print("ada error nich")
    }
    }
    
    public func getLocalMovie() -> Results<RealmMovie>{
        
        let realmDb = try! Realm()
        let myMovie: Results<RealmMovie>
        
        myMovie = realmDb.objects(RealmMovie.self)
        
        print("disini mymovie \(myMovie.first?.Title)")
        
        return myMovie
    
    }
}
