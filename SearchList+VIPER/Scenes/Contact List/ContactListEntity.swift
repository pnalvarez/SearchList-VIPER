//
//  ContactListEntity.swift
//  SearchList+VIPER
//
//  Created by Pedro Alvarez on 20/10/22.
//

struct ContactListEntity {
    let name: String
    let number: String
    let image: String
    
    static let stub: [Self] = [.init(name: "Buffalo",
                                     number: "+1 29282836",
                                     image: "buffalo"),
                               .init(name: "Cheetah",
                                     number: "+1 8262893",
                                     image: "cheetah"),
                               .init(name: "Elephant",
                                     number: "+1 186301",
                                     image: "elephant"),
                               .init(name: "Giraffe",
                                     number: "+1 303203",
                                     image: "giraffe"),
                               .init(name: "Gorilla",
                                     number: "+1 28939",
                                     image: "gorilla"),
                               .init(name: "Hippo",
                                     number: "+1 28602",
                                     image: "hippo"),
                               .init(name: "Lion",
                                     number: "+1 39730973",
                                     image: "lion"),
                               .init(name: "Meerkat",
                                     number: "+1 397023",
                                     image: "meerkat"),
                               .init(name: "Ostrich",
                                     number: "+1 83022",
                                     image: "ostrich"),
                               .init(name: "Rhinoceros",
                                     number: "+1 297202",
                                     image: "rhinoceros"),
                               .init(name: "Wild Dog",
                                     number: "+1 970221",
                                     image: "wild-dog"),
                               .init(name: "Zebra",
                                     number: "+1 388963",
                                     image: "zebra")]
}
