import Foundation

struct StayDetail: Decodable {
    let id: Int
    let title: String
    let reservable: Bool
    let saved: Bool
    let images: [String]

    let locationInfo: LocationInfo
    let reviewInfo: ReviewInfo
    let hostInfo: HostInfo
    let roomInfo: RoomInfo
    let priceInfo: PriceInfo
}

extension StayDetail {
    struct LocationInfo: Decodable {
        let address: String
        let description: String
        let transit: String
        let latitude: Double
        let longitude: Double
    }

    struct ReviewInfo: Decodable {
        let average: Double
        let numberOfReviews: Int
    }

    struct HostInfo: Decodable {
        let name: String
        let isSuperHost: Bool
        let notes: String
        let about: String
    }

    struct RoomInfo: Decodable {
        let summary: String
        let space: String
        let amenities: String
        let accommodates: Int
        let bathrooms: Int
        let bedrooms: Int
        let beds: Int
    }

    struct PriceInfo: Decodable {
        let price: Float
    }
}
