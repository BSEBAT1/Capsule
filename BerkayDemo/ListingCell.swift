import UIKit
import Foundation

class ListingCell: UITableViewCell {
    
  private let cellImage = UIImageView()
  private let titleLabel = PLabel()
    
    func configure(data:Article) {
        configureUI()
        
        titleLabel.text = data.headline
        cellImage.download(from:data.imageUrl)
    }
    
    private func configureUI() {
        
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cellImage)
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: +8),
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: +8),
            cellImage.widthAnchor.constraint(equalToConstant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: +8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: -8),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: +8)
                ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel?.text = ""
        imageView?.image = nil
    }
}
