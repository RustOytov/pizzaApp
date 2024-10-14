import UIKit

class ActionCell: UICollectionViewCell {
    let imageAction: UIImageView = {
        let image = UIImageView()
//        image.image = .actionOne
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
//    let imageActionTwo: UIImageView = {
//        let image = UIImageView()
//        image.image = .baner
//        image.contentMode = .scaleAspectFill
//        image.layer.cornerRadius = 20
//        image.clipsToBounds = true
//        image.translatesAutoresizingMaskIntoConstraints = false
//        return image
//    }()
    override init(frame: CGRect) {
        super .init(frame: frame)
        setSubviews()
        makeConstraints()
    }
    func setSubviews() {
        contentView.addSubview(imageAction)
//        contentView.addSubview(imageActionTwo)
    }
    func makeConstraints() {
        NSLayoutConstraint.activate([
            imageAction.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageAction.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            imageAction.heightAnchor.constraint(equalToConstant: 152),
            imageAction.widthAnchor.constraint(equalToConstant: 365),
            
//            imageActionTwo.topAnchor.constraint(equalTo: contentView.topAnchor),
//            imageActionTwo.leadingAnchor.constraint(equalTo: imageAction.leadingAnchor, constant: 15),
//            imageActionTwo.heightAnchor.constraint(equalToConstant: 160),
//            imageActionTwo.widthAnchor.constraint(equalToConstant: 350),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
