//
//  SoundDescriptionIPhone.swift
//  Test
//
//  Created by Valeriya Tarasenko on 02.04.2021.
//

import RelizKit

class SoundDescriptionIPhone: RZUIPacView{
    var router: SoundDescriptionRouter!
    
    var contentWidth: RZProtoValue {80 % self*.w}
    var imageWidth: RZProtoValue {100 % self*.w}
    
    var buttonsWidth: RZProtoValue {5 % self*.w}
    var buttonHeight: RZProtoValue {17.5*}
    
    var rlSpace: RZProtoValue {10 % self*.w}
    var topSpace: RZProtoValue {10 % self*.w}
    var downSpace: RZProtoValue {10 % self*.w}
    var space: RZProtoValue {5 % self*.w}
    var spaceBetweenTime: RZProtoValue {3 % self*.w}
    
    var scroll = UIScrollView()
    
    var closeButton = UIButton()
    var isFavoriteButton = UIButton()
    var trashButton = UIButton()
    var playButton = UIButton()
    var downloadButton = UIButton()
    
    var imageView = UIImageView()
    var headphonesImage = UIImageView()
    
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    var timeLabel = UILabel()
    
    func create() {
        createSelf()
        createScroll()
        createCloseButton()
        createImageView()
        createIsFavoriteButton()
        createTitleLabel()
        createDescriptionLabel()
        createHeadphonesImage()
        createTimeLabel()
        createPlayButton()
        createDownloadButton()
        createTrashButton()
    }
    
    private func createSelf(){
        self+>.color(.c9L)
    }
    
    private func createScroll(){
        addSubview(scroll)
        scroll.showsVerticalScrollIndicator = false
        scroll.contentInsetAdjustmentBehavior = .never
        scroll+>
            .width(self*.w).height(self|*.h)
            .x(self|*.scX, .center)
            .contentHeight(downSpace + trashButton|*.mY)
    }
    
    private func createCloseButton(){
        addSubview(closeButton)
        closeButton+>
            .color(.c8)
            .width(buttonsWidth).height(.selfTag(.w)).x(50 % rlSpace).y(topSpace)
            .mask(UIImageView(image: router.closeButtonImage)+>.width(closeButton|*.w).height(closeButton|*.w).view)
            .addAction(router.closeButtonAction)
    }
    
    private func createImageView(){
        scroll.addSubview(imageView)
        imageView+>
            .image(router.image)
            .width(imageWidth).height(.selfTag(.w))
            .contentMode(.scaleAspectFill)
            .x(0*).y(0*)
    }
    
    private func createIsFavoriteButton(){
        scroll.addSubview(isFavoriteButton)
        
        isFavoriteButton+>
            .color(.c3P)
            .width(buttonsWidth).height(.selfTag(.w)).x(contentWidth + rlSpace - .selfTag(.w)).y(self.titleLabel|*.cY - .selfTag(.h) / 2*)
            .template(router.$isFavorite.switcher([
                false: .custom{[weak self] isFavoriteButton in
                    guard let self = self else {return}
                    isFavoriteButton+>.mask(UIImageView(image: self.router.isFavoriteButtonImage)+>.width(self.isFavoriteButton|*.w).height(self.isFavoriteButton|*.w).view)
                },
                true: .custom{[weak self] isFavoriteButton in
                    guard let self = self else {return}
                    isFavoriteButton+>.mask(UIImageView(image: self.router.isFavoriteButtonImageSelected)+>.width(self.isFavoriteButton|*.w).height(self.isFavoriteButton|*.w).view)
                }
            ]))
            
            .addAction(router.isFavoriteButtonAction)
    }
    
    private func createTitleLabel(){
        scroll.addSubview(titleLabel)
        titleLabel+>
            .text(router.soundLabelText).font(.largeTitle).color(.c8, .content)
            .width(contentWidth - isFavoriteButton|*.w) //видимо из-за строчки ниже, если очень длинный title, он не обрезается, не смотря на то, что ширина задана
            .sizeToFit()
            .y(self.imageView|*.mY + self.space).x(self.rlSpace)
    }
    
    private func createDescriptionLabel(){
        scroll.addSubview(descriptionLabel)
        descriptionLabel+>
            .text(router.soundDescriptionText).font(.title2).color(.c8, .content).lines(0)
            .sizeToFit().width(contentWidth).y(self.titleLabel|*.mY + self.space).x(self.rlSpace)
    }
    
    private func createHeadphonesImage(){
        scroll.addSubview(headphonesImage)
        headphonesImage+>
            .color(.c8, .content)
            .image(router.headphonesImage)
            .width(buttonsWidth).height(.selfTag(.w))
            .contentMode(.scaleAspectFill)
            .x(self.rlSpace).y(self.descriptionLabel|*.mY + self.space)
    }
    
    private func createTimeLabel(){
        scroll.addSubview(timeLabel)
        timeLabel+>
            .text(router.timeText).font(.title2).color(.c8, .content)
            .sizeToFit().y(self.headphonesImage|*.cY - .selfTag(.h) / 2*).x(self.headphonesImage|*.mX + self.spaceBetweenTime)
        
    }
    
    private func createPlayButton(){
        scroll.addSubview(playButton)
        playButton+>
            .color(.c3P)
            .width(contentWidth).height(buttonHeight % .selfTag(.w)).cornerRadius(playButton|*.h / 2*)
            .x(rlSpace).y(headphonesImage|*.mY + space)
            .text(router.actionTitle).font(.title2)
            .addAction(router.playButtonAction)
    }
    
    private func createDownloadButton(){
        scroll.addSubview(downloadButton)
        downloadButton+>
            .width(contentWidth).height(buttonHeight % .selfTag(.w)).cornerRadius(downloadButton|*.h / 2*)
            .border(1)
            .color(.c3P, .boder)
            .color(.c8, .content)
            .x(rlSpace).y(playButton|*.mY + spaceBetweenTime)
            .template(router.$isDownload.switcher([
                false: .custom{[weak self] downloadButton in
                    guard let self = self else {return}
                    self.downloadButton+>.text(self.router.downloadTitle).font(.title2)
                        .image(self.router.downloadButtonImage) //не знаю, как задать размер изображения
                        
                },
                true: .custom{[weak self] downloadButton in
                    guard let self = self else {return}
                    self.downloadButton+>.text(self.router.downloadedTitle).font(.title2)
                        .image(self.router.downloadedButtonImage) //не знаю, как задать размер изображения
                }
            ]))
            
            .addAction(router.downloadButtonAction)
    }
    
    private func createTrashButton(){
        scroll.addSubview(trashButton)
        trashButton+>
            .width(buttonsWidth).height(.selfTag(.w))
            .color(.c3P)
            .x(self|*.cX - buttonsWidth / 2*).y(downloadButton|*.mY + space)
            .mask(UIImageView(image: router.trashButtonImage)+>.width( trashButton|*.w).height( trashButton|*.h).view)
            .template(router.$isDownload.switcher([
                false: .custom{[weak self] trashButton in
                    guard let self = self else {return}
                    self.trashButton.isHidden = true
                },
                true: .custom{[weak self] trashButton in
                    guard let self = self else {return}
                    self.trashButton.isHidden = false
                }
            ]))
            .addAction(router.trashButtonAction)
    }
}
