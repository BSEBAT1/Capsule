

import Foundation

// MARK: - Articles
struct News: Codable {
    let status: String?
    let response: Response?
}

// MARK: - Response
struct Response: Codable {
    let docs: [Doc]?
    let meta: Meta?
}

// MARK: - Doc
struct Doc: Codable {
    let abstract: String?
    let webURL: String?
    let snippet, leadParagraph: String?
    let multimedia: [Multimedia]?
    let headline: Headline?
    let pubDate: Date?
    let documentType: DocumentType?
    let byline: Byline?
    let id: String?
    let wordCount: Int?
    let uri: String?

    enum CodingKeys: String, CodingKey {
        case abstract
        case webURL = "web_url"
        case snippet
        case leadParagraph = "lead_paragraph"
        case multimedia, headline
        case pubDate
        case documentType
        case byline
        case id
        case wordCount
        case uri
    }
}

// MARK: - Byline
struct Byline: Codable {
    let original: String?
    let organization: String?
}

enum Role: String, Codable {
    case reported = "reported"
}

enum DocumentType: String, Codable {
    case article = "article"
}

// MARK: - Headline
struct Headline: Codable {
    let main: String?
    let kicker: String?
    let contentKicker: JSONNull?
    let printHeadline: String?
    let name, seo, sub: JSONNull?

    enum CodingKeys: String, CodingKey {
        case main, kicker
        case contentKicker
        case printHeadline
        case name, seo, sub
    }
}

// MARK: - Keyword
struct Keyword: Codable {
    let name: Name?
    let value: String?
    let major: Major?
}

enum Major: String, Codable {
    case n = "N"
}

enum Name: String, Codable {
    case creativeWorks = "creative_works"
    case glocations = "glocations"
    case organizations = "organizations"
    case persons = "persons"
    case subject = "subject"
}

// MARK: - Multimedia
struct Multimedia: Codable {
    let subtype: String?
    let type: TypeEnum?
    let url: String?
    let height, width: Int?
    let subType, cropName: String?

    enum CodingKeys: String, CodingKey {
        case subtype, type, url, height, width, subType
        case cropName
    }
}

// MARK: - Legacy
struct Legacy: Codable {
    let xlarge: String?
    let xlargewidth, xlargeheight: Int?
    let thumbnail: String?
    let thumbnailwidth, thumbnailheight, widewidth, wideheight: Int?
    let wide: String?
}

enum TypeEnum: String, Codable {
    case image = "image"
}

// MARK: - Meta
struct Meta: Codable {
    let hits, offset, time: Int?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public func hash(into hasher: inout Hasher) {
            // No-op
        }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
