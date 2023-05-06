import UIKit

public protocol SectionHeaderProtocol: AnyObject {
    func tappedSectionButton(_ button: UIButton)
}

public class SectionHeader: UIStackView {
    
    public weak var delegate: SectionHeaderProtocol?
    
    public var sectionImageLabel: String = ""
    public var sectionImagecontentMode: ContentMode = .scaleAspectFit
    public var sectionImageWidth: CGFloat = 30
    public var sectionImageHeight: CGFloat = 30
    
    public var sectionTitleLabel: String = ""
    public var sectionTitleColor: UIColor = .white
    public var sectionTitleFontSize: CGFloat = 14
    public var sectionTitleFontWeight: UIFont.Weight = .regular
    
    public var sectionButtonText: String = ""
    public var sectionButtonLabel: String = ""
    public var sectionButtonColor: UIColor = .white
    public var sectionButtonImage: String = ""
    public var sectionButtonFontSize: CGFloat = 14
    public var sectionButtonFontWeight: UIFont.Weight = .regular
    
    // MARK: - Properties
   
    public lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var image: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initializes
    
    public convenience init(sectionImageLabel: String?,
                     sectionImagecontentMode: ContentMode?,
                     sectionImageWidth: CGFloat?,
                     sectionImageHeight: CGFloat?,
                     
                     sectionTitleLabel: String?,
                     sectionTitleColor: UIColor?,
                     sectionTitleFontSize: CGFloat?,
                     sectionTitleFontWeight: UIFont.Weight?) {
        self.init()
        
        configureHeaderImageWithLabel(sectionImageLabel: sectionImageLabel,
                                      sectionImagecontentMode: sectionImagecontentMode,
                                      sectionImageWidth: sectionImageWidth,
                                      sectionImageHeight: sectionImageHeight,
                                      
                                      sectionTitleLabel: sectionTitleLabel,
                                      sectionTitleColor: sectionTitleColor,
                                      sectionTitleFontSize: sectionTitleFontSize,
                                      sectionTitleFontWeight: sectionTitleFontWeight
        )
    }
    
    public convenience init(sectionTitleLabel: String?,
                     sectionTitleColor: UIColor?,
                     sectionTitleFontSize: CGFloat?,
                     sectionTitleFontWeight: UIFont.Weight?) {
        self.init()
        
        configureHeaderWithLabel(
            sectionTitleLabel: sectionTitleLabel,
            sectionTitleColor: sectionTitleColor,
            sectionTitleFontSize: sectionTitleFontSize,
            sectionTitleFontWeight: sectionTitleFontWeight
        )
        
        initViewCode()
    }
    
    public convenience init(sectionTitleLabel: String?,
                     sectionTitleColor: UIColor?,
                     sectionTitleFontSize: CGFloat?,
                     sectionTitleFontWeight: UIFont.Weight?,
                     
                     sectionButtonLabel: String?,
                     sectionButtonColor: UIColor?,
                     sectionButtonImage: String?,
                     sectionButtonFontSize: CGFloat?,
                     sectionButtonFontWeight: UIFont.Weight?) {
        self.init()
        
        configureHeaderRightButtonWithImage(
            sectionTitleLabel: sectionTitleLabel,
            sectionTitleColor: sectionTitleColor,
            sectionTitleFontSize: sectionTitleFontSize,
            sectionTitleFontWeight: sectionTitleFontWeight,
            
            sectionButtonLabel: sectionButtonLabel,
            sectionButtonColor: sectionButtonColor,
            sectionButtonImage: sectionButtonImage,
            sectionButtonFontSize: sectionButtonFontSize,
            sectionButtonFontWeight: sectionButtonFontWeight)
        
        initViewCode()
        
    }
    
    public convenience init(sectionTitleLabel: String?,
                            sectionTitleColor: UIColor?,
                            sectionTitleFontSize: CGFloat?,
                            sectionTitleFontWeight: UIFont.Weight?,
                            
                            sectionButtonText: String?,
                            sectionButtonColor: UIColor?,
                            sectionButtonFontSize: CGFloat?,
                            sectionButtonFontWeight: UIFont.Weight?) {
        self.init()
        
        configureHeaderWithLabelButton(
            sectionTitleLabel: sectionTitleLabel,
            sectionTitleColor: sectionTitleColor,
            sectionTitleFontSize: sectionTitleFontSize,
            sectionTitleFontWeight: sectionTitleFontWeight,
            
            sectionButtonText: sectionButtonText,
            sectionButtonColor: sectionButtonColor,
            sectionButtonFontSize: sectionButtonFontSize,
            sectionButtonFontWeight: sectionButtonFontWeight)
        
        initViewCode()
        
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initViewCode()
    }
    
