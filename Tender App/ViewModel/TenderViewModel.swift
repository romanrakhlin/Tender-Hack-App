//
//  TenderViewModel.swift
//  Tender App
//
//  Created by Roman Rakhlin on 4/16/22.
//

import Foundation

class TenderViewModel: ObservableObject {
    
    let baseURL: String = "http://10.10.117.212:8000/api"
    
    @Published var sessions = Sessions()
    
    // fetch all sessions
    func fetchSessions(completionHandler: @escaping (Sessions?) -> Void) -> Void {
        guard let url = URL(string: baseURL + "/get_sessions") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completionHandler(nil)
                return
            }
            
            do {
                let sessions = try JSONDecoder().decode(Sessions.self, from: data)
                completionHandler(sessions)
            } catch {
                print(error)
                completionHandler(nil)
            }
        }
        
        task.resume()
    }
    
    // fetch all offers
    func fetchOffers(currentId: Int, completionHandler: @escaping (Offer?) -> Void) -> Void {
        guard let url = URL(string: baseURL + "/get_offers/\(currentId)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Error 1 kind")
                completionHandler(nil)
                return
            }
            
            do {
                let offers = try JSONDecoder().decode(Offer.self, from: data)
                completionHandler(offers)
            } catch {
                print("Error 2 kind")
                print(error)
                completionHandler(nil)
            }
        }
        
        task.resume()
    }
    
    // creates an offer (less price)
    func createOffer(for username: String, andId sessionId: Int) {
        let Url = String(format: baseURL + "/create_offer")
        
        guard let serviceUrl = URL(string: Url) else { return }
        
        let parameters: [String: Any] = [
            "username" : username,
            "session_id": sessionId
        ]
        
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return
        }
        
        request.httpBody = httpBody
        request.timeoutInterval = 20
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    // starts the angry bot
    func startBot(for username: String, andId sessionId: Int) {
        let Url = String(format: "http://10.10.117.212:8080/bot/start_angry/\(username)/\(sessionId)")
        
        guard let serviceUrl = URL(string: Url) else { return }
    
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 20
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    // stops the angry bot
    func stopBot(for username: String, andId sessionId: Int) {
        let Url = String(format: "http://10.10.117.212:8080/bot/stop_angry/\(username)/\(sessionId)")
        
        guard let serviceUrl = URL(string: Url) else { return }
    
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 20
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
