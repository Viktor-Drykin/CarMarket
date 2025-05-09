# CarMarket

This app requests the list of cars from the network, displays this list and shows the details of the selected car on a separate screen.
Just run `CarMarket.xcodeproj`. Minimum deployment target is iOS 15.

#### Responsibilities:
- `NetworkService` - making requests
- `CarNetworkServiceImpl` - defining URLRequest and calling network service to get DTO
- `CarRepositoryImpl` - calling CarNetworkService to get response and in case of pagination to store results to reuse it.
- `CarListViewModel/CarDetailsViewModel` - presentation layer entities responsible for preparing content to display
- `CarMapper/CarDetailsMapper` - map models to presentation models
- `CarDetailsLocalisationProvider/CarListLocalisationProvider` - providing localised content


### Design Diagram
![CarMarket_light](https://github.com/user-attachments/assets/16a57136-0edd-4048-a00a-f4973b0f8b08)

### Showcase
https://github.com/user-attachments/assets/2e9767a7-f0a3-4e80-9d4b-13f9bb7dcb55
