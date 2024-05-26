import Foundation

public enum Items {
    case market([MarketOrder])
    case restaraunts([RestaurantOrder])

    public var count: Int {
        switch self {
        case .market(let items):
            return items.count
        case .restaraunts(let items):
            return items.count
        }
    }
}

enum ServiceError: Error {
    case fileNotFound
    case failedToDecode
}

protocol APIProtocol {
    func fetch<T: DataRequest>(request: T, completion: @escaping (Result<T.Response, ServiceError>) -> Void)
}

protocol DataRequest {
    associatedtype Response
    var endpoint: String { get }

    func decode(_ data: Data) throws -> Response
}

extension DataRequest where Response: Decodable {
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}

struct MarketRequest: DataRequest {
    var endpoint: String { "market" }

    typealias Response = OrdersResponse<MarketOrder>
}

struct RestaurantRequest: DataRequest {
    var endpoint: String { "restaurants" }
    typealias Response = OrdersResponse<RestaurantOrder>
}

final class MockAPI: APIProtocol {
    func fetch<T>(request: T, completion: @escaping (Result<T.Response, ServiceError>) -> Void) where T : DataRequest {
        guard let url = Bundle(for: MockAPI.self).url(
            forResource: request.endpoint + "Response",
            withExtension: "json"
        ) else {
            completion(.failure(.fileNotFound))
            return
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            do {
                let data = try Data(contentsOf: url)
                let orderResponse = try request.decode(data)
                completion(.success(orderResponse))
            } catch {
                debugPrint(error.localizedDescription)
                completion(.failure(.failedToDecode))
            }
        }
    }
}

final public class NetworkService {
    private let api: APIProtocol

    init(api: APIProtocol) {
        self.api = api
    }

    public convenience init() {
        self.init(api: MockAPI())
    }

    public func fetchMarketItems(completion: @escaping (Result<[MarketOrder], Error>) -> Void) {
        api.fetch(request: MarketRequest()) { res in
            switch res {
            case .success(let items):
                DispatchQueue.main.async {
                    completion(.success(items.orders))
                }
            case .failure(let err):
                DispatchQueue.main.async {
                    completion(.failure(err))
                }
            }
        }
    }

    public func fetchRestaurantsItems(completion: @escaping (Result<[RestaurantOrder], Error>) -> Void) {
        api.fetch(request: RestaurantRequest()) { res in
            switch res {
            case .success(let items):
                DispatchQueue.main.async {
                    completion(.success(items.orders))
                }
            case .failure(let err):
                DispatchQueue.main.async {
                    completion(.failure(err))
                }
            }
        }
    }
}