    public required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Methods

public extension SectionHeader {
  
    func configureHeaderImageWithLabel(sectionImageLabel: String?,
                                       sectionImagecontentMode: ContentMode?,
                                       sectionImageWidth: CGFloat?,
                                       sectionImageHeight: CGFloat?,
                                       
                                       sectionTitleLabel: String?,
                                       sectionTitleColor: UIColor?,
                                       sectionTitleFontSize: CGFloat?,
                                       sectionTitleFontWeight: UIFont.Weight?) {
        
        image.image = UIImage(systemName: sectionImageLabel ?? "")
        image.contentMode = sectionImagecontentMode ?? .scaleAspectFit
        image.widthAnchor.constraint(equalToConstant: sectionImageWidth ?? 0).isActive = true
        image.heightAnchor.constraint(equalToConstant: sectionImageHeight ?? 0).isActive = true
        
        label.text = sectionTitleLabel
        label.textColor = sectionTitleColor
        label.font = .systemFont(ofSize: sectionTitleFontSize ?? 0, weight: sectionTitleFontWeight ?? .regular)
        
        configureInformation()
    }
    
    func configureHeaderWithLabel(sectionTitleLabel: String?,
                                  sectionTitleColor: UIColor?,
                                  sectionTitleFontSize: CGFloat?,
                                  sectionTitleFontWeight: UIFont.Weight?) {
        label.text = sectionTitleLabel
        label.textColor = sectionTitleColor
        label.font = .systemFont(ofSize: sectionTitleFontSize ?? 0, weight: sectionTitleFontWeight ?? .regular)
        
    }
   
    func configureHeaderRightButtonWithImage(sectionTitleLabel: String?,
                                             sectionTitleColor: UIColor?,
                                             sectionTitleFontSize: CGFloat?,
                                             sectionTitleFontWeight: UIFont.Weight?,
                                             
                                             sectionButtonLabel: String?,
                                             sectionButtonColor: UIColor?,
                                             sectionButtonImage: String?,
                                             sectionButtonFontSize: CGFloat?,
                                             sectionButtonFontWeight: UIFont.Weight?) {
        label.text = sectionTitleLabel
        label.textColor = sectionTitleColor
        label.font = .systemFont(ofSize: sectionTitleFontSize ?? 0, weight: sectionTitleFontWeight ?? .regular)
        
        button.titleLabel?.font = .systemFont(ofSize: sectionButtonFontSize ?? 0, weight: sectionButtonFontWeight ?? .regular)
        button.setTitleColor(sectionButtonColor, for: .normal)
        
        let attributedTitle = NSMutableAttributedString(string: sectionButtonLabel ?? "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: sectionButtonImage ?? "")?.withRenderingMode(.alwaysTemplate)
        let imageString = NSAttributedString(attachment: imageAttachment)
        attributedTitle.append(imageString)
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    func configureHeaderWithLabelButton(sectionTitleLabel: String?,
                                        sectionTitleColor: UIColor?,
                                        sectionTitleFontSize: CGFloat?,
                                        sectionTitleFontWeight: UIFont.Weight?,
                                        
                                        sectionButtonText: String?,
                                        sectionButtonColor: UIColor?,
                                        sectionButtonFontSize: CGFloat?,
                                        sectionButtonFontWeight: UIFont.Weight?) {
        
        label.text = sectionTitleLabel
        label.textColor = sectionTitleColor
        label.font = .systemFont(ofSize: sectionTitleFontSize ?? 0, weight: sectionTitleFontWeight ?? .regular)
        
        button.setTitle(sectionButtonText, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: sectionButtonFontSize ?? 0, weight: sectionButtonFontWeight ?? .regular)
        button.setTitleColor(sectionButtonColor, for: .normal)
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    @objc func tappedButton(_ button: UIButton) {
        delegate?.tappedSectionButton(button)
    }
    
}

// MARK: - Configure constraints

public extension SectionHeader {
    // MARK: - Ajustar depois
    func configureInformation() {
        addArrangedSubview(image)
        addArrangedSubview(label)
        
        axis = .horizontal
        alignment = .fill
        spacing = 4
        distribution = .fill
    }
    
    func initViewCode() {
        configureSubviews()
        configureConstraints()
        configureAdditionalBehaviors()
    }
    
    func configureSubviews() {
        addArrangedSubview(label)
        addArrangedSubview(button)
    }
    
    func configureConstraints() { }
    
    func configureAdditionalBehaviors() {
        axis = .horizontal
        alignment = .center
        distribution = .equalSpacing
    }
    
}
