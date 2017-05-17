import SwiftyJSON

struct APIEducationDataParser: APIResultParserProtocol {

    func parse(data: JSON) -> [APIResultModelProtocol] {
        var educationDataModel = [APIEducationDataModel]()

        guard let items = data["education"].array else { return educationDataModel }

        for item in items {
            let educationName = item["name"].stringValue
            let educationSubject = item["subject"].stringValue
            let educationYears = item["years"].stringValue
            let educationURL = item["url"].stringValue

            let model = APIEducationDataModel(name: educationName, subject: educationSubject, years: educationYears, url: educationURL)

            educationDataModel.append(model)
        }
        
        return educationDataModel
    }
}
