package com.airbnb3.codesquad.airbnb3.controller;

import com.airbnb3.codesquad.airbnb3.dto.alex.DetailDtoAlex;
import com.airbnb3.codesquad.airbnb3.dto.alex.PropertiesDtoAlex;
import com.airbnb3.codesquad.airbnb3.service.AirbnbService;
import com.airbnb3.codesquad.airbnb3.service.ReservationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.List;

import static com.airbnb3.codesquad.airbnb3.common.CommonStaticsPropertiesHamill.*;
import static com.airbnb3.codesquad.airbnb3.common.CommonStaticsPropertiesHamill.DEFAULT_CHILDREN_COUNT;
import static com.airbnb3.codesquad.airbnb3.common.CommonStaticsProperties.*;

@RestController
public class AirbnbController {

    private static final Logger logger = LoggerFactory.getLogger(AirbnbController.class);
    private final AirbnbService airbnbService;
    private final ReservationService reservationService;

    public AirbnbController(AirbnbService airbnbService, ReservationService reservationService) {
        this.airbnbService = airbnbService;
        this.reservationService = reservationService;
    }

    @GetMapping("/properties")
    public ResponseEntity<List<PropertiesDtoAlex>> stayedPage(
            @RequestParam(value = "offset", required = false, defaultValue = DEFAULT_OFFSET) Integer offset,
            @RequestParam(value = "adults", required = false, defaultValue = DEFAULT_ADULTS_COUNT) Integer adults,
            @RequestParam(value = "children", required = false, defaultValue = DEFAULT_CHILDREN_COUNT) Integer children,
            @RequestParam(value = "min_price", required = false, defaultValue = DEFAULT_MIN_PRICE) String minPrice,
            @RequestParam(value = "max_price", required = false, defaultValue = DEFAULT_MAX_PRICE) String maxPrice,
            @RequestParam(value = "check_in", required = false) Date checkIn,
            @RequestParam(value = "check_out", required = false) Date checkOut,
            @RequestParam(value = "min_lat", required = false, defaultValue = DEFAULT_MIN_LATITUDE) String minLatitude,
            @RequestParam(value = "min_long", required = false, defaultValue = DEFAULT_MIN_LONGITUDE) String minLongitude,
            @RequestParam(value = "max_lat", required = false, defaultValue = DEFAULT_MAX_LATITUDE) String maxLatitude,
            @RequestParam(value = "max_long", required = false, defaultValue = DEFAULT_MAX_LONGITUDE) String maxLongitude,
            @CookieValue(value = "name", defaultValue = "None", required = false) String name
    ) {
        return new ResponseEntity<>(airbnbService.stayedProperties(offset, adults, children, checkIn, checkOut, name,
                minPrice, maxPrice, minLatitude, maxLatitude, minLongitude, maxLongitude), HttpStatus.OK);
    }

    @GetMapping("/properties/{id}")
    public ResponseEntity<DetailDtoAlex> detailPage(@PathVariable("id") Long id) {
        return new ResponseEntity<>(airbnbService.detailProperties(id), HttpStatus.OK);
    }

    //@PutMapping("/reservations/{id}")
//    @GetMapping("/reservations/{id}")
//    public ResponseEntity<Object> reservationRequest(@PathVariable("id") Long id,
//                                                     @RequestParam(value = "check_in") Date checkIn,
//                                                     @RequestParam(value = "check_out") Date checkOut,
//                                                     @RequestParam(value = "adults") Integer adults,
//                                                     @RequestParam(value = "children") Integer children,
//                                                     @CookieValue(value = "name", defaultValue = "None", required = false) String name
//    ) {
//        // 내부 로직 수정
//        ReservationDto result = reservationService.propertyReservation(id, checkIn, checkOut, adults, children, name);
//
//        if (result == null) {
//            return new ResponseEntity<>("Already Booked!!!!!!!!!!!!!!!!", HttpStatus.OK);
//        }
//
//        return new ResponseEntity<>(result, HttpStatus.OK);
//    }

    //@DeleteMapping("/reservations/{id}")
//    @GetMapping("/reservations/{id}")
//    public ResponseEntity<Object> cancelReservationRequest(@PathVariable("id") Long reservationId) {
//        //내부 로직 수정
//        reservationService.cancelReservation(reservationId, propertiesId);
//        return new ResponseEntity<>("Cancel Reservation", HttpStatus.OK);
//    }
//
//    //@PutMapping("/saved/{id}")
    @GetMapping("/saved/{id}")
    public void savedProperties(@PathVariable("id") Long id, @CookieValue(value = "name", defaultValue = "Alex") String name) {
        airbnbService.saveProperties(id, name);
    }

    @GetMapping("/saved/{id}/del")
    public void unSavedProperties(@PathVariable("id") Long id, @CookieValue(value = "name", defaultValue = "Alex") String name) {
        airbnbService.unSaveProperties(id, name);
    }
}
