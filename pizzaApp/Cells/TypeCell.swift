import UIKit

class TypeCell: UICollectionViewCell {
    let customButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.pinkButton, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.pinkButton.cgColor
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var buttonAction: (() -> Void)?
    override init(frame: CGRect) {
        super .init(frame: frame)
        setSubviews()
        makeConstraints()
        customButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    func setSubviews() {
        contentView.addSubview(customButton)
    }
    func makeConstraints() {
        NSLayoutConstraint.activate([
            customButton.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            customButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            customButton.widthAnchor.constraint(equalToConstant: 120),
            customButton.heightAnchor.constraint(equalToConstant: 42),
            customButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8)
        ])
    }
    
    @objc func tappedButton() {
        buttonAction?()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
