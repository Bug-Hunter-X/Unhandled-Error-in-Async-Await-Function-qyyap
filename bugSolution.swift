func fetchData() async throws -> Data {
    let url = URL(string: "https://api.example.com/data")!
    let (data, response) = try await URLSession.shared.data(from: url)

    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
        throw URLError(.badServerResponse)
    }

    return data
}

Task { 
    do {
        let data = try await fetchData()
        // Process data
    } catch {
        print("Error fetching data:")
        if let urlError = error as? URLError {
            switch urlError.code {
            case .notConnectedToInternet:
                print("No internet connection")
            case .badServerResponse:
                print("Bad server response")
            case .timedOut:
                print("Request timed out")
            default:
                print("Unknown error: \(urlError)")
            }
        } else {
            print("Other error: \(error)")
        }
    }
} 