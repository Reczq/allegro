import SwiftyJSON

struct APIBasicDataParser: APIResultParserProtocol {

    func parse(data: JSON) -> [APIResultModelProtocol] {
        var basicDataModel = [APIBasicDataModel]()

        guard let items = data["basic"].array else { return basicDataModel }

        for item in items {
            let basicDataName = item["personal-name"].stringValue
            let basicDataSurname = item["personal-surname"].stringValue
            let basicDataCountry = item["personal-country"].stringValue
            let basicDataCity = item["personal-city"].stringValue
            let basicDataStreet = item["personal-street"].stringValue
            let basicDataHouseNumber = item["personal-house-number"].stringValue
            let basicDataAvatarURL = item["personal-avatar-url"].stringValue
            let basicDataDescription = item["personal-description"].stringValue
            let contactDataEmail = item["contact-email"].stringValue
            let contactDataCell = item["contact-cell"].stringValue
            let linkDataGithubURL = item["link-github-url"].stringValue
            let linkDataLinkedinURL = item["link-linkedin-url"].stringValue

            let model = APIBasicDataModel(personalName: basicDataName,
                                  personalSurname: basicDataSurname,
                                  personalCountry: basicDataCountry,
                                  personalCity: basicDataCity,
                                  personalStreet: basicDataStreet,
                                  personalHouseNumber: basicDataHouseNumber,
                                  personalAvatarURL: basicDataAvatarURL,
                                  personalDescription: basicDataDescription,
                                  contactEmail: contactDataEmail,
                                  contactCell: contactDataCell,
                                  linkGithubURL: linkDataGithubURL,
                                  linkLinkedinURL: linkDataLinkedinURL)

            basicDataModel.append(model)
        }

        return basicDataModel
    }
}
