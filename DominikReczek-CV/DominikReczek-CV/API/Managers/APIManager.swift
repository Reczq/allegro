import UIKit
import Alamofire
import SwiftyJSON

class APIManager {

    let baseURL: String

    init() {
        baseURL = "http://188.116.20.253:1337/api"
    }

    func createBasicDataManager() -> APIManagerProtocol {
        let parser = APIBasicDataParser()
        return APIBasicDataManager(with: baseURL, parser: parser)
    }

    func createExperienceDataManager() -> APIManagerProtocol {
        let parser = APIExperienceDataParser()
        return APIExperienceDataManager(with: baseURL, parser: parser)
    }

    func createEducationDataManager() -> APIManagerProtocol {
        let parser = APIEducationDataParser()
        return APIEducationDataManager(with: baseURL, parser: parser)
    }

    func createSkillsDataManager() -> APIManagerProtocol {
        let parser = APISkillsDataParser()
        return APISkillsDataManager(with: baseURL, parser: parser)
    }

    func createHobbysDataManager() -> APIManagerProtocol {
        let parser = APIHobbysDataParser()
        return APIHobbysDataManager(with: baseURL, parser: parser)
    }
}
