import SwiftyJSON

struct APIExperienceDataParser: APIResultParserProtocol {

    func parse(data: JSON) -> [APIResultModelProtocol] {
        var experienceDataModel = [APIExperienceDataModel]()

        guard let items = data["experience"].array else { return experienceDataModel }

        for item in items {
            let experienceName = item["name"].stringValue
            let experiencePosition = item["position"].stringValue
            let experienceDescription = item["description"].stringValue
            let url = item["url"].stringValue

            let model = APIExperienceDataModel(name: experienceName, position: experiencePosition, description: experienceDescription, url: url)

            experienceDataModel.append(model)
        }

        return experienceDataModel
    }
}
