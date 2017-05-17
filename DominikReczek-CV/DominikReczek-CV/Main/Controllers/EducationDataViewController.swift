import UIKit

class EducationDataViewController: UIViewController {

    var educationData: RequestItems

    convenience init() {
        self.init(with: RequestItems())
    }

    init(with requestItems: RequestItems) {

        self.educationData = requestItems

        super.init(nibName: nil, bundle: nil)
        self.edgesForExtendedLayout = []
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = EducationView()
    }

    func castedEducationView() -> EducationView {
        return self.view as! EducationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func updateItems(with items: RequestItems) {
        self.educationData = items

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
        if let data = educationData.educationData[0] as? APIEducationDataModel {
            castedEducationView().ukswView.loadImageFromURL(data.url, onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedEducationView().ukswView.image = image
            })
        }
        if let data = educationData.educationData[1] as? APIEducationDataModel {
            castedEducationView().zseilView.loadImageFromURL(data.url, onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedEducationView().zseilView.image = image
            })
        }
    }

    private func insertTextData() {
        if let data = educationData.educationData[0] as? APIEducationDataModel {
            castedEducationView().ukswPositionAndPeriodLabel.text =  data.subject + " - " + data.years
        }

        if let data = educationData.educationData[1] as? APIEducationDataModel {
            castedEducationView().zseilPositionAndPeriodLabel.text = data.subject + " - " + data.years
        }
    }

    private func customizeView() {
        castedEducationView().ukswView.alpha = 0.4
        castedEducationView().zseilView.alpha = 0.5
    }
}
