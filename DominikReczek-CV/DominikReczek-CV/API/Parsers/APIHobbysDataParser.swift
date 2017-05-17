import SwiftyJSON

struct APIHobbysDataParser: APIResultParserProtocol {

    func parse(data: JSON) -> [APIResultModelProtocol] {
        var hobbysDataModel = [APIHobbysDataModel]()

        guard let items = data["hobbys"].array else { return hobbysDataModel }

        for item in items {
            let hobbysBJJ = item["hobbys-bjj"].stringValue
            let hobbyBJJImageURL = item["hobbys-bjj-imageURL"].stringValue
            let hobbySkateboarding = item["hobbys-skateboarding"].stringValue
            let hobbySkateboardingImageURL = item["hobbys-skateboarding-imageURL"].stringValue
            let hobbyBasketball = item["hobbys-basketball"].stringValue
            let hobbyBasketballImageURL = item["hobbys-basketball-imageURL"].stringValue

            let model = APIHobbysDataModel(hobbysBJJ: hobbysBJJ, hobbysBJJImageURL: hobbyBJJImageURL, hobbysSkateboarding: hobbySkateboarding, hobbysSkateboardingImageURL: hobbySkateboardingImageURL, hobbysBasketball: hobbyBasketball, hobbysBasketballImageURL: hobbyBasketballImageURL)

            hobbysDataModel.append(model)
        }

        return hobbysDataModel
    }
}
