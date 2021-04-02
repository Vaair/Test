//
//  SoundDescriptionViewController.swift
//  Test
//
//  Created by Valeriya Tarasenko on 02.04.2021.
//

import RelizKit

class SoundDescriptionViewController: RZUIPacController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {.portrait}
    
    var iPhoneViewType: RZUIPacAnyViewProtocol.Type? {SoundDescriptionIPhone.self}
    var iPadViewType:   RZUIPacAnyViewProtocol.Type? {SoundDescriptionIPad.self}
    //var macViewType:    RZUIPacAnyViewProtocol.Type? {SoundDescriptionMac.self}
    
    var router = SoundDescriptionRouter()
    
    func initActions() {
        router.closeButtonAction = {[weak self] in self?.closeButtonAction()}
        router.isFavoriteButtonAction = {[weak self] in self?.isFavoriteButtonAction()}
        router.trashButtonAction = {[weak self] in self?.trashButtonAction()}
        router.downloadButtonAction = {[weak self] in self?.downloadButtonAction()}
        router.playButtonAction = {[weak self] in self?.playButtonAction()}
    }
    
    func open() {
        router.isHorizontal = isHorizontal
    }
    
    func rotate() {
        router.isHorizontal = isHorizontal
    }
    
    private func closeButtonAction(){
        RZTransition(.Instead, self).back().animation(.ezAnim).transit()
    }
    
    private func isFavoriteButtonAction(){
        router.isFavorite = !router.isFavorite
    }
    
    private func trashButtonAction(){
        router.isDownload = false
    }
    
    private func downloadButtonAction(){
        router.isDownload = true
    }
    
    private func playButtonAction(){
        print("Происходит переход на экран плэера")
    }
    
    
}
