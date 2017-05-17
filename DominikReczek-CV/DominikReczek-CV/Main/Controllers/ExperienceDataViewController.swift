import UIKit

class ExperienceDataViewController: UIViewController {

    var experienceData: RequestItems

    convenience init() {
        self.init(with: RequestItems())
    }

    init(with requestItems: RequestItems) {

        self.experienceData = requestItems

        super.init(nibName: nil, bundle: nil)
        self.edgesForExtendedLayout = []
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = ExperienceView()
    }

    func castedExperienceView() -> ExperienceView {
        return self.view as! ExperienceView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func updateItems(with items: RequestItems) {
        self.experienceData = items

        prepareData()
        prepareView()
    }

    private func prepareData() {
        loadImages()
        insertTextData()
    }

    private func prepareView() {
        customizeView()
    }

    private func loadImages() {
        castedExperienceView().topBackgroundView.loadImageFromURL("http://188.116.20.253/ftp/files/tb5.jpg", onCompletion: { [weak self] (image) in
            guard let strongSelf = self else { return }
            strongSelf.castedExperienceView().topBackgroundView.image = image
            strongSelf.castedExperienceView().bottomBackgroundView.image = image
        })
        if let data = experienceData.experienceData[0] as? APIExperienceDataModel {
            castedExperienceView().confidoView.iconImageView.loadImageFromURL(data.url, onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedExperienceView().confidoView.iconImageView.image = image
            })
        }
        if let data = experienceData.experienceData[1] as? APIExperienceDataModel {
            castedExperienceView().braintriView.iconImageView.loadImageFromURL(data.url, onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedExperienceView().braintriView.iconImageView.image = image
            })
        }
    }

    private func insertTextData() {
        if let data = experienceData.experienceData[0] as? APIExperienceDataModel {
            castedExperienceView().confidoView.positionAndPeriodLabel.text = data.name + " - " + data.position
            castedExperienceView().confidoView.descriptionLabel.text = data.description
        }

        if let data = experienceData.experienceData[1] as? APIExperienceDataModel {
            castedExperienceView().braintriView.positionAndPeriodLabel.text = data.name + " - " + data.position
            castedExperienceView().braintriView.descriptionLabel.text = data.description
        }
    }

    private func customizeView() {
        castedExperienceView().topBackgroundView.alpha = 0.9
        castedExperienceView().bottomBackgroundView.alpha = 0.8
    }
}
