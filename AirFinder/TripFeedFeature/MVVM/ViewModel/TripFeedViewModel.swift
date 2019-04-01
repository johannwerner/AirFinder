//
//  TripFeedViewModel.swift
//  AirFinder
//
//  Created by Anonymous on 23.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

import UIKit

protocol TripsFeedViewModelDelegate: class {
    func reloadTableView()
}

class TripFeedViewModel {
    
    weak var delegate: TripsFeedViewModelDelegate?
    private let flight: Flight
    private let numberFormatter = NumberFormatter()
    private let dateFormatter = DateFormatter()
    
    init(flight: Flight) {
        self.flight = flight
        numberFormatter.numberStyle = .currency
        
        numberFormatter.locale = NSLocale.current
        //TODO: Dynamically return correct currency here.
        numberFormatter.locale = Locale(identifier: "en_GB")

        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
    }
    
    var itinerariesCount: Int {
        return flight.itineraries.count
    }
    
    var title: String { //TODO: Use correct location
        return "Edingburgh - London".localized()
    }
    
    var subtitle: String { //TODO: Use correct date
        return "TomorrowKey".localized()
    }
    
    func createItems() {
        for iteneary in flight.itineraries {
            guard var outboundFlightLeg = getFlightLeg(for: iteneary.outboundLegId, in: flight) else {
                return
            }
            
            guard var inboundFlightLeg = getFlightLeg(for: iteneary.inboundLegId, in: flight) else {
                return
            }
            
            outboundFlightLeg.departureArrival = getDepartureArrivalString(flightLeg: outboundFlightLeg)
            inboundFlightLeg.departureArrival = getDepartureArrivalString(flightLeg: inboundFlightLeg)
            
            let price = getPriceStringWithFormatFromDouble(priceDouble: iteneary.pricingOptions.first?.price)
            let outboundCarrier = getCarrier(flightLeg: outboundFlightLeg, in: flight)
            let inboundCarrier = getCarrier(flightLeg: inboundFlightLeg, in: flight)
            
            outboundFlightLeg.carrier = outboundCarrier
            inboundFlightLeg.carrier = inboundCarrier
            iteneary.items = [outboundFlightLeg, inboundFlightLeg]
            if let nonNilPrice = price {
                iteneary.items.append(nonNilPrice)
            }
        }
        delegate?.reloadTableView()
    }
    
    func getItemForIndexPath(for indexPath: IndexPath) -> Any? {
        guard let iteneary = itinerary(for: indexPath) else {
            return nil
        }
        guard indexPath.row < iteneary.items.count else {
            return nil
        }
        return iteneary.items[indexPath.row]
    }
}

private extension TripFeedViewModel {
    func itinerary(for indexPath: IndexPath) -> Itinerary? {
        guard indexPath.section < itinerariesCount else {
            return nil
        }
        return flight.itineraries[indexPath.section]
    }
    
    func getPriceStringWithFormatFromDouble(priceDouble: Double?) -> String? {
        guard let priceDouble = priceDouble else {
            return nil
        }
        let priceNumber = priceDouble as NSNumber

        return numberFormatter.string(from: priceNumber)
    }
    
    func getFlightLeg(for idString: String, in flight: Flight) -> FlightLeg? {
        let outboundFlightLeg = flight.flightLeg.first(where: {$0.id == idString})
        return outboundFlightLeg
    }
    
    func getCarrier(flightLeg: FlightLeg, in flight: Flight) -> Carrier? {
        return flight.carriers.first(where: {$0.id == flightLeg.carriers.first})
    }
    
    func getDepartureArrivalString(flightLeg: FlightLeg) -> String {
       
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"
        guard let departureDate = dateFormatter.date(from: flightLeg.departure) else {
            return ""
        }
        guard let arrivalDate = dateFormatter.date(from: flightLeg.arrival) else {
            return ""
        }
        
        dateFormatter.dateFormat = "HH:mm"

        let departureTimeString = dateFormatter.string(from: departureDate)
        let arrivalTimeString = dateFormatter.string(from: arrivalDate)
        return String(format: "DepatureDate-ArrivalDate".localized(), departureTimeString, arrivalTimeString)
    }
}
