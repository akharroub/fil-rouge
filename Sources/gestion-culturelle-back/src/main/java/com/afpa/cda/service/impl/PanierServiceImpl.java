package com.afpa.cda.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.afpa.cda.dao.CommandeRepository;
import com.afpa.cda.dao.ManifestationRepository;
import com.afpa.cda.dao.PanierRepository;
import com.afpa.cda.dao.UserRepository;
import com.afpa.cda.dto.CommandeDto;
import com.afpa.cda.dto.ManifestationDto;
import com.afpa.cda.dto.PanierDto;
import com.afpa.cda.entity.Commande;
import com.afpa.cda.entity.Manifestation;
import com.afpa.cda.entity.Panier;
import com.afpa.cda.entity.User;
import com.afpa.cda.service.IPanierService;

@Service
public class PanierServiceImpl implements IPanierService {
	@Autowired
	private PanierRepository panierRepository;
	@Autowired
	private CommandeRepository commandeRepository;
	@Autowired
	private ManifestationRepository manifestationRepository;
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private UserRepository userRepository;


	@Override
	public List<PanierDto> findAll() {

		return this.panierRepository.findAll()
				.stream()
				.map(p -> {
					PanierDto panierDto = new PanierDto();
					panierDto.setId(p.getId());
					panierDto.setDateValidation(p.getDateValidation());
					panierDto.setTotal(p.getTotal());

					panierDto.setListCommandes(new ArrayList<CommandeDto>());

					for (Commande m : p.getListCommandes()) {
						panierDto.getListCommandes()
						.add(CommandeDto
								.builder()
								.id(m.getId())
								.panier(PanierDto.builder()
										.id(m.getPanier().getId())
										.dateValidation(m.getPanier().getDateValidation())
										.build())
								.manifestation(ManifestationDto.builder()
										.id(m.getManifestation().getId())
										.label(m.getManifestation().getLabel())
										.prixBillet(m.getManifestation().getPrixBillet())
										.build())
								.build());


						//								.label(m.getLabel())
						//								.animation(AnimationDto.builder()
						//										.id(m.getAnimation().getId())
						//										.label(m.getAnimation().getLabel())
						//										.build())
						//								.build());
					}
					return panierDto;
				})
				.collect(Collectors.toList());
	}

	@Override
	public void addCommandePanier (CommandeDto commandeDto) {

		Optional <Panier> panierOp=panierRepository.findById(commandeDto.getPanier().getId());
		Optional <Manifestation> manifestationOp=manifestationRepository.findById(commandeDto.getManifestation().getId());
		PanierDto panierDto = new PanierDto();
		ManifestationDto manifestationDto = new ManifestationDto();

		if (panierOp.isPresent() && manifestationOp.isPresent()) {
			panierDto = modelMapper.map(panierOp.get(), PanierDto.class);
			manifestationDto = modelMapper.map(manifestationOp.get(),ManifestationDto.class);

			if (manifestationDto.getReservations() >= commandeDto.getQuantite()) {
				this.commandeRepository.save(this.modelMapper.map(commandeDto, Commande.class));
				panierDto.setTotal(panierDto.getTotal()+commandeDto.getQuantite()*manifestationDto.getPrixBillet());
				manifestationDto.setReservations(manifestationDto.getReservations()-commandeDto.getQuantite());
				//				DateFormat df = new SimpleDateFormat("dd/MM/yy");
				Date dateobj = new Date();
				panierDto.setDateValidation(dateobj);
				panierRepository.save(this.modelMapper.map(panierDto, Panier.class));
				manifestationRepository.save(this.modelMapper.map(manifestationDto, Manifestation.class));
			} else {
				System.err.println("Pas assez de billets dispo"); }
		}

	}


	@Override
	public PanierDto add(PanierDto panier) {
		Panier panE = this.panierRepository.save(this.modelMapper.map(panier, Panier.class));
		panier.setId(panE.getId());
		return panier;
	}

