import XCTest
import EarlGrey
import OHHTTPStubs

class EarlGreyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        GREYTestHelper.enableFastAnimation()
        
        stub(condition: isPath("/search/users"), response: "SearchUsers.json")
        stub(condition: isPath("/search/repositories"), response: "SearchRepositories.json")
    }
    
    func testSearchRepositoryWithConvenience() {
        makeSureKeyWindowVisible()
        
        element(id: "search").perform(grey_tap())
        element(id: "search_bar")
            .perform(grey_tap())
            .perform(grey_clearText())
            .perform(grey_replaceText("colibri-ui"))
            .perform(grey_typeText("\n"))
        
        waitUntilElementAppears(text: "alfa-laboratory/colibri-ui-mock")
    }
}
