create sequence animation_seq start with 1 increment by 50
create sequence manifestation_seq start with 1 increment by 50
create sequence panier_seq start with 1 increment by 50
create sequence personne_seq start with 1 increment by 50
create sequence role_seq start with 1 increment by 50
create sequence salle_seq start with 1 increment by 50
create sequence typesalle_seq start with 1 increment by 50
create table animation (id integer not null, label varchar(255), nbre_spectateurs_prevus integer not null, prix double not null, type varchar(255), primary key (id))
create table manifestation (id integer not null, cout double not null, date timestamp, label varchar(255), prix_billet double not null, rentabilite double not null, reservations integer not null, reservations_vip integer not null, animation_id integer, salle integer, primary key (id))
create table manifestation_panier (id_panier integer not null, id_manifestation integer not null)
create table panier (id integer not null, nbre_billets integer not null, num_client integer not null, primary key (id))
create table personne (id integer not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client integer not null, password varchar(255), prenom varchar(255), panier_id integer, primary key (id))
create table personne_animations (personne_id integer not null, animations_id integer not null)
create table personne_roles (personne_id integer not null, roles_id integer not null)
create table role (id integer not null, label varchar(255), primary key (id))
create table role_dto (id integer not null, label varchar(255), primary key (id))
create table salle (id integer not null, capacite integer not null, fraisjournalier double not null, label varchar(255), places_vip integer not null, typesalle_id integer, primary key (id))
create table type_salle (id integer not null, label varchar(255), primary key (id))
alter table personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
<<<<<<< HEAD
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))

create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))

create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table personne_roles (personne_id int4 not null, roles_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists personne_roles add constraint FKfigc9srwxr01jvvielt46h2l9 foreign key (roles_id) references role
alter table if exists personne_roles add constraint FKav1xthpdmdhsw6eoou8pihnp9 foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle

create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), role int4 not null, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FK8huc8wa15vbaj05dc0fuk39nt foreign key (role) references panier
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation timestamp, date_debut timestamp, date_fin timestamp, date_validation timestamp, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, role int4 not null, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne add constraint FKn8dsrqe6t72xqm0sw1xycdjtx foreign key (role) references role
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation date, date_debut date, date_fin date, date_validation date, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, role int4 not null, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne add constraint FKn8dsrqe6t72xqm0sw1xycdjtx foreign key (role) references role
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation date, date_debut date, date_fin date, date_validation date, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, role int4 not null, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne add constraint FKn8dsrqe6t72xqm0sw1xycdjtx foreign key (role) references role
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation date, date_debut date, date_fin date, date_validation date, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, role int4 not null, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne add constraint FKn8dsrqe6t72xqm0sw1xycdjtx foreign key (role) references role
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation date, date_debut date, date_fin date, date_validation date, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, role int4 not null, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne add constraint FKn8dsrqe6t72xqm0sw1xycdjtx foreign key (role) references role
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation date, date_debut date, date_fin date, date_validation date, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, role int4 not null, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne add constraint FKn8dsrqe6t72xqm0sw1xycdjtx foreign key (role) references role
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation date, date_debut date, date_fin date, date_validation date, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, role int4 not null, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne add constraint FKn8dsrqe6t72xqm0sw1xycdjtx foreign key (role) references role
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation date, date_debut date, date_fin date, date_validation date, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, role int4 not null, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne add constraint FKn8dsrqe6t72xqm0sw1xycdjtx foreign key (role) references role
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation date, date_debut date, date_fin date, date_validation date, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, role int4 not null, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne add constraint FKn8dsrqe6t72xqm0sw1xycdjtx foreign key (role) references role
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation date, date_debut date, date_fin date, date_validation date, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, role int4 not null, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne add constraint FKn8dsrqe6t72xqm0sw1xycdjtx foreign key (role) references role
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation date, date_debut date, date_fin date, date_validation date, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, role int4 not null, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne add constraint FKn8dsrqe6t72xqm0sw1xycdjtx foreign key (role) references role
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation date, date_debut date, date_fin date, date_validation date, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, role int4 not null, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne add constraint FKn8dsrqe6t72xqm0sw1xycdjtx foreign key (role) references role
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
create sequence animation_seq start 1 increment 50
create sequence manifestation_seq start 1 increment 50
create sequence panier_seq start 1 increment 50
create sequence personne_seq start 1 increment 50
create sequence role_seq start 1 increment 50
create sequence salle_seq start 1 increment 50
create sequence typesalle_seq start 1 increment 50
create table animation (id int4 not null, label varchar(255), nbre_spectateurs_prevus int4 not null, prix float8 not null, type varchar(255), primary key (id))
create table manifestation (id int4 not null, cout float8 not null, date_anulation date, date_debut date, date_fin date, date_validation date, label varchar(255), prix_billet float8 not null, rentabilite float8 not null, reservations int4 not null, reservations_vip int4 not null, animation_id int4, annulateur_id int4, salle int4 not null, validateur_id int4, primary key (id))
create table manifestation_panier (id_panier int4 not null, id_manifestation int4 not null)
create table panier (id int4 not null, date_validation timestamp, nbre_billets int4 not null, num_client int4 not null, total float8 not null, primary key (id))
create table personne (id int4 not null, adresse varchar(255), email varchar(255), entreprise varchar(255), login varchar(255), nom varchar(255), num_client int4 not null, password varchar(255), prenom varchar(255), panier_id int4, role int4 not null, primary key (id))
create table personne_animations (personne_id int4 not null, animations_id int4 not null)
create table role (id int4 not null, label varchar(255), primary key (id))
create table salle (id int4 not null, capacite int4 not null, fraisjournalier float8 not null, label varchar(255), places_vip int4 not null, typesalle_id int4, primary key (id))
create table type_salle (id int4 not null, label varchar(255), primary key (id))
alter table if exists personne_animations add constraint UK_l4k4yfx21ig0v9p9gnrbcapt2 unique (animations_id)
alter table if exists manifestation add constraint FK781sg16cb10f3g9c6mbfhjj5c foreign key (animation_id) references animation
alter table if exists manifestation add constraint FK5286lwwhk429ppvpmm5y7xien foreign key (annulateur_id) references personne
alter table if exists manifestation add constraint FKo9a9xk25iow34qrrppchg8v93 foreign key (salle) references salle
alter table if exists manifestation add constraint FK34tfl3qbgfsf7mc8wjv33c3xu foreign key (validateur_id) references personne
alter table if exists manifestation_panier add constraint FKfted46t6fh8ptj50q3ff27vgu foreign key (id_manifestation) references manifestation
alter table if exists manifestation_panier add constraint FKml5dtvlsc7u3s2q3n3qa3a8pe foreign key (id_panier) references panier
alter table if exists personne add constraint FKhu8pvqfvd9n6y6lm5w9ra2n0r foreign key (panier_id) references panier
alter table if exists personne add constraint FKn8dsrqe6t72xqm0sw1xycdjtx foreign key (role) references role
alter table if exists personne_animations add constraint FKs0fmawwirnth8u8xqjd71jlb5 foreign key (animations_id) references animation
alter table if exists personne_animations add constraint FK5dcxk4qg38i6qppnlewvyyeda foreign key (personne_id) references personne
alter table if exists salle add constraint FKsu62eulbou2sqg08y2j5oe7bs foreign key (typesalle_id) references type_salle
=======
>>>>>>> dev
