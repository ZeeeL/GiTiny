import OHHTTPStubs

@discardableResult
public func stub(
    condition: @escaping OHHTTPStubsTestBlock,
    response: String,
    status: Int32 = 200,
    headers: [String: Any] = ["Content-Type": "application/json"]
    ) -> OHHTTPStubsDescriptor {
    let response: OHHTTPStubsResponseBlock = { _ in
        fixture(
            filePath: OHPathForFileInBundle(response, Bundle(for: EarlGrey.self))!,
            status: status,
            headers: headers
        )
    }
    return OHHTTPStubs.stubRequests(passingTest: condition, withStubResponse: response)
}
