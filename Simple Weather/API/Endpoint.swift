//
//  Endpoint.swift
//  Simple Weather
//
//  Created by Griffen Lawrence on 2/22/18.
//  Copyright © 2018 Griffen Lawrence. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseUrl: String {get}
    var path: String {get}
    var queryItems: [URLQueryItem] {get}
}

extension Endpoint {
    var urlComponent: URLComponents {
        var component = URLComponents(string: baseUrl)
        component?.path = path
        component?.queryItems = queryItems
        
        return component!
    }
    
    var request: URLRequest {
        return URLRequest(url: urlComponent.url!)
    }
}

enum WeatherEndpoint: Endpoint {
    case tenDayForecast(city: String, state: String)
    
    var baseUrl: String {
        return "https://api.wunderground.com"
    }
    
    var path: String {
        switch self {
        case .tenDayForecast(let city, let state):
            return "/api/3de0d084e386036b/forecast10day/q/\(state)/S\(city).json"
        }
    }
    
    var queryItems: [URLQueryItem] {
        return []
    }
}
