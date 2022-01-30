//
//  UsersRepository.swift
//  MyMovie
//
//  Created by lukmanma on 28/01/22.
//

import Alamofire

class UsersRepositorys {
    
 
     static func requestUsers() -> [Users]{
        
        let URL: String = "https://jsonplaceholder.typicode.com/posts"
        var users:[Users] = []
        
        do{
           AF.request(URL ,method: .get).responseDecodable(of: [Users].self){response in
                  users = response.value!
              }
            return users
        }
}
}
