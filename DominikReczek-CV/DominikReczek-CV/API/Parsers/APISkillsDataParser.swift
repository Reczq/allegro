import SwiftyJSON

struct APISkillsDataParser: APIResultParserProtocol {

    func parse(data: JSON) -> [APIResultModelProtocol] {
        var skillsDataModel = [APISkillsDataModel]()

        guard let items = data["skills"].array else { return skillsDataModel }

        for item in items {
            let skillsTechMainLanguage = item["tech-main-language"].stringValue
            let skillsTechOperationSystem = item["tech-operation-system"].stringValue
            let skillsTechIDE = item["tech-ide"].stringValue
            let skillsTechControlVersion = item["tech-control-version"].stringValue
            let skillsTechGraphicEditor = item["tech-graphic-editor"].stringValue
            let skillsForeignLanguageName = item["foreign-language-name"].stringValue

            let skillsTechMainLanguageURL = item["tech-main-language-url"].stringValue
            let skillsTechOperationSystemURL = item["tech-operation-system-url"].stringValue
            let skillsTechIDEURL = item["tech-ide-url"].stringValue
            let skillsTechControlVersionURL = item["git-url"].stringValue
            let skillsTechGraphicEditorURL = item["photoshop-url"].stringValue
            let skillsForeignLanguageURL = item["english-url"].stringValue

            let model = APISkillsDataModel(techMainLanguage: skillsTechMainLanguage,
                                           techOperationSystem: skillsTechOperationSystem,
                                           techIDE: skillsTechIDE,
                                           techControlVersion: skillsTechControlVersion,
                                           techGraphicEditor: skillsTechGraphicEditor,
                                           foreignLanguageName: skillsForeignLanguageName,
                                           techMainLanguageUrl: skillsTechMainLanguageURL,
                                           techOperationSystemUrl: skillsTechOperationSystemURL,
                                           techIDEUrl: skillsTechIDEURL,
                                           gitUrl:skillsTechControlVersionURL,
                                           photoshopUrl: skillsTechGraphicEditorURL,
                                           englishUrl: skillsForeignLanguageURL)


            skillsDataModel.append(model)
        }

        return skillsDataModel
    }
}
