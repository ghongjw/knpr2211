package com.reservation.knpr2211.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.reservation.knpr2211.dto.PlaceDTO;

public interface IIndexService {

	ArrayList<PlaceDTO> selectPlace(Model model, String parkId, String parkDetail);

}
