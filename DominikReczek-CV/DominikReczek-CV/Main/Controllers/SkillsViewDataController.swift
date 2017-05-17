import UIKit

class SkillsDataViewController: UIViewController {

    var skillsData: RequestItems

    convenience init() {
        self.init(with: RequestItems())
    }

    init(with requestItems: RequestItems) {

        self.skillsData = requestItems

        super.init(nibName: nil, bundle: nil)
        self.edgesForExtendedLayout = []
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = SkillsView()
    }

    func castedSkillsView() -> SkillsView {
        return self.view as! SkillsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func updateItems(with items: RequestItems) {
        self.skillsData = items

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
        if let data = skillsData.skillsData[0] as? APISkillsDataModel {
            castedSkillsView().swiftView.backgroundImageView.loadImageFromURL("http://188.116.20.253/ftp/files/tb5.jpg", onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedSkillsView().swiftView.backgroundImageView.image = image
                strongSelf.castedSkillsView().macOSView.backgroundImageView.image = image
                strongSelf.castedSkillsView().gitView.backgroundImageView.image = image
                strongSelf.castedSkillsView().xcodeView.backgroundImageView.image = image
                strongSelf.castedSkillsView().photoshopView.backgroundImageView.image = image
                strongSelf.castedSkillsView().englishView.backgroundImageView.image = image
            })

            castedSkillsView().swiftView.loadImageFromURL(data.techMainLanguageUrl, onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedSkillsView().swiftView.iconImageView.image = image
            })

            castedSkillsView().macOSView.loadImageFromURL(data.techOperationSystemUrl, onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedSkillsView().macOSView.iconImageView.image = image
            })

            castedSkillsView().gitView.loadImageFromURL(data.gitUrl, onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedSkillsView().gitView.iconImageView.image = image
            })

            castedSkillsView().xcodeView.loadImageFromURL(data.techIDEUrl, onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedSkillsView().xcodeView.iconImageView.image = image
            })

            castedSkillsView().photoshopView.loadImageFromURL(data.photoshopUrl, onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedSkillsView().photoshopView.iconImageView.image = image
            })

            castedSkillsView().englishView.loadImageFromURL(data.englishUrl, onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedSkillsView().englishView.iconImageView.image = image
            })
        }
    }

    private func insertTextData() {
        if let data = skillsData.skillsData[0] as? APISkillsDataModel {
            castedSkillsView().swiftView.descriptionLabel.text = data.techMainLanguage
            castedSkillsView().macOSView.descriptionLabel.text = data.techOperationSystem
            castedSkillsView().gitView.descriptionLabel.text = data.techControlVersion
            castedSkillsView().xcodeView.descriptionLabel.text = data.techIDE
            castedSkillsView().photoshopView.descriptionLabel.text = data.techGraphicEditor
            castedSkillsView().englishView.descriptionLabel.text = data.foreignLanguageName
        }
    }

    private func customizeView() {
        castedSkillsView().swiftView.backgroundImageView.alpha = 0.35
        castedSkillsView().macOSView.backgroundImageView.alpha = 0.30
        castedSkillsView().gitView.backgroundImageView.alpha = 0.25
        castedSkillsView().xcodeView.backgroundImageView.alpha = 0.20
        castedSkillsView().photoshopView.backgroundImageView.alpha = 0.15
        castedSkillsView().englishView.backgroundImageView.alpha = 0.10
    }
}