	@Override
	public boolean updatePanier(PanierDto panier, int id) {
		Optional<Panier> panUp = this.panierRepository.findById(id);
		if (panUp.isPresent()) {
			this.panierRepository.save(this.modelMapper.map(panier, Panier.class));

			// Panier pr= panUp.get();
			// pr.setNbreBillets(panier.getNbreBillets());
			// pr.setNumClient(panier.getNumClient());
			// this.panierRepository.save(pr);
			return true;
		}
		return false;
	}


	@Override
	public void deletePanier(int id) {
		Optional<Panier> panierOp = this.panierRepository.findById(id);

		if (panierOp.isPresent()) {
			List<Commande> listCommandes = this.commandeRepository.findAll();
			List<Commande> listCommandesByPanier = new ArrayList<Commande>();
			for (Commande commande : listCommandes) {
				if (commande.getPanier().getId()==id) {
					listCommandesByPanier.add(commande);
				}
			}

			for (Commande commande : listCommandesByPanier) {
				this.commandeRepository.deleteById(commande.getId());
			}

			PanierDto panierDto = modelMapper.map(panierOp.get(),PanierDto.class);
			panierDto.getListCommandes().clear();
			panierDto.setTotal(0);
			panierRepository.save(this.modelMapper.map(panierDto,Panier.class));			
		}
	}

	@Override
	public void deleteCommandes(int id) {
		Optional<Panier> panierOp =	this.panierRepository.findById(id);
		if (panierOp.isPresent()) {
			List<Commande> listCommandes = this.commandeRepository.findAll();
			List<Commande> listCommandesByPanier = new ArrayList<Commande>();
			for (Commande commande : listCommandes) {
				if (commande.getPanier().getId()==id) {
					listCommandesByPanier.add(commande);
				}
			}

			PanierDto panierDto = modelMapper.map(panierOp.get(),PanierDto.class);
			CommandeDto commandeDto = new CommandeDto();
			ManifestationDto manifestationDto = new ManifestationDto ();

			for (Commande commande : listCommandesByPanier) {
				commandeDto= modelMapper.map(commande,CommandeDto.class);
				manifestationDto = commandeDto.getManifestation();
				manifestationDto.setReservations(manifestationDto.getReservations()+commandeDto.getQuantite());
				panierDto.setTotal(panierDto.getTotal()-(manifestationDto.getPrixBillet()*commandeDto.getQuantite()));
				this.manifestationRepository.save(this.modelMapper.map(manifestationDto,Manifestation.class));
				this.panierRepository.save(this.modelMapper.map(panierDto,Panier.class));
			}
			this.commandeRepository.deleteAll();
		}

	}


	@Override
	public PanierDto findById(int id) {
		Optional<Panier> panE = this.panierRepository.findById(id);
		PanierDto panDto = new PanierDto();

		if (panE.isPresent()) {

			Panier pan= panE.get();
			panDto.setId(pan.getId());
			panDto.setDateValidation(pan.getDateValidation());
			panDto.setTotal(pan.getTotal());

			PanierDto panierDto = new PanierDto();

			panierDto.setListCommandes(new ArrayList<CommandeDto>());

			for (Commande m : pan.getListCommandes()) {
				panierDto.getListCommandes()
				.add(CommandeDto
						.builder()
						.id(m.getId())
						.panier(PanierDto.builder()
								.id(m.getPanier().getId())
								.dateValidation(m.getPanier().getDateValidation())
								.build())
						.manifestation(ManifestationDto.builder()
								.id(m.getManifestation().getId())
								.label(m.getManifestation().getLabel())
								.prixBillet(m.getManifestation().getPrixBillet())
								.build())
						.build());

			}

		}
		return panDto;
	}

	@Override
	public PanierDto findByUser(int id) {
		Optional <User> userOp=this.userRepository.findById(id);
		PanierDto panierDto = new PanierDto ();
		if (userOp.isPresent()) {
			Panier panier = userOp.get().getPanier();
			panierDto = modelMapper.map(panier,PanierDto.class);
		}

		return panierDto;
	}

}