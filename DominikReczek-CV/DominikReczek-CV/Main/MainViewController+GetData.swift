extension MainViewController {
    func getData(_ completion: @escaping (RequestItems) -> ()) {
        getBasicData() { [weak self] (basicModel) in
            guard let strongSelf = self else { return }
            strongSelf.getExperienceData() { [weak self] (experienceModel) in
                guard let strongSelf = self else { return }
                strongSelf.getEducationData() { [weak self] (educationModel) in
                    guard let strongSelf = self else { return }
                    strongSelf.getSkillsData() { [weak self] (skillsModel) in
                        guard let strongSelf = self else { return }
                        strongSelf.getHobbysData() { (hobbysModel) in

                            let items = RequestItems(basicData: basicModel,
                                                     experienceData: experienceModel,
                                                     educationData: educationModel,
                                                     skillsData: skillsModel,
                                                     hobbysData: hobbysModel)

                            completion(items)
                        }
                    }
                }
            }
        }
    }

    func getBasicData(completion: @escaping ([APIResultModelProtocol]) -> ()) {
        basicDataManager.request { (model) in
            completion(model)
        }
    }

    func getExperienceData(completion: @escaping ([APIResultModelProtocol]) -> ()) {
        experienceDataManager.request { (model) in
            completion(model)
        }
    }

    func getEducationData(completion: @escaping ([APIResultModelProtocol]) -> ()) {
        educationDataManager.request { (model) in
            completion(model)
        }
    }

    func getSkillsData(completion: @escaping ([APIResultModelProtocol]) -> ()) {
        skillsDataManager.request { (model) in
            completion(model)
        }
    }

    func getHobbysData(completion: @escaping ([APIResultModelProtocol]) -> ()) {
        hobbysDataManager.request { (model) in
            completion(model)
        }
    }
}
