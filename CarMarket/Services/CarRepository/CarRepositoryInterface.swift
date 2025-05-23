//
//  CarServiceInterface.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//

protocol CarsFetchable: AnyObject {
    func fetchCars() async throws -> [CarRepositoryModel]
}

protocol CarDetailsProviding: AnyObject {
    func carDetails(by id: Int) async -> CarRepositoryModel?
}

/*
[
    {
        "id": 1,
        "make": "BMW",
        "model": "316i",
        "price": 13000,
        "firstRegistration": "01-2000",
        "mileage": 25000,
        "fuel": "Gasoline",
        "images": [
            {
                "url": "https://loremflickr.com/g/320/240/bmw"
            },
            {
                "url": "https://loremflickr.com/g/640/480/bmw"
            },
            {
                "url": "https://loremflickr.com/g/1600/1200/bmw"
            }
        ],
        "description": "Almost like new. Full service history"
    },
    {
        "id": 2,
        "make": "Audi",
        "model": "A8",
        "fuel": "Gasoline",
        "modelline": "quattro",
        "price": 16000,
        "firstRegistration": "02-2008",
        "mileage": 0,
        "seller": {
            "type": "Private",
            "phone": "+123456789",
            "city": "München"
            },
        "description": "No description available."
    },
    {
        "id": 3,
        "make": "Audi",
        "model": "A7",
        "price": 20000,
        "mileage": 0,
        "fuel": "Gasoline",
        "seller": {
            "type": "Dealer",
            "phone": "+123456789",
            "city": "Stuttgart"
            },
         "images": [
            {
                "url": "https://loremflickr.com/g/480/640/audi"
            },
            {
                "url": "https://loremflickr.com/g/1600/1200/audi"
            },
            {
                "url": "https://loremflickr.com/g/640/480/audi"
            },
            {
                "url": "https://loremflickr.com/g/640/480/audi"
            },
            {
                "url": "https://loremflickr.com/g/480/640/audi"
            }
        ],
        "description": "Good condition, had an accident two years ago."
    },
     {
        "id": 4,
        "make": "Ford",
        "model": "Mondeo",
        "colour": "White",
        "price": 5000,
        "mileage": 250000,
        "fuel": "Diesel",
        "seller": {
            "type": "Private",
            "phone": "+123456789",
            "city": "Rosenheim"
            },
         "images": [
            {
                "url": "https://loremflickr.com/g/480/640/ford"
            },
            {
                "url": "https://loremflickr.com/g/1200/1600/ford"
            },
            {
                "url": "https://loremflickr.com/g/640/480/ford"
            },
            {
                "url": "https://loremflickr.com/g/640/480/ford"
            },
            {
                "url": "https://loremflickr.com/g/480/640/ford"
            }
        ],
        "description": "Engine replaced at 180000km."
    },
     {
        "id": 5,
        "make": "Porsche",
        "model": "911",
        "colour": "Brown",
        "price": 100000,
        "mileage": 4500,
        "fuel": "Gasoline",
        "seller": {
            "type": "Private",
            "phone": "+123456789",
            "city": "Köln"
            },
         "images": [
            {
                "url": "https://loremflickr.com/g/480/640/porsche"
            },
            {
                "url": "https://loremflickr.com/g/1200/1600/porsche"
            },
            {
                "url": "https://loremflickr.com/g/480/640/porsche"
            }
        ],
        "description": "Engine replaced at 180000km."
    }

]
*/
