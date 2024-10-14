import UIKit

class TypeCell: UICollectionViewCell {
    let buttonType: UIButton = {
        let button = UIButton()
        button.backgroundColor = .pinkButton
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override init(frame: CGRect) {
        super .init(frame: frame)
        setSubviews()
        makeConstraints()
    }
    func setSubviews() {
        contentView.addSubview(buttonType)
    }
    func makeConstraints() {
        NSLayoutConstraint.activate([
            buttonType.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonType.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonType.heightAnchor.constraint(equalToConstant: 42),
            buttonType.widthAnchor.constraint(equalToConstant: 108)
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
