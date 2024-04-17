import UIKit

var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!
var queryItems = [ "term": "Apple", "country": "IN"]
urlComponents.queryItems = queryItems.map{URLQueryItem(name: $0.key, value: $0.value)}

enum SearchResponseError : Error, LocalizedError {
    case responseError
}

struct SearchResponse: Codable {
    let results: [StoreItem]
    
    enum CodingKeys : String, CodingKey {
        case results
    }
}


struct StoreItem : Codable {
    var name : String
    var artist : String
    var kind : String
    var description : String
//    var artworkURL : URL
    
    enum CodingKeys : String, CodingKey {
        case name = "trackName"
        case artist = "artistName"
        case kind
        case description
//        case artworkURL = "artworkURL160"
    }
    
    enum AdditionalKeys : CodingKey {
        case longDescription
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: CodingKeys.name)
        artist = try values.decode(String.self, forKey: CodingKeys.artist)
        kind = try values.decode(String.self, forKey: CodingKeys.kind)
//        artworkURL = try values.decode(URL.self, forKey: CodingKeys.artworkURL)
        
        if let description = try? values.decode(String.self, forKey: CodingKeys.description) {
            self.description = description
        } else {
            let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
            description = (try? additionalValues.decode(String.self, forKey: AdditionalKeys.longDescription)) ?? ""
        }
    }

}

extension Data {
    func prettyPrintedJSONString() {
        guard
            let jsonObject = try?
               JSONSerialization.jsonObject(with: self,
               options: []),
            let jsonData = try?
               JSONSerialization.data(withJSONObject:
               jsonObject, options: [.prettyPrinted]),
            let prettyJSONString = String(data: jsonData,
               encoding: .utf8) else {
                print("Failed to read JSON Object.")
                return
        }
        print(prettyJSONString)
    }
}

func fetchItems(matching query: [String: String]) async throws -> [StoreItem] {
    
    urlComponents.queryItems = query.map{URLQueryItem(name: $0.key, value: $0.value)}
    
    let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
    let jsonDecoder = JSONDecoder()
    
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {throw SearchResponseError.responseError}
    
    let track = try jsonDecoder.decode(SearchResponse.self, from: data)
    return track.results
}


Task{
    do {
        let fetchedData = try await fetchItems(matching: queryItems)
//        print(fetchedData)
        for data in fetchedData {
            print(data)
        }
    }catch{
        print("Error : \(error)")
    }
}
