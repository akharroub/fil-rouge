package com.afpa.cda.service.impl;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.afpa.cda.dao.AnimationRepository;
import com.afpa.cda.dao.ManifestationRepository;
import com.afpa.cda.dao.SalleRepository;
import com.afpa.cda.dto.AnimationDto;
import com.afpa.cda.dto.ManifestationDto;
import com.afpa.cda.dto.SalleDto;
import com.afpa.cda.entity.Animation;
import com.afpa.cda.entity.Manifestation;
import com.afpa.cda.entity.Salle;
import com.afpa.cda.service.IAnimationService;
@Service
public class AnimationServiceImpl implements IAnimationService {
	@Autowired
	private AnimationRepository animationRepository;
	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private ManifestationRepository manifestationRepository;

	@Autowired
	private SalleRepository salleRepository;


	@Override
	public AnimationDto findById(int id) {

		Optional<Animation> animOp = this.animationRepository.findById(id);
		AnimationDto animDto = null;
		if (animOp.isPresent()) {
			Animation an = animOp.get();
			animDto = this.modelMapper.map(an,AnimationDto.class);
		}
		return animDto;
	}


	@Override
	public List<AnimationDto> findAll() {

		return this.animationRepository.findAll()
				.stream()
				.map(a-> this.modelMapper.map(a,AnimationDto.class))
				.collect(Collectors.toList());

	}   


	@Override
	public AnimationDto add(AnimationDto anim) {
		Animation animE = this.modelMapper.map(anim,Animation.class);
		Animation animationEntity = this.animationRepository.save(animE);
		anim.setId(animationEntity .getId());
		return anim;
	}


	@Override
	public boolean update(AnimationDto animDto, int id) {
		Optional<Animation> animEU = this.animationRepository.findById(id);
		if (animEU.isPresent()) {
			Animation an = animEU.get();
			an.setLabel(animDto.getLabel());
			an.setType(animDto.getType());
			an.setPrix(animDto.getPrix());
			an.setNbreSpectateursPrevus(animDto.getNbreSpectateursPrevus());

			List<Manifestation> listManifestation = manifestationRepository.findAll();
			for (Manifestation manifestation : listManifestation) {
				if (manifestation.getAnimation().getId()==an.getId()) {
					ManifestationDto manifestationDto = modelMapper.map(manifestation,ManifestationDto.class);
					manifestationDto=calcul(manifestationDto);
					Manifestation manif = modelMapper.map(manifestationDto,Manifestation.class);

					Optional<Manifestation> manifOp = this.manifestationRepository.findById(manifestation.getId());
					if (manifOp.isPresent()) {
						this.manifestationRepository.save(manif);
					}
				}

			}

			this.animationRepository.save(an);
			return true;
		}
		return false;
	}

	@Override
	public ManifestationDto calcul (ManifestationDto manifDto) {

		double debut=manifDto.getDateDebut().getTime();
		double fin=manifDto.getDateFin().getTime();
		double duree = 1+((((fin-debut)/1000)/3600)/24);
		AnimationDto animDto = new AnimationDto();
		Optional<Animation> animOp=animationRepository.findById(manifDto.getAnimation().getId());
		if (animOp.isPresent()) {
			Animation anim = animOp.get();
			animDto=modelMapper.map(anim,AnimationDto.class);
		}

		SalleDto salleDto = new SalleDto ();
		Optional<Salle> salleOp=salleRepository.findById(manifDto.getSalle().getId());
		if (salleOp.isPresent()) {
			Salle salle = salleOp.get();
			salleDto = modelMapper.map(salle,SalleDto.class);
		}

		manifDto.setReservations(animDto.getNbreSpectateursPrevus());
		manifDto.setReservationsVip(salleDto.getPlacesVip());
		manifDto.setCout( (animDto.getPrix()+(duree* salleDto.getFraisJournalier())));
		manifDto.setPrixBillet(manifDto.getCout()/(animDto.getNbreSpectateursPrevus()*0.8));

		return manifDto;
	}


	@Override
	public boolean delete(int id) {
		if(this.animationRepository.existsById(id)) {
			this.animationRepository.deleteById(id);
			return true;
		}
		return false;
	}
}