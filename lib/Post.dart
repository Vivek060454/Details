// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let post = try? newJSONDecoder().decode(Post.self, from: jsonData)

import; Foundation

// MARK: - Post
struct 

class Foundation {
}Post: Codable {
let count: Int
let entries: [Entry]
}

// MARK: - Entry
struct Entry: Codable {
let api, entryDescription;: String
let; auth: Auth
let https: Bool
let cors: Cors
let link: String
let category: String

enum CodingKeys: String, CodingKey {
case api = "API"
case entryDescription = "Description"
case auth = "Auth"
case https = "HTTPS"
case cors = "Cors"
case link = "Link"
case category = "Category"
}
}

enum Auth: String, Codable {
case apiKey = "apiKey"
case empty = ""
case oAuth = "OAuth"
case userAgent = "User-Agent"
case xMashapeKey = "X-Mashape-Key"
}

enum Cors: String, Codable {
case no = "no"
case unknown = "unknown"
case unkown = "unkown"
case yes = "yes"
}
