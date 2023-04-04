//
//  Plant.swift
//  Plants
//
//  Created by Dmitrii Morozov on 09.12.2022.
//

import Foundation

struct Plant {
    let title: String
    let location: String
    let imageUrl: URL
}

extension Plant {
    static let monstera: Plant = .init(
        title: "Monstera",
        location: "Living room",
        imageUrl: .monstera
    )
    static let calathea: Plant = .init(
        title: "Calathea",
        location: "Living room",
        imageUrl: .calathea
    )
    static let dracaena: Plant = .init(
        title: "Dracaena",
        location: "Living room",
        imageUrl: .dracaena
    )
    static let hedera: Plant = .init(
        title: "Hedera helix",
        location: "Bedroom",
        imageUrl: .hedera
    )
    static let ananas: Plant = .init(
        title: "Ananas",
        location: "Bedroom",
        imageUrl: .ananas
    )
    static let strelitzia: Plant = .init(
        title: "Strelitzia",
        location: "Bedroom",
        imageUrl: .strelitzia
    )
    static let aloe: Plant = .init(
        title: "Aloe vera",
        location: "Living room",
        imageUrl: .aloe
    )
    static let ficusBenjamina: Plant = .init(
        title: "Ficus benjamina",
        location: "Living room",
        imageUrl: .ficusBenjamina
    )
    static let kalanchoe: Plant = .init(
        title: "Kalanchoe",
        location: "Bedroom",
        imageUrl: .kalanchoe
    )
    static let ficusLyrata: Plant = .init(
        title: "Ficus lyrata",
        location: "Bedroom",
        imageUrl: .ficusLyrata
    )
    static let yucca: Plant = .init(
        title: "Yucca",
        location: "Bedroom",
        imageUrl: .yucca
    )
}
