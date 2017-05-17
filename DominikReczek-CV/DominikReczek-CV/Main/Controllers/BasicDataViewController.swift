import UIKit
import AVKit
import AVFoundation

struct BasidDataViewSizes {
    static let avatarBezierPathSides: Int = 6
    static let avatarBezierPathCornerRadius: CGFloat = 30
    static let buttonsBezierPathSides: Int = 8
    static let buttonsBezierPathCornerRadius: CGFloat = 5
    static let borderLineWidth: CGFloat = 2
}

class BasicDataViewController: UIViewController {

    var basicData: RequestItems

    convenience init() {
        self.init(with: RequestItems())
    }

    init(with basicData: RequestItems) {
        self.basicData = basicData

        super.init(nibName: nil, bundle: nil)
        self.edgesForExtendedLayout = []
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = BasicDataView()
    }

    func castedBasicView() -> BasicDataView {
        return self.view as! BasicDataView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func updateItems(with items: RequestItems) {
        self.basicData = items

        prepareData()
        prepareView()
    }

    private func prepareData() {
        loadImages()
        insertTextData()
    }

    private func prepareView() {
        customizeView()
        preparePersonalInfoButton()
        prepareVideoButton()
        prepareContactInfoButton()
    }

    private func loadImages() {
        if let data = basicData.basicData[0] as? APIBasicDataModel {
            castedBasicView().avatarImageView.loadImageFromURL(data.personalAvatarURL, onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedBasicView().avatarImageView.image = image
            })

            castedBasicView().backgroundImageView.loadImageFromURL("https://upload.wikimedia.org/wikipedia/en/7/74/Linkin_Park_2017_logo.png", onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedBasicView().backgroundImageView.image = image
            })

            castedBasicView().personalInfoButton.loadImageFromURL("https://upload.wikimedia.org/wikipedia/en/7/74/Linkin_Park_2017_logo.png", onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedBasicView().personalInfoButton.setImage(image, for: UIControlState.normal)
            })

            castedBasicView().contactInfoButton.loadImageFromURL("https://upload.wikimedia.org/wikipedia/en/7/74/Linkin_Park_2017_logo.png", onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedBasicView().contactInfoButton.setImage(image, for: UIControlState.normal)
            })

            castedBasicView().videoButton.loadImageFromURL("https://cdn3.iconfinder.com/data/icons/youtube-5/100/youtube_2-512.png", onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedBasicView().videoButton.setImage(image, for: UIControlState.normal)
            })
        }
    }

    private func insertTextData() {
        if let data = basicData.basicData[0] as? APIBasicDataModel {
            castedBasicView().descriptionLabel.text = data.personalDescription

            castedBasicView().personalInfoPopUpView.nameView.nameLabel.text = data.personalName
            castedBasicView().personalInfoPopUpView.surnameView.nameLabel.text = data.personalSurname
            castedBasicView().personalInfoPopUpView.countryView.nameLabel.text = data.personalCountry
            castedBasicView().personalInfoPopUpView.cityView.nameLabel.text = data.personalCity
            castedBasicView().personalInfoPopUpView.addressView.nameLabel.text = data.personalStreet + " " + data.personalHouseNumber

            castedBasicView().contactInfoPopUpView.cellphoneView.nameLabel.text = data.contactCell
            castedBasicView().contactInfoPopUpView.emailView.nameLabel.text = data.contactEmail
        }
    }

    private func customizeView() {
        let avatarPath = UIBezierPath(polygonIn: castedBasicView().avatarImageView.bounds, sides: BasidDataViewSizes.avatarBezierPathSides, cornerRadius: BasidDataViewSizes.avatarBezierPathCornerRadius)
        let buttonsPath = UIBezierPath(polygonIn: castedBasicView().personalInfoButton.bounds, sides: BasidDataViewSizes.buttonsBezierPathSides, cornerRadius: BasidDataViewSizes.buttonsBezierPathCornerRadius)

        castedBasicView().avatarImageView.addMask(with: avatarPath)
        castedBasicView().avatarImageView.addBorder(with: avatarPath, width: BasidDataViewSizes.borderLineWidth, color: #colorLiteral(red: 0.5556491613, green: 0.7595404983, blue: 0.008766815066, alpha: 1))
        castedBasicView().personalInfoButton.addMask(with: buttonsPath)
        castedBasicView().personalInfoButton.addBorder(with: buttonsPath, width: BasidDataViewSizes.borderLineWidth, color: #colorLiteral(red: 0.5556491613, green: 0.7595404983, blue: 0.008766815066, alpha: 1))
        castedBasicView().contactInfoButton.addMask(with: buttonsPath)
        castedBasicView().contactInfoButton.addBorder(with: buttonsPath, width: BasidDataViewSizes.borderLineWidth, color: #colorLiteral(red: 0.5556491613, green: 0.7595404983, blue: 0.008766815066, alpha: 1))
        castedBasicView().videoButton.addMask(with: buttonsPath)
        castedBasicView().videoButton.addBorder(with: buttonsPath, width: BasidDataViewSizes.borderLineWidth, color: #colorLiteral(red: 0.5556491613, green: 0.7595404983, blue: 0.008766815066, alpha: 1))
        castedBasicView().backgroundImageView.applyBlur(with: .dark)
    }

    func prepareVideoButton() {
        castedBasicView().videoButton.addTarget(self, action: #selector(playVideo), for: .touchUpInside)
    }


    func playVideo() {
        let videoURL = URL(string: "http://188.116.20.253/ftp/files/final.mp4")
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }

    func preparePersonalInfoButton() {
        castedBasicView().personalInfoButton.addTarget(self, action: #selector(showPersonalInfoView), for: .touchUpInside)
    }

    func showPersonalInfoView() {
        castedBasicView().containerView.applyBlur(with: .dark) { _ in
            self.castedBasicView().containerView.appear(alphaIn: 0.0, alphaOut: 1.0, duration: 0.2, delay: 0, scaleX: 1.4, scaleY: 1.4)
        }

        castedBasicView().personalInfoPopUpView.appear(alphaIn: 0.25, alphaOut: 1.0, duration: 0.2, delay: 0, scaleX: 1.2, scaleY: 1.2)
        castedBasicView().personalInfoPopUpView.closeButton.addTarget(self, action: #selector(closePersonalInfoButtonAction), for: .touchUpInside)
    }

    func closePersonalInfoButtonAction() {
        self.castedBasicView().personalInfoPopUpView.disappear(alphaIn: 1.0, alphaOut: 0.0, duration: 0.25, delay: 0.0, scaleX: 0.35, scaleY: 0.35) { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.castedBasicView().containerView.removeBlur()
        }
    }

    func prepareContactInfoButton() {
        castedBasicView().contactInfoButton.addTarget(self, action: #selector(showContactInfoView), for: .touchUpInside)
    }

    func showContactInfoView() {
        castedBasicView().containerView.applyBlur(with: .dark)
        castedBasicView().contactInfoPopUpView.appear(alphaIn: 0.0, alphaOut: 1.0, duration: 0.2, delay: 0, scaleX: 1.4, scaleY: 1.4)
        castedBasicView().contactInfoPopUpView.closeButton.addTarget(self, action: #selector(closeContactInfoButtonAction), for: .touchUpInside)
    }

    func closeContactInfoButtonAction() {
        self.castedBasicView().contactInfoPopUpView.disappear(alphaIn: 1.0, alphaOut: 0.0, duration: 0.25, delay: 0.0, scaleX: 0.35, scaleY: 0.35) { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.castedBasicView().containerView.removeBlur()
        }
    }
}
