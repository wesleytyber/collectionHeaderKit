//
//  ButtonHStackView.swift
//  
//
//  Created by Wesley Calazans on 05/05/23.
//

import UIKit

public protocol ButtonHStackViewProtocol: AnyObject {
    func tappedSectionButton(_ button: UIButton)
}

public class ButtonHStackView: UIStackView {
    
    public weak var delegate: ButtonHStackViewProtocol?
    
    public lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Exibir mais", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()
    
    public lazy var image: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "chevron.down")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initViewCode()
    }
    
    public required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func initViewCode() {
        addArrangedSubview(button)
        addArrangedSubview(image)
        
        axis = .horizontal
        alignment = .fill
        distribution = .fill
        spacing = 2
    }
    
    @objc func tappedButton(_ button: UIButton) {
        delegate?.tappedSectionButton(button)
    }
}
