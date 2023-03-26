//
//  Model.swift
//  YoutubeApp
//
//  Created by Abduraxmon on 26/03/23.
//

import Foundation

class Model {
    
    func getVideos() {
        //Create url object
        let url = URL(string: K.apiUrl)
        
        guard url != nil else {
            return
        }
        //Create urlSession object
        let sesion = URLSession.shared
        
        //Get data task from urlsession obj
        let dataTask = sesion.dataTask(with: url!) { (data, response, error) in
            //Check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            do {
                //Parsing the data to video object
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                dump(response)
            } catch {
                
            }
            
        }
        //Kick off the task
        dataTask.resume()
    }
    
}
