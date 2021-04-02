//
//  SoundDescriptionRouter.swift
//  Test
//
//  Created by Valeriya Tarasenko on 02.04.2021.
//

import RelizKit

class SoundDescriptionRouter: RZUIPacRouter{
    @RZObservable var isHorizontal = false
    @RZObservable var isFavorite = false
    @RZObservable var isDownload = false
    
    var imageName = "lotus"
    var image: UIImage? { UIImage(named: imageName) }
    var closeButtonImage = UIImage(systemName: "xmark")
    var downloadButtonImage = UIImage(systemName: "arrow.down.circle")
    var downloadedButtonImage = UIImage(systemName: "arrow.up.circle")
    var headphonesImage = UIImage(systemName: "headphones")
    var isFavoriteButtonImage = UIImage(systemName: "heart")
    var isFavoriteButtonImageSelected = UIImage(systemName: "heart.fill")
    var trashButtonImage = UIImage(systemName: "trash")
    
    var soundLabelText: String = "Пляж"
    var soundDescriptionText: String = "...Какое-то описание подкаста...\n...\n...\n...\n...\n...\n...\n...\n...\n..."
    var timeText: String = "5 минут"
    var actionTitle: String = "Воспроизвести"
    var downloadTitle: String = " Загрузить"
    var downloadedTitle: String = " Загружено"
    
    //MARK: - API
    //MARK: - ActionsC
    var closeButtonAction = {}
    var isFavoriteButtonAction = {}
    var trashButtonAction = {}
    var downloadButtonAction = {}
    var playButtonAction = {}
}
