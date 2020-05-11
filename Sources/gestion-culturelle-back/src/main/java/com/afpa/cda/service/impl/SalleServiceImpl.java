
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
import com.afpa.cda.dto.TypeSalleDto;
import com.afpa.cda.entity.Animation;
import com.afpa.cda.entity.Manifestation;
import com.afpa.cda.entity.Salle;
import com.afpa.cda.entity.TypeSalle;
import com.afpa.cda.service.ISalleService;

@Service
public class SalleServiceImpl implements ISalleService {

	@Autowired
	private SalleRepository salleRepository;
	
	@Autowired
	private AnimationRepository animationRepository;

	@Autowired
	private ManifestationRepository manifestationRepository;
	
	@Autowired
	private ModelMapper modelMapper;


	@Override
	public List<SalleDto> findAll() {
		return this.salleRepository.findAll()
				.stream()
				.map(s-> SalleDto.builder()
						.id(s.getId())
						.label(s.getLabel())
						.capacite(s.getCapacite())
						.placesVip(s.getPlacesVip())
						.fraisJournalier(s.getFraisjournalier())
						.typeSalle(TypeSalleDto.builder()
								.id(s.getTypesalle().getId())
								.label(s.getTypesalle().getLabel())
								.build())
						.build())
						.collect(Collectors.toList());
	}


	@Override
	public SalleDto add(SalleDto sal) {
		try {
		Salle salle = this.salleRepository.save(this.modelMapper.map(sal,Salle.class));
		sal.setId(salle.getId());
		System.err.println("Salle ajoutee");
		} catch (Exception e) {
			System.err.println(e.getStackTrace());
		}
		return sal;
	}

	
	@Override
	public boolean updateSalle(SalleDto salleDto, int id) {
		Optional <Salle> salleOp= this.salleRepository.findById(id);
		if(salleOp.isPresent()) {
			Salle salle = salleOp.get();
			salle=this.modelMapper.map(salleDto,Salle.class);
		
			List<Manifestation> listManifestation = manifestationRepository.findAll();
			for (Manifestation manifestation : listManifestation) {
				if (manifestation.getSalle().getId()==salle.getId()) {
					ManifestationDto manifestationDto = modelMapper.map(manifestation,ManifestationDto.class);
					manifestationDto=calcul(manifestationDto);
					Manifestation manif = modelMapper.map(manifestationDto,Manifestation.class);
					
					Optional<Manifestation> manifOp = this.manifestationRepository.findById(manifestation.getId());
					if (manifOp.isPresent()) {
						this.manifestationRepository.save(manif);
					}
					
				}
			}
			
			this.salleRepository.save(salle);
			
			System.err.println("Salle mise à jour");
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
	public boolean deleteSalle(int id) {
		if(this.salleRepository.existsById(id)) {
			this.salleRepository.deleteById(id);
			System.err.println("Salle supprimee");
			return true;
		}
		return false;
	}

	@Override
	public SalleDto findById(int id) {
		Optional<Salle> salleOp = this.salleRepository.findById(id);
		SalleDto salleDto = new SalleDto();
		if(salleOp.isPresent()) {
			Salle salle = salleOp.get();
		
			salleDto.setId(salle.getId());
			salleDto.setLabel(salle.getLabel());
			salleDto.setCapacite(salle.getCapacite());
			salleDto.setPlacesVip(salle.getPlacesVip());
			salleDto.setFraisJournalier(salle.getFraisjournalier());
		
			TypeSalleDto typeSalleDto = new TypeSalleDto();
			typeSalleDto.setId(salle.getTypesalle().getId());
			typeSalleDto.setLabel(salle.getTypesalle().getLabel());
			salleDto.setTypeSalle(typeSalleDto);
			
		}
		return salleDto;
	}
}
