-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Creato il: Mar 07, 2018 alle 16:36
-- Versione del server: 10.1.9-MariaDB
-- Versione PHP: 5.6.15

-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easymove`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `auto`
--

CREATE TABLE `auto` (
  `id` varchar(256) NOT NULL,
  `modello` varchar(256) NOT NULL,
  `marca` varchar(256) NOT NULL,
  `colore` varchar(256) DEFAULT NULL,
  `utente_fk` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `feedback`
--

CREATE TABLE `feedback` (
  `id` varchar(256) NOT NULL,
  `valutazione_guida` int(11) DEFAULT NULL,
  `valutazione_puntualita` int(11) DEFAULT NULL,
  `valutazione_disponibilita` int(11) DEFAULT NULL,
  `testo` longtext,
  `data` varchar(256) NOT NULL,
  `utente_recensore` varchar(256) NOT NULL,
  `utente_recensito` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `messaggio`
--

CREATE TABLE `messaggio` (
  `id` int(11) NOT NULL,
  `testo` longtext NOT NULL,
  `ora_data` datetime DEFAULT '1999-12-31 02:00:00',
  `viaggio` int(11) NOT NULL,
  `utente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `notifica`
--

CREATE TABLE `notifica` (
  `id` varchar(256) NOT NULL,
  `mittente` varchar(256) NOT NULL,
  `destinatario` varchar(256) NOT NULL,
  `tipologia` int(11) NOT NULL,
  `messaggio` text,
  `data` varchar(256) NOT NULL,
  `fine_validita` varchar(256) NOT NULL,
  `inizio_validita` varchar(256) NOT NULL,
  `id_viaggio` varchar(256) DEFAULT NULL,
  `nome_viaggio` varchar(256) DEFAULT NULL,
  `nome_mittente` varchar(256) NOT NULL,
  `nome_destinatario` varchar(256) DEFAULT NULL,
  `stato` int(11) NOT NULL DEFAULT '1',
  `posti` int(11) NOT NULL DEFAULT '0',
  `posti_da_prenotare` int(11) DEFAULT '0',
  `id_partenza` varchar(256) DEFAULT NULL,
  `id_arrivo` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `notifica_stato`
--

CREATE TABLE `notifica_stato` (
  `id` int(11) NOT NULL,
  `Valore` varchar(256) DEFAULT NULL,
  `Descrizione` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `notifica_stato`
--

INSERT INTO `notifica_stato` (`id`, `Valore`, `Descrizione`) VALUES
(0, 'Inserita', 'La notifica ? stata inserita nel server'),
(1, 'Visualizzata', 'La notifica ? stata visualizzata dall utente'),
(2, 'Eliminata', 'La notifica ? stata eliminata dall utente'),
(3, 'Scaduta', 'La notifica ? scaduta');

-- --------------------------------------------------------

--
-- Struttura della tabella `notifica_tipologia`
--

CREATE TABLE `notifica_tipologia` (
  `id_tipologia` int(11) NOT NULL,
  `Valore` varchar(256) DEFAULT NULL,
  `Descrizione` varchar(256) DEFAULT NULL,
  `bottone_1` varchar(256) DEFAULT NULL,
  `bottone_2` varchar(256) DEFAULT NULL,
  `titolo` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `notifica_tipologia`
--

INSERT INTO `notifica_tipologia` (`id_tipologia`, `Valore`, `Descrizione`, `bottone_1`, `bottone_2`, `titolo`) VALUES
(1, 'Richiesta amicizia', NULL, 'Accetta', 'Rifiuta', 'Richiesta di amicizia'),
(2, 'Accetta condivisione dati', 'L''utente ha accettato di condividere i suoi dati, successivamente verr? inviata una richiesta di prenotazione all''altro utente', 'Prenota', NULL, 'Ora ? possibile prenotare'),
(3, 'Invio prenotazione', 'Invio prenotazione', 'Accetta', 'Rifiuta', 'Richiesta di prenotazione'),
(4, 'Prenotazione accettata', 'Prenotazione accettata', NULL, NULL, 'Prenotazione accettata'),
(5, 'Prenotazione rifiutata', 'Prenotazione rifiutata', NULL, NULL, 'Prenotazione rifiutata'),
(6, 'Amicizia rifutata', 'Amicizia rifutata', NULL, NULL, 'Amicizia rifutata'),
(7, 'Inserisci un feedback', 'Inserisci un feedback', 'Inserisci', NULL, 'Inserisci un feedback'),
(8, 'E'' stato inserito un feedback', 'E'' stato inserito un feedback', 'Vai ai feedback', NULL, 'E'' stato inserito un feedback'),
(9, 'Amicizia accettata', 'Accettazione amicizia senza prenotazione', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `posizione`
--

CREATE TABLE `posizione` (
  `id` varchar(256) NOT NULL,
  `nome` varchar(256) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `address_components` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `posizione`
--

INSERT INTO `posizione` (`id`, `nome`, `lat`, `lng`, `address_components`) VALUES
('129ee38b-5669-4733-ae24-41ec942a8628', 'Accademia di Belle Arti L''Aquila', 42.365353, 13.372867000000042, '{"address_components":[{"long_name":"snc","short_name":"snc","types":["street_number"]},{"long_name":"Via Leonardo da Vinci","short_name":"Via Leonardo da Vinci","types":["route"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["locality","political"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["administrative_area_level_3","political"]},{"long_name":"Provincia dell''Aquila","short_name":"AQ","types":["administrative_area_level_2","political"]},{"long_name":"Abruzzo","short_name":"Abruzzo","types":["administrative_area_level_1","political"]},{"long_name":"Italia","short_name":"IT","types":["country","political"]},{"long_name":"67100","short_name":"67100","types":["postal_code"]}],"adr_address":"<span class=\\"street-address\\">Via Leonardo da Vinci, snc</span>, <span class=\\"postal-code\\">67100</span> <span class=\\"locality\\">L&#39;Aquila</span> <span class=\\"region\\">AQ</span>, <span class=\\"country-name\\">Italia</span>","formatted_address":"Via Leonardo da Vinci, snc, 67100 L''Aquila AQ, Italia","formatted_phone_number":"0862 317360","geometry":{"location":{"lat":42.365353,"lng":13.372867000000042},"viewport":{"south":42.3640040197085,"west":13.371518019708446,"north":42.3667019802915,"east":13.374215980291524}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/school-71.png","id":"157e1c906c7c97e3437fae24c53cc577aa2c3085","international_phone_number":"+39 0862 317360","name":"Accademia di Belle Arti L''Aquila","opening_hours":{"open_now":true,"periods":[{"close":{"day":1,"time":"1900","hours":19,"minutes":0,"nextDate":1519668000000},"open":{"day":1,"time":"0800","hours":8,"minutes":0,"nextDate":1519628400000}},{"close":{"day":2,"time":"1900","hours":19,"minutes":0,"nextDate":1519754400000},"open":{"day":2,"time":"0800","hours":8,"minutes":0,"nextDate":1519714800000}},{"close":{"day":3,"time":"1900","hours":19,"minutes":0,"nextDate":1519840800000},"open":{"day":3,"time":"0800","hours":8,"minutes":0,"nextDate":1519801200000}},{"close":{"day":4,"time":"1900","hours":19,"minutes":0,"nextDate":1519322400000},"open":{"day":4,"time":"0800","hours":8,"minutes":0,"nextDate":1519887600000}},{"close":{"day":5,"time":"1900","hours":19,"minutes":0,"nextDate":1519408800000},"open":{"day":5,"time":"0800","hours":8,"minutes":0,"nextDate":1519369200000}},{"close":{"day":6,"time":"1300","hours":13,"minutes":0,"nextDate":1519473600000},"open":{"day":6,"time":"0800","hours":8,"minutes":0,"nextDate":1519455600000}}],"weekday_text":["luned?: 08:00?19:00","marted?: 08:00?19:00","mercoled?: 08:00?19:00","gioved?: 08:00?19:00","venerd?: 08:00?19:00","sabato: 08:00?13:00","domenica: Chiuso"]},"photos":[{"height":665,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/110834208529969261065/photos\\">M. G.</a>"],"width":1000},{"height":3024,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/102774013744612298466/photos\\">Sabrina</a>"],"width":4032},{"height":540,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/110834208529969261065/photos\\">M. G.</a>"],"width":960},{"height":1746,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/107698512896434179054/photos\\">Umberto di Nino</a>"],"width":3104},{"height":665,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/110834208529969261065/photos\\">M. G.</a>"],"width":1000},{"height":1746,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/107698512896434179054/photos\\">Umberto di Nino</a>"],"width":3104},{"height":3024,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/102774013744612298466/photos\\">Sabrina</a>"],"width":4032},{"height":1746,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/107698512896434179054/photos\\">Umberto di Nino</a>"],"width":3104},{"height":1440,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/102774013744612298466/photos\\">Sabrina</a>"],"width":2560},{"height":2560,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/102774013744612298466/photos\\">Sabrina</a>"],"width":1440}],"place_id":"ChIJX3jzSJfSLxMRTE99cTzloxA","rating":4.7,"reference":"CmRRAAAAMYddd7GBGTawYeTJU3lg_XarthZpPtX9e9w0_Dp17DwziAL-WAr_sjxEe2xSFNFShFrY5OM-EKyGF7EO7oGwXr1zuSjzGi0iV2xj9u7MvP_gcVmHa5B6ys2qlSpKAM9QEhCCCe_jYeeJsKugwnK7w1frGhQ4tgRME9D60iZA6liSVSHF6KyfTQ","reviews":[{"author_name":"Sabrina","author_url":"https://www.google.com/maps/contrib/102774013744612298466/reviews","language":"it","profile_photo_url":"https://lh3.googleusercontent.com/-VjI6Qqp79tk/AAAAAAAAAAI/AAAAAAAAAB8/vJzF0tiieRM/s128-c0x00000000-cc-rp-mo-ba5/photo.jpg","rating":4,"relative_time_description":"2 mesi fa","text":"Magnifico edificio postmoderno. Docenti competenti e segreteria efficiente e disponibile. In generale, si potrebbe fare di pi? sotto il punto di vista dell''organizzazione.","time":1512491949},{"author_name":"Ro Berta","author_url":"https://www.google.com/maps/contrib/104153967720601410071/reviews","language":"it","profile_photo_url":"https://lh4.googleusercontent.com/-nqOGX11Xfis/AAAAAAAAAAI/AAAAAAAAAIo/4hp5RRniUHs/s128-c0x00000000-cc-rp-mo/photo.jpg","rating":5,"relative_time_description":"un anno fa","text":"Alcuni dei docenti che si trovano qui sono impareggiabili per quanto riguarda cultura e passione. Quest''anno ? stato avviato anche il nuovo corso di Fotografia","time":1481313814},{"author_name":"Marco Miroballo","author_url":"https://www.google.com/maps/contrib/103116476603460214873/reviews","language":"it","profile_photo_url":"https://lh5.googleusercontent.com/-VK506QsaEsY/AAAAAAAAAAI/AAAAAAAAo2A/ZgZ2p2HrYog/s128-c0x00000000-cc-rp-mo-ba4/photo.jpg","rating":5,"relative_time_description":"2 anni fa","text":"La storica accademia di belle arti di L''Aquila ? un posto caotico e pieno di fermento artistico. Il palazzo ? un po'' nascosto ma merita uno sguardo, non per l''architettura in s?, quanto perch? praticamente ad ogni ora, giovani artisti sono in cortile in cerca della propria strada. ","time":1453932165},{"author_name":"luca agostino","author_url":"https://www.google.com/maps/contrib/112342999102530410345/reviews","language":"it","profile_photo_url":"https://lh5.googleusercontent.com/-pUFRJJvAkTQ/AAAAAAAAAAI/AAAAAAAAMMw/C3f_e19ACjM/s128-c0x00000000-cc-rp-mo-ba3/photo.jpg","rating":4,"relative_time_description":"un mese fa","text":"","time":1515529388},{"author_name":"Franco Fiorillo","author_url":"https://www.google.com/maps/contrib/101859911447238537061/reviews","language":"it","profile_photo_url":"https://lh5.googleusercontent.com/-0GsrUd4FElw/AAAAAAAAAAI/AAAAAAAAADw/ZzgIMWBZF7A/s128-c0x00000000-cc-rp-mo/photo.jpg","rating":5,"relative_time_description":"2 mesi fa","text":"","time":1513009631}],"scope":"GOOGLE","types":["university","point_of_interest","establishment"],"url":"https://maps.google.com/?cid=1199053973575520076","utc_offset":60,"vicinity":"Via Leonardo da Vinci, snc, L''Aquila","website":"https://www.abaq.it/","html_attributions":[],"$$hashKey":"object:2292"}'),
('17ba2c9f-e664-4591-9f09-e82c5179ff4d', 'Universit? degli Studi dell''Aquila - Facolt? di ingegneria', 42.337108, 13.375815800000055, '{"address_components":[{"long_name":"Facolt? di Ingegneria","short_name":"Facolt? di Ingegneria","types":["premise"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["administrative_area_level_3","political"]},{"long_name":"Provincia dell''Aquila","short_name":"AQ","types":["administrative_area_level_2","political"]},{"long_name":"Abruzzo","short_name":"Abruzzo","types":["administrative_area_level_1","political"]},{"long_name":"Italia","short_name":"IT","types":["country","political"]},{"long_name":"67100","short_name":"67100","types":["postal_code"]}],"adr_address":"Facolt? di Ingegneria, <span class=\\"postal-code\\">67100</span> <span class=\\"locality\\">L&#39;Aquila</span> <span class=\\"region\\">AQ</span>, <span class=\\"country-name\\">Italia</span>","formatted_address":"Facolt? di Ingegneria, 67100 L''Aquila AQ, Italia","geometry":{"location":{"lat":42.337108,"lng":13.375815800000055},"viewport":{"south":42.3357898697085,"west":13.374440069708498,"north":42.3384878302915,"east":13.377138030291462}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/geocode-71.png","id":"d63cbbb3681c8cdea301298493b6c0285beb96b9","name":"Facolt? di Ingegneria","place_id":"ChIJrWRMtG7SLxMRA3BNg5cJ9U0","reference":"CmRbAAAAZiJS9zrT5vKpajzhaoOXOO-iJSsKa148-0peyHep44OrQ_YNCWR4fhhdgsJwZ5AFp79CaXcEbhfpviQSpXmJJxalmWus00_agjPYUmhPJUiQ00zRBnK04abTIgPN-0nNEhChydYyWRwpyg-wXJ1sivjyGhQVEz_rrlGoxqFVj6LaTrcg069Kbw","scope":"GOOGLE","types":["premise"],"url":"https://maps.google.com/?q=Facolt%C3%A0+di+Ingegneria&ftid=0x132fd26eb44c64ad:0x4df50997834d7003","utc_offset":60,"html_attributions":[],"numero":0}'),
('321ee38b-5669-4733-ae24-41ec942a8628', 'Paganica', 42.3595833, 13.471105099999932, '{"address_components":[{"long_name":"Paganica","short_name":"Paganica","types":["locality","political"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["administrative_area_level_3","political"]},{"long_name":"Provincia dell''Aquila","short_name":"AQ","types":["administrative_area_level_2","political"]},{"long_name":"Abruzzo","short_name":"Abruzzo","types":["administrative_area_level_1","political"]},{"long_name":"Italia","short_name":"IT","types":["country","political"]},{"long_name":"67100","short_name":"67100","types":["postal_code"]}],"adr_address":"<span class=\\"postal-code\\">67100</span> <span class=\\"locality\\">Paganica</span> <span class=\\"region\\">AQ</span>, <span class=\\"country-name\\">Italia</span>","formatted_address":"67100 Paganica AQ, Italia","geometry":{"location":{"lat":42.3595833,"lng":13.471105099999932},"viewport":{"south":42.3466295,"west":13.460099600000035,"north":42.3685676,"east":13.484441199999992}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/geocode-71.png","id":"115d383bcf248daaa886299ade229e930bfd9a49","name":"Paganica","photos":[{"height":2112,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/114908828085672627921/photos\\">Mauro Burroni</a>"],"width":2816},{"height":1536,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/111973279926697338417/photos\\">Letizia Maiorino</a>"],"width":2560},{"height":3264,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/104712824821425472342/photos\\">Davide Di Girolamo</a>"],"width":2448},{"height":1857,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/105004203776401833581/photos\\">Agostino Luciani</a>"],"width":2693},{"height":3968,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/102071112234828824404/photos\\">simona bartoletti</a>"],"width":2976},{"height":2560,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/111973279926697338417/photos\\">Letizia Maiorino</a>"],"width":1536}],"place_id":"ChIJgV5WCL7ULxMRq4Tf7T4oobg","reference":"CmRbAAAAVBNWUv5P2EAQ00nVxaYkuORUDUvIVMAF730vFCDLFE5e2gfw9sYiFyaIwXzA1dGS81IAk7YIdl-NqLvUgJ0gGHLPGcot-rq2PbfYQdMXvauaDKIv4nvLMgGm7SZKBvqREhB1ZiNIU6Hr13EjGpdjt8pzGhQnkEAIus7vIuBmzJciHZTFA5QWqw","scope":"GOOGLE","types":["locality","political"],"url":"https://maps.google.com/?q=67100+Paganica+AQ,+Italia&ftid=0x132fd4be08565e81:0xb8a1283eeddf84ab","utc_offset":60,"vicinity":"Paganica","html_attributions":[]}'),
('329eaa8b-5669-4733-ae24-41ec942a8628', 'Pettino', 42.37297640000001, 13.360172799999987, '{"address_components":[{"long_name":"Pettino","short_name":"Pettino","types":["neighborhood","political"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["locality","political"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["administrative_area_level_3","political"]},{"long_name":"Provincia dell''Aquila","short_name":"AQ","types":["administrative_area_level_2","political"]},{"long_name":"Abruzzo","short_name":"Abruzzo","types":["administrative_area_level_1","political"]},{"long_name":"Italia","short_name":"IT","types":["country","political"]},{"long_name":"67100","short_name":"67100","types":["postal_code"]}],"adr_address":"Pettino, <span class=\\"postal-code\\">67100</span> <span class=\\"locality\\">L&#39;Aquila</span> <span class=\\"region\\">AQ</span>, <span class=\\"country-name\\">Italia</span>","formatted_address":"Pettino, 67100 L''Aquila AQ, Italia","geometry":{"location":{"lat":42.37297640000001,"lng":13.360172799999987},"viewport":{"south":42.3646006,"west":13.3432818,"north":42.3852397,"east":13.375039000000015}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/geocode-71.png","id":"8ed3d8a7d350f74ca6a09c3e64f7bc2bd4a8eff8","name":"Pettino","photos":[{"height":3153,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/114006928929279591100/photos\\">maria di marco</a>"],"width":2340}],"place_id":"ChIJJ5JR_1vNLxMR_UXCHvRtSr0","reference":"CmRbAAAAqs6L5coShJaEatG9z34QVlgFruFLfSurPfhh3Zt89uNWjS-HG_VXMrvn1KgJb22zBhALRKx9LdMgS8ybhbd5GcoU8kcM6kV9LGuR4BokNNNs4tmenaEQHb_Yt60t1P_NEhCYr--zGmZJdmyOgUvYA1aHGhRHZN9p4ZnCcSg-CyT-RqDdiL3huQ","scope":"GOOGLE","types":["neighborhood","political"],"url":"https://maps.google.com/?q=Pettino,+67100+L%27Aquila+AQ,+Italia&ftid=0x132fcd5bff519227:0xbd4a6df41ec245fd","utc_offset":60,"vicinity":"L''Aquila","html_attributions":[],"$$hashKey":"object:3392"}'),
('329ee31d-5669-4733-ae24-41ec942a8628', 'Viale Croce Rossa', 42.3565723, 13.396451699999943, '{"address_components":[{"long_name":"Viale Croce Rossa","short_name":"Viale Croce Rossa","types":["route"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["locality","political"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["administrative_area_level_3","political"]},{"long_name":"Provincia dell''Aquila","short_name":"AQ","types":["administrative_area_level_2","political"]},{"long_name":"Abruzzo","short_name":"Abruzzo","types":["administrative_area_level_1","political"]},{"long_name":"Italia","short_name":"IT","types":["country","political"]},{"long_name":"67100","short_name":"67100","types":["postal_code"]}],"adr_address":"<span class=\\"street-address\\">Viale Croce Rossa</span>, <span class=\\"postal-code\\">67100</span> <span class=\\"locality\\">L&#39;Aquila</span> <span class=\\"region\\">AQ</span>, <span class=\\"country-name\\">Italia</span>","formatted_address":"Viale Croce Rossa, 67100 L''Aquila AQ, Italia","geometry":{"location":{"lat":42.3565723,"lng":13.396451699999943},"viewport":{"south":42.35503389999996,"west":13.376920700000028,"north":42.35853710000005,"east":13.415490699999964}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/geocode-71.png","id":"2a984fa07cdc4c3209e5e6912030317c0018c0e6","name":"Viale Croce Rossa","reference":"CrQBrwAAAMaULeHeJyatdCjBQw_fXUpSYkYBDJSL-3Fap7d2546Y0coJXqnt7Xe2XWu6E8arXyOmog1gmRAOqziJjkCoI7rOKAif2vNI8bl-lOlp90uwcmRyO5WjWNRNNTqUYoE0eXCKyZPhszpTvuwWtjIAvxqR6O5JiICcyZrFeZebpwakH0eOOjnnYz_rVqw6mlShZXmrqV7JnPVm3AmSIaFry51BddXre1AY8Paxg9j5vf5ZEhCCigCGmCWsOSTIk3ZXEzg8GhQBc3YWSGsiBQU0udA2PUQGEql8Nw","scope":"GOOGLE","types":["route"],"url":"https://maps.google.com/?q=Viale+Croce+Rossa,+67100+L%27Aquila+AQ,+Italia&ftid=0x132fd2fb20941469:0x391f83bd4d144c0","utc_offset":60,"vicinity":"L''Aquila","html_attributions":[],"$$hashKey":"object:3036"}'),
('329ee38b-5119-4733-ae24-41ec942a8628', 'Palestra Verdeaqua', 42.3636729, 13.388501799999972, '{"address_components":[{"long_name":"1","short_name":"1","types":["street_number"]},{"long_name":"Via San Sisto","short_name":"Via S. Sisto","types":["route"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["locality","political"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["administrative_area_level_3","political"]},{"long_name":"Provincia dell''Aquila","short_name":"AQ","types":["administrative_area_level_2","political"]},{"long_name":"Abruzzo","short_name":"Abruzzo","types":["administrative_area_level_1","political"]},{"long_name":"Italia","short_name":"IT","types":["country","political"]},{"long_name":"67100","short_name":"67100","types":["postal_code"]}],"adr_address":"<span class=\\"street-address\\">Via S. Sisto, 1</span>, <span class=\\"postal-code\\">67100</span> <span class=\\"locality\\">L&#39;Aquila</span> <span class=\\"region\\">AQ</span>, <span class=\\"country-name\\">Italia</span>","formatted_address":"Via S. Sisto, 1, 67100 L''Aquila AQ, Italia","formatted_phone_number":"0862 318060","geometry":{"location":{"lat":42.3636729,"lng":13.388501799999972},"viewport":{"south":42.3623736197085,"west":13.387756869708483,"north":42.3650715802915,"east":13.390454830291446}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png","id":"33c240798f2e29ebd016be4a0e6f75e05421d835","international_phone_number":"+39 0862 318060","name":"Verdeaqua Smile Soc. Coop. A R.L.","photos":[{"height":667,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/104857273175168239654/photos\\">Verdeaqua Smile Soc. Coop. A R.L.</a>"],"width":998},{"height":3264,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/108372314005982719912/photos\\">elvi elvi</a>"],"width":2448},{"height":2304,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/117773224537361558291/photos\\">vittorio marzano</a>"],"width":4096},{"height":2560,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/107398102097974954459/photos\\">Emanuela Ianni</a>"],"width":1920},{"height":2448,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/117076293569940348959/photos\\">Klaus Hestkj?r</a>"],"width":3264},{"height":2304,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/117773224537361558291/photos\\">vittorio marzano</a>"],"width":4096},{"height":499,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/104857273175168239654/photos\\">Verdeaqua Smile Soc. Coop. A R.L.</a>"],"width":499},{"height":3264,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/108372314005982719912/photos\\">elvi elvi</a>"],"width":2448},{"height":2976,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/117076293569940348959/photos\\">Klaus Hestkj?r</a>"],"width":3968},{"height":2560,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/107398102097974954459/photos\\">Emanuela Ianni</a>"],"width":1920}],"place_id":"ChIJIWMjsfHSLxMRyWUC-g1dqXg","rating":3.9,"reference":"CmRRAAAAq1Ez29yz08FC0im7x_MwRf-dbY4Zw4l9BhzmS4X0hhSyJLnvl3WXiglZNuGzZvnZnCHFDkAShIfaZap8qvYIUFZHd71Dakf7qkOSQ-cMHHDNbG1ktd6hqJuQ2CjHk7W4EhAnRRQHyo64fnplg8tJe_BNGhSD4Dvdkm1Bca2ydrMSTRA75ii5WA","reviews":[{"author_name":"Pieri Gianluca","author_url":"https://www.google.com/maps/contrib/105489144096332233512/reviews","language":"it","profile_photo_url":"https://lh3.googleusercontent.com/-wfyTq7b0c9E/AAAAAAAAAAI/AAAAAAAAABg/Z5Z2LqxA5X0/s128-c0x00000000-cc-rp-mo-ba2/photo.jpg","rating":4,"relative_time_description":"7 mesi fa","text":"Porto mio figlio in piscina. Bravissimo il suo istruttore Marco. Qualche disguido con i servizi. Bellissimo il bar. Domenico molto professionale.","time":1499091681},{"author_name":"peppe fricano","author_url":"https://www.google.com/maps/contrib/112854963327205851023/reviews","language":"it","profile_photo_url":"https://lh3.googleusercontent.com/-5nWj88_mTKg/AAAAAAAAAAI/AAAAAAAADp0/gsxDjy8y2Wo/s128-c0x00000000-cc-rp-mo-ba3/photo.jpg","rating":3,"relative_time_description":"5 mesi fa","text":"Esperienza limitata al campo da tennis ?. Spesso sporco, rete priva di contrappeso, personale poco presente ","time":1503900399},{"author_name":"giammarco forte","author_url":"https://www.google.com/maps/contrib/110404300509490608762/reviews","language":"it","profile_photo_url":"https://lh4.googleusercontent.com/-MVaJF5oCggs/AAAAAAAAAAI/AAAAAAAAE7I/N6nRORGJaT8/s128-c0x00000000-cc-rp-mo-ba2/photo.jpg","rating":4,"relative_time_description":"9 mesi fa","text":"Buon centro sportivo, grande piscina ma molto affollata, presente palestra e campi da calcio, tennis, volleyball oltre ad una pista di pattinaggio. Purtroppo i prezzi sono molto alti a meno che non si sottoscriva un abbonamento annuale.","time":1495191229},{"author_name":"Bruna Marcantonio","author_url":"https://www.google.com/maps/contrib/115651075025802448432/reviews","language":"it","profile_photo_url":"https://lh6.googleusercontent.com/-3YPXY4w5sJQ/AAAAAAAAAAI/AAAAAAAAAbI/rrqc8jc3Vgw/s128-c0x00000000-cc-rp-mo/photo.jpg","rating":5,"relative_time_description":"3 mesi fa","text":"Mi piace molto, ? un posto accogliente con personale molto qualificato.","time":1511199965},{"author_name":"Silvia D''Orazio","author_url":"https://www.google.com/maps/contrib/108508930206551565519/reviews","language":"it","profile_photo_url":"https://lh5.googleusercontent.com/-Lb1PdEMUaN8/AAAAAAAAAAI/AAAAAAAAKbU/4Xj2jwTPx9Q/s128-c0x00000000-cc-rp-mo-ba3/photo.jpg","rating":5,"relative_time_description":"un mese fa","text":"Ben organizzata e pulita, staff cordiale","time":1515539338}],"scope":"GOOGLE","types":["point_of_interest","establishment"],"url":"https://maps.google.com/?cid=8694582870225872329","utc_offset":60,"vicinity":"Via San Sisto, 1, L''Aquila","website":"http://verdeaqua.org/","html_attributions":[],"$$hashKey":"object:4967"}'),
('329ee38b-5611-4733-ae24-41ec942a8628', 'Sassa', 42.35229419999999, 13.297937300000058, '{"address_components":[{"long_name":"Sassa","short_name":"Sassa","types":["locality","political"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["administrative_area_level_3","political"]},{"long_name":"Provincia dell''Aquila","short_name":"AQ","types":["administrative_area_level_2","political"]},{"long_name":"Abruzzo","short_name":"Abruzzo","types":["administrative_area_level_1","political"]},{"long_name":"Italia","short_name":"IT","types":["country","political"]},{"long_name":"67100","short_name":"67100","types":["postal_code"]}],"adr_address":"<span class=\\"postal-code\\">67100</span> <span class=\\"locality\\">Sassa</span> <span class=\\"region\\">AQ</span>, <span class=\\"country-name\\">Italia</span>","formatted_address":"67100 Sassa AQ, Italia","geometry":{"location":{"lat":42.35229419999999,"lng":13.297937300000058},"viewport":{"south":42.3500313,"west":13.284525799999983,"north":42.3552744,"east":13.307571000000053}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/geocode-71.png","id":"1c58a5283a7a519fbec2b5bc87df14940e2a036d","name":"Sassa","place_id":"ChIJReBmplvMLxMRfFPcnWfSiOY","reference":"CmRbAAAAX66IvRXwZHXLNQ7xeoY4dSjT9COVbiQ2oKqKcXJ8iIV1ELea2U_U9_DwKWKTcYy-25rOAIk6TJQy17zh3s8THVq6gRmH5d-MVDL7pXxi8bG1EdWIm3oLsadqOvfE-FeNEhA62HQwOcXudBGVuqZT4wOEGhTYh7adTL2JFJh1mD0UcSdoYPATbw","scope":"GOOGLE","types":["locality","political"],"url":"https://maps.google.com/?q=67100+Sassa+AQ,+Italia&ftid=0x132fcc5ba666e045:0xe688d2679ddc537c","utc_offset":60,"vicinity":"Sassa","html_attributions":[]}'),
('329ee38b-5661-4733-ae24-41ec942a8628', 'Universit? Degli Studi di L''Aquila - Facolt? di Economia', 42.35377509999999, 13.412332600000013, '{"address_components":[{"long_name":"Via Giuseppe Mezzanotte","short_name":"Via Giuseppe Mezzanotte","types":["route"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["locality","political"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["administrative_area_level_3","political"]},{"long_name":"Provincia dell''Aquila","short_name":"AQ","types":["administrative_area_level_2","political"]},{"long_name":"Abruzzo","short_name":"Abruzzo","types":["administrative_area_level_1","political"]},{"long_name":"Italia","short_name":"IT","types":["country","political"]},{"long_name":"67100","short_name":"67100","types":["postal_code"]}],"adr_address":"<span class=\\"street-address\\">Via Giuseppe Mezzanotte</span>, <span class=\\"postal-code\\">67100</span> <span class=\\"locality\\">L&#39;Aquila</span> <span class=\\"region\\">AQ</span>, <span class=\\"country-name\\">Italia</span>","formatted_address":"Via Giuseppe Mezzanotte, 67100 L''Aquila AQ, Italia","formatted_phone_number":"0862 434838","geometry":{"location":{"lat":42.35377509999999,"lng":13.412332600000013},"viewport":{"south":42.3520904197085,"west":13.41139421970854,"north":42.3547883802915,"east":13.414092180291505}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/school-71.png","id":"b94f13a66380c32799d9d5c01e0f7e5e00c23e25","international_phone_number":"+39 0862 434838","name":"Universit? Degli Studi di L''Aquila - Facolt? di Economia","photos":[{"height":587,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/110834208529969261065/photos\\">M. G.</a>"],"width":880},{"height":260,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/110834208529969261065/photos\\">M. G.</a>"],"width":340}],"place_id":"ChIJ_-XA_QTTLxMRYfcMiP56mew","rating":5,"reference":"CmRSAAAAQNeFhkxxHeNVezhUCRbYpCC8Ecku0-TGjOGUNgQNNqkPrm2a7HhBdT19Ve6SUpazWNHXlF3GU4EIGlixkCWBCDWlm1alCzDrLI1eucZ8MOyGfcy6rJyU-IZ1cJUwr8Y7EhBpMcO_xTlvCHjc_LhUQOIOGhRTPIkJGX1ArRLUUUscVXJXfeErFw","reviews":[{"author_name":"M. G.","author_url":"https://www.google.com/maps/contrib/110834208529969261065/reviews","language":"it","profile_photo_url":"https://lh3.googleusercontent.com/-mHFB-g5aoqo/AAAAAAAAAAI/AAAAAAAACYc/IZGbitZ5fMw/s128-c0x00000000-cc-rp-mo-ba5/photo.jpg","rating":5,"relative_time_description":"un anno fa","text":"","time":1479551530}],"scope":"GOOGLE","types":["university","point_of_interest","establishment"],"url":"https://maps.google.com/?cid=17048793098010556257","utc_offset":60,"vicinity":"Via Giuseppe Mezzanotte, L''Aquila","website":"http://www.ec.univaq.it/","html_attributions":[],"$$hashKey":"object:2330"}'),
('329ee38b-5669-4733-ae24-41ec942a8621', 'Terminal Collemaggio', 42.3444635, 13.401298300000008, '{"address_components":[{"long_name":"Via Giacomo Caldora","short_name":"Via Giacomo Caldora","types":["route"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["locality","political"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["administrative_area_level_3","political"]},{"long_name":"Provincia dell''Aquila","short_name":"AQ","types":["administrative_area_level_2","political"]},{"long_name":"Abruzzo","short_name":"Abruzzo","types":["administrative_area_level_1","political"]},{"long_name":"Italia","short_name":"IT","types":["country","political"]},{"long_name":"67100","short_name":"67100","types":["postal_code"]}],"adr_address":"<span class=\\"street-address\\">Via Giacomo Caldora</span>, <span class=\\"postal-code\\">67100</span> <span class=\\"locality\\">L&#39;Aquila</span> <span class=\\"region\\">AQ</span>, <span class=\\"country-name\\">Italia</span>","formatted_address":"Via Giacomo Caldora, 67100 L''Aquila AQ, Italia","geometry":{"location":{"lat":42.3444635,"lng":13.401298300000008},"viewport":{"south":42.3431145197085,"west":13.399949319708526,"north":42.34581248029149,"east":13.40264728029149}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png","id":"eb3766d24868f53068eb9b97f2e1f2216bc3ee1e","name":"Terminal Bus - Collemaggio","photos":[{"height":3120,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/116105595268944403392/photos\\">Mos? Giordano</a>"],"width":4160},{"height":2336,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/106937598684553346660/photos\\">Michele Giuliani</a>"],"width":4160},{"height":3000,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/105063288073103609516/photos\\">Marc Di Bartolomeo</a>"],"width":4000},{"height":4032,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/116169339120357688540/photos\\">Da un utente Google</a>"],"width":3024},{"height":1836,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/103166519501701008285/photos\\">Sonia Allie</a>"],"width":3264},{"height":3120,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/102024784465841403454/photos\\">Valentina Salanitri</a>"],"width":4160},{"height":1836,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/103777472434117493309/photos\\">Pablo Saul</a>"],"width":3264},{"height":3120,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/116105595268944403392/photos\\">Mos? Giordano</a>"],"width":4160},{"height":640,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/110834208529969261065/photos\\">M. G.</a>"],"width":480},{"height":1080,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/113996062192714103508/photos\\">Federico D&#39;Andrea</a>"],"width":1920}],"place_id":"ChIJ0ccDKlXSLxMRd_5i8xIGQUM","rating":3.2,"reference":"CmRRAAAA-mfx2uc8Xya4a1VYKIg30TfKF1uMS9dEJcH_UvnV5blmsSXUNreql6Pc81EhylR-_16A3eyQ3DzfHd63LmQ9tVyk9O2OrbSkThMGS8WIFDuXTdbg6PLG54Mrg5FKOMKyEhChI6HqZmF6SqaBBqc5lb2eGhTYEaD8E7KxhLbZg69k6huiZOwiNA","reviews":[{"author_name":"fosca fosca dinatale","author_url":"https://www.google.com/maps/contrib/116006398652273767566/reviews","language":"it","profile_photo_url":"https://lh6.googleusercontent.com/-HifIU57otrg/AAAAAAAAAAI/AAAAAAAAAAA/ACSILjVP5mrdwKlSxlfayQUCrgCHqn2A3g/s128-c0x00000000-cc-rp-mo-ba3/photo.jpg","rating":5,"relative_time_description":"3 mesi fa","text":"comodo per prendere autobus che vanno in tutto l''abruzzo e anche in localita del lazio come Roma. dispone di collegamento urbano della citta di L''Aquila e di ampio parcheggio sotterraneo a pagamento ma facilmente raggiungibile. All''interno abbiamo ascensori e scale per scendere ai piani inferiori e nel piano terra invece abbiamo servizi igienici, un bar dove poter fare colazione o mangiare qualcosa al volo e la biglietteria per i mezzi urbani. Invece al piano inferiore abbiamo servizi igienici e la biglietteria per il servizio extraurbano.","time":1510690150},{"author_name":"Sabrina","author_url":"https://www.google.com/maps/contrib/102774013744612298466/reviews","language":"it","profile_photo_url":"https://lh3.googleusercontent.com/-VjI6Qqp79tk/AAAAAAAAAAI/AAAAAAAAAB8/vJzF0tiieRM/s128-c0x00000000-cc-rp-mo-ba5/photo.jpg","rating":2,"relative_time_description":"3 mesi fa","text":"Pochi posti a sedere, spazi ristretti per chi attende il bus davanti all?entrata del terminal e fetore nauseabondo a causa di chi fuma sia all?esterno che, addirittura, all?interno dell?edificio, con buona pace dei non fumatori che, essendo costretti ad attendere l?autobus su un marciapiede spesso affollatissimo, non possono far altro che trattenere il respiro e sperare che il bus arrivi in orario. L?area non ? delle migliori e credo non sia un buon biglietto da visita per un capoluogo di regione. L?Aquila merita di pi?. Guardando il lato positivo, gli autobus sono quasi sempre puntuali.","time":1508952169},{"author_name":"Ercole Manieri","author_url":"https://www.google.com/maps/contrib/111995989351243358919/reviews","language":"it","profile_photo_url":"https://lh5.googleusercontent.com/-4qhqh0dEpuA/AAAAAAAAAAI/AAAAAAAACgg/WAw0HsOihWo/s128-c0x00000000-cc-rp-mo-ba4/photo.jpg","rating":2,"relative_time_description":"una settimana fa","text":"Le sale d''attesa sono sempre chiuse e il lungo collegamento tramite scale mobili con Piazza Duomo ? possibile solo con scale .... immobili","time":1518514533},{"author_name":"Davide Di Battista","author_url":"https://www.google.com/maps/contrib/102801515774087988208/reviews","language":"it","profile_photo_url":"https://lh4.googleusercontent.com/-H6vj6A-aLiA/AAAAAAAAAAI/AAAAAAAAAAA/ACSILjXRZiFhMdBTenpNT7pPl-ux335sQg/s128-c0x00000000-cc-rp-mo-ba5/photo.jpg","rating":4,"relative_time_description":"2 mesi fa","text":"Luogo di scalo di tutti gli autobus da e per l''aquila da tutta la regione e Roma. Punto di riferimento anche per autobus urbani. C''? un bar e biglietteria sempre aperta. Funzionale.","time":1512811431},{"author_name":"Salvatore Nicastro","author_url":"https://www.google.com/maps/contrib/110206818703240564399/reviews","language":"it","profile_photo_url":"https://lh4.googleusercontent.com/-yerYywgCK4c/AAAAAAAAAAI/AAAAAAAAAAA/ACSILjVbJ5dWbZZ3EZtRLjeAyf_bfbxRUQ/s128-c0x00000000-cc-rp-mo/photo.jpg","rating":4,"relative_time_description":"un mese fa","text":"Abbastanza comodo. Personale biglietteria esperto e disponibile. Bar di ottimo livello con bravi professionisti della ristorazione.","time":1516477256}],"scope":"GOOGLE","types":["travel_agency","point_of_interest","establishment"],"url":"https://maps.google.com/?cid=4846161352489893495","utc_offset":60,"vicinity":"Via Giacomo Caldora, L''Aquila","website":"http://www.ama.laquila.it/","html_attributions":[]}'),
('329ee38b-5669-4733-ae24-41ec942a8622', 'Fontana luminosa', 42.3538387, 13.401329400000009, '{"address_components":[{"long_name":"Piazza Battaglione degli Alpini","short_name":"Piazza Battaglione degli Alpini","types":["route"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["locality","political"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["administrative_area_level_3","political"]},{"long_name":"Provincia dell''Aquila","short_name":"AQ","types":["administrative_area_level_2","political"]},{"long_name":"Abruzzo","short_name":"Abruzzo","types":["administrative_area_level_1","political"]},{"long_name":"Italia","short_name":"IT","types":["country","political"]},{"long_name":"67100","short_name":"67100","types":["postal_code"]}],"adr_address":"<span class=\\"street-address\\">Piazza Battaglione degli Alpini</span>, <span class=\\"postal-code\\">67100</span> <span class=\\"locality\\">L&#39;Aquila</span> <span class=\\"region\\">AQ</span>, <span class=\\"country-name\\">Italia</span>","formatted_address":"Piazza Battaglione degli Alpini, 67100 L''Aquila AQ, Italia","geometry":{"location":{"lat":42.3538387,"lng":13.401329400000009},"viewport":{"south":42.3524379197085,"west":13.399977719708431,"north":42.3551358802915,"east":13.402675680291509}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/generic_recreational-71.png","id":"270d5ce2358b387457b68392a53d82b562b5f1c5","name":"Fontana Luminosa","opening_hours":{"open_now":true,"periods":[{"open":{"day":0,"time":"0000","hours":0,"minutes":0,"nextDate":1519513200000}}],"weekday_text":["luned?: Aperto 24 ore su 24","marted?: Aperto 24 ore su 24","mercoled?: Aperto 24 ore su 24","gioved?: Aperto 24 ore su 24","venerd?: Aperto 24 ore su 24","sabato: Aperto 24 ore su 24","domenica: Aperto 24 ore su 24"]},"photos":[{"height":3072,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/101561347957162213693/photos\\">Rosario Nogu</a>"],"width":4096},{"height":2944,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/105810226075969928998/photos\\">Maurizio Amici</a>"],"width":3216},{"height":1836,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/104720330800355726084/photos\\">Carlo 68</a>"],"width":3264},{"height":2340,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/117469416498603260898/photos\\">Fabrizio Colagrande</a>"],"width":4160},{"height":2448,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/116602279007542912048/photos\\">Luca Cappuccitti</a>"],"width":3264},{"height":1152,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/104190806736280657998/photos\\">centro estetico madre natura</a>"],"width":1152},{"height":4640,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/109796910153184679187/photos\\">Ferdinando Agrippino</a>"],"width":3480},{"height":3120,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/113868446357019492849/photos\\">clara italiano</a>"],"width":4160},{"height":3120,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/109852927118149437174/photos\\">Luigi Basso</a>"],"width":4160},{"height":1728,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/108827743073900044673/photos\\">Giorgio De Marzi</a>"],"width":2880}],"place_id":"ChIJtRCwR_zSLxMREOJGQ-6Qd-I","rating":4.5,"reference":"CmRSAAAAoHhWSu-jUD68RF5bPMX91hGEqjTwcdV-AdUrWxoSbukxVbkT48BfaC2UXNAEPSEeFMpMilJ4B4qeokP1A99LW9jlcg3swhRaeRcyeRYFvcYe_jCrA5SYWbI_bQ3aYu85EhA8dPiizoC6M4V_xalXXwcGGhQZvtIRlcQil66q0ApVzXpc3ACvog","reviews":[{"author_name":"Alessandra D''antonio","author_url":"https://www.google.com/maps/contrib/108928883218619269528/reviews","language":"it","profile_photo_url":"https://lh3.googleusercontent.com/-uAjYfzqGkuQ/AAAAAAAAAAI/AAAAAAAAAAA/ACSILjWTZryR-QAFfkTlBt1Q4OwX7-4cow/s128-c0x00000000-cc-rp-mo-ba4/photo.jpg","rating":5,"relative_time_description":"2 mesi fa","text":"Rappresenta uno dei luoghi simbolo della citt? de L''Aquila. Finalmente ? stata restaurata e restituita ai suoi,ancora pochi,cittadini tornati a vivere nel centro storico. \\nDa sempre ha rappresentato un punto di incontro di residenti e non.\\nMeritevole opera","time":1512503926},{"author_name":"Diane Del Carpio","author_url":"https://www.google.com/maps/contrib/114368360598145192855/reviews","language":"it","profile_photo_url":"https://lh5.googleusercontent.com/-yNt_LDoFN3M/AAAAAAAAAAI/AAAAAAAABUc/WfXAFmV6yoM/s128-c0x00000000-cc-rp-mo/photo.jpg","rating":3,"relative_time_description":"nell''ultima settimana","text":"Una bella fontana;\\npeccato che per? dopo 9 anni dalla disgrazia, mancano dei bravi dottori che operino il grande danno che subito la nostra bella L''Aquila, ricca di cultura ed un tempo molto ricca ancora. \\nSe ne sono andati tutti.","time":1519008574},{"author_name":"Tiziana mezza","author_url":"https://www.google.com/maps/contrib/112102040834269815545/reviews","language":"it","profile_photo_url":"https://lh4.googleusercontent.com/-5PPo-DB3YlM/AAAAAAAAAAI/AAAAAAAAABU/cJ49299T7B4/s128-c0x00000000-cc-rp-mo-ba5/photo.jpg","rating":4,"relative_time_description":"un mese fa","text":"La fontana ? stata finalmente restaurata dopo il terremoto che ha colpito duramente L''Aquila. Da vedere soprattutto la sera coi giochi di luce che cambiano di colore e rendono un effetto suggestivo.","time":1516378315},{"author_name":"Federica Marinelli","author_url":"https://www.google.com/maps/contrib/100417871163571549913/reviews","language":"it","profile_photo_url":"https://lh3.googleusercontent.com/-7tP9uJkWfNg/AAAAAAAAAAI/AAAAAAAAByI/tz8fpBtWn9E/s128-c0x00000000-cc-rp-mo/photo.jpg","rating":4,"relative_time_description":"3 settimane fa","text":"La fontana luminosa ? bellissima, ormai diventata un fattore di orientamento. \\nCon il ghiaccio ? ancora pi? bella","time":1517292351},{"author_name":"Federica Cucci","author_url":"https://www.google.com/maps/contrib/106778512188632712584/reviews","language":"it","profile_photo_url":"https://lh4.googleusercontent.com/-NbOGngp-iEA/AAAAAAAAAAI/AAAAAAAAACE/hQyzJPcgz34/s128-c0x00000000-cc-rp-mo/photo.jpg","rating":5,"relative_time_description":"2 settimane fa","text":"Con il Gran Sasso innevato sullo sfondo o ghiacciata e colorata di notte, ? sempre il simbolo di L Aquila","time":1517616662}],"scope":"GOOGLE","types":["park","point_of_interest","establishment"],"url":"https://maps.google.com/?cid=16318671127805616656","utc_offset":60,"vicinity":"Piazza Battaglione degli Alpini, L''Aquila","html_attributions":[]}'),
('329ee38b-5669-4743-ae24-41ec942a8628', 'Coppito', 42.3667592, 13.33587030000001, '{"address_components":[{"long_name":"Coppito","short_name":"Coppito","types":["locality","political"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["administrative_area_level_3","political"]},{"long_name":"Provincia dell''Aquila","short_name":"AQ","types":["administrative_area_level_2","political"]},{"long_name":"Abruzzo","short_name":"Abruzzo","types":["administrative_area_level_1","political"]},{"long_name":"Italia","short_name":"IT","types":["country","political"]},{"long_name":"67100","short_name":"67100","types":["postal_code"]}],"adr_address":"<span class=\\"postal-code\\">67100</span> <span class=\\"locality\\">Coppito</span> <span class=\\"region\\">AQ</span>, <span class=\\"country-name\\">Italia</span>","formatted_address":"67100 Coppito AQ, Italia","geometry":{"location":{"lat":42.3667592,"lng":13.33587030000001},"viewport":{"south":42.3588831,"west":13.325772499999971,"north":42.381936,"east":13.355924100000038}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/geocode-71.png","id":"33694182a49aa8e3c4cdb9d2ac083d101f3c7194","name":"Coppito","place_id":"ChIJh2WT72vNLxMReXqdhy_JHm8","reference":"CmRbAAAAzWCy4teHQptPHxFSjcF0uZ6g8nCavD9-rIfIJ03-2wUPfcXLkNHjbJnyTVh30Jv9Nzr8OsSR6xqTwYLP5YVh-y6pAvrCLpSRopc_7_NupscJ1cUcwM0Nvirwq5MeCn2vEhC881rKpKuV4gQ2xa29HsSCGhSJ4D190PAZIXu0wJLcQLKyFL_vRQ","scope":"GOOGLE","types":["locality","political"],"url":"https://maps.google.com/?q=67100+Coppito+AQ,+Italia&ftid=0x132fcd6bef936587:0x6f1ec92f879d7a79","utc_offset":60,"vicinity":"Coppito","html_attributions":[],"$$hashKey":"object:1691"}'),
('329ee38b-5669-47r3-ae24-41ec942a8628', 'Torrione', 42.3595726, 13.410533600000008, '{"address_components":[{"long_name":"Torrione","short_name":"Torrione","types":["neighborhood","political"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["locality","political"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["administrative_area_level_3","political"]},{"long_name":"Provincia dell''Aquila","short_name":"AQ","types":["administrative_area_level_2","political"]},{"long_name":"Abruzzo","short_name":"Abruzzo","types":["administrative_area_level_1","political"]},{"long_name":"Italia","short_name":"IT","types":["country","political"]},{"long_name":"67100","short_name":"67100","types":["postal_code"]}],"adr_address":"Torrione, <span class=\\"postal-code\\">67100</span> <span class=\\"locality\\">L&#39;Aquila</span> <span class=\\"region\\">AQ</span>, <span class=\\"country-name\\">Italia</span>","formatted_address":"Torrione, 67100 L''Aquila AQ, Italia","geometry":{"location":{"lat":42.3595726,"lng":13.410533600000008},"viewport":{"south":42.3535269,"west":13.404525899999953,"north":42.3638394,"east":13.41538449999996}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/geocode-71.png","id":"0f56d9ef73bed933eaaf2e124447d06a7eb63a2c","name":"Torrione","place_id":"ChIJNfbmZhzTLxMR3LuHBK0cLO4","reference":"CmRbAAAA5CJ4JqOT8PIet9zMkuDRf0NbuBVa-pQqqD9f2SG_cdRfwXO-uVU20gnuOh1r1shtu9tlrYcBVigjpAfiYuOqyzQ4hru92M7JPs3e2qDYtzijJ-aMTf0lttkiHmuLupDdEhCpAxmPZX8M1_1GjPdQzqGPGhRmwVZO8gDZ3Dtdu98hmlIsdKrMdQ","scope":"GOOGLE","types":["neighborhood","political"],"url":"https://maps.google.com/?q=Torrione,+67100+L%27Aquila+AQ,+Italia&ftid=0x132fd31c66e6f635:0xee2c1cad0487bbdc","utc_offset":60,"vicinity":"L''Aquila","html_attributions":[],"$$hashKey":"object:3069"}');
INSERT INTO `posizione` (`id`, `nome`, `lat`, `lng`, `address_components`) VALUES
('329re38b-5669-4733-ae24-41ec942a8628', 'Hotel Amiternum', 42.3606028, 13.377170299999989, '{"address_components":[{"long_name":"Strada Statale 17 Est","short_name":"Strada Statale 17 Est","types":["route"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["locality","political"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["administrative_area_level_3","political"]},{"long_name":"Provincia dell''Aquila","short_name":"AQ","types":["administrative_area_level_2","political"]},{"long_name":"Abruzzo","short_name":"Abruzzo","types":["administrative_area_level_1","political"]},{"long_name":"Italia","short_name":"IT","types":["country","political"]},{"long_name":"67100","short_name":"67100","types":["postal_code"]}],"adr_address":"<span class=\\"street-address\\">Strada Statale 17 Est</span>, <span class=\\"postal-code\\">67100</span> <span class=\\"locality\\">L&#39;Aquila</span> <span class=\\"region\\">AQ</span>, <span class=\\"country-name\\">Italia</span>","formatted_address":"Strada Statale 17 Est, 67100 L''Aquila AQ, Italia","formatted_phone_number":"0862 315757","geometry":{"location":{"lat":42.3606028,"lng":13.377170299999989},"viewport":{"south":42.3592538197085,"west":13.375821319708507,"north":42.36195178029149,"east":13.37851928029147}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/lodging-71.png","id":"2f09a168e1f794d49fcf04a5c301c430e3f649de","international_phone_number":"+39 0862 315757","name":"Hotel Amiternum","opening_hours":{"open_now":true,"periods":[{"open":{"day":0,"time":"0000","hours":0,"minutes":0,"nextDate":1519513200000}}],"weekday_text":["luned?: Aperto 24 ore su 24","marted?: Aperto 24 ore su 24","mercoled?: Aperto 24 ore su 24","gioved?: Aperto 24 ore su 24","venerd?: Aperto 24 ore su 24","sabato: Aperto 24 ore su 24","domenica: Aperto 24 ore su 24"]},"photos":[{"height":3984,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/107110868982862171069/photos\\">Emanuel Andrews</a>"],"width":2988},{"height":2304,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/100201374925546725456/photos\\">Bartolo De trizio</a>"],"width":4096},{"height":2992,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/112080926328375006619/photos\\">Achille D&#39;Onofrio</a>"],"width":3988},{"height":639,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/100087446920544905005/photos\\">Hotel Amiternum</a>"],"width":639},{"height":1836,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/107437332580477960819/photos\\">dominique xy</a>"],"width":3264},{"height":4160,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/103187434306474129327/photos\\">Giovanni Cristallini</a>"],"width":3120},{"height":2340,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/110146738036483723985/photos\\">Abdoulie Badjie</a>"],"width":4160},{"height":2336,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/110816265410059998647/photos\\">Talha Malik</a>"],"width":4160},{"height":1920,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/115180619433662469260/photos\\">Marco Brennero</a>"],"width":2560},{"height":1080,"html_attributions":["<a href=\\"https://maps.google.com/maps/contrib/117469416498603260898/photos\\">Fabrizio Colagrande</a>"],"width":1920}],"place_id":"ChIJPRqW_6p2LBMRLUI0_gjtZWY","rating":3.7,"reference":"CmRRAAAAXiJdZSjILZLxrhRLJ7IHIDV7Biir3QzGD2PP-5ufJ2lAaXErnMyktehPAUnOxW0-ncYHs4W3vd3xL14ReIApORo71YaGGfCPICWc36YRV-Z9etXjN9EAqEhWWic5nMbfEhA4GfZdptXw3tCA3XTHDe9pGhRBcvASoRhTlfetD26gSaMR14tzgQ","reviews":[{"author_name":"Fulvia Bergamo","author_url":"https://www.google.com/maps/contrib/101807246058332938298/reviews","language":"it","profile_photo_url":"https://lh5.googleusercontent.com/--Avslpcp0sQ/AAAAAAAAAAI/AAAAAAAADFc/tyfBmbKg8sQ/s128-c0x00000000-cc-rp-mo-ba2/photo.jpg","rating":3,"relative_time_description":"nell''ultima settimana","text":"L''albergo ? situato in una posizione strategica, vicino all''autostrada e proprio davanti si ferma la maggior parte degli autobus da e per L''Aquila. \\nIl personale gentile e informale.\\nLa struttura e le camere sono pulite e silenziose ma molto antiquate.\\nI cuscini sottili e molto scomodi non mi hanno permesso di trascorrere una buona nottata. Inoltre era prevista la colazione ma nella camera era presente un bollitore elettrico con dentro dell''acqua chiaramente sporca che chiss? da quanto si trovava l? e delle bustine di t? o caff? solubile.\\nFortunatamente c''? un bar al piano terra.\\n\\nComodo, ma non da consigliare.","time":1519250810},{"author_name":"SKUBLA DD","author_url":"https://www.google.com/maps/contrib/103615265150935883096/reviews","language":"it","profile_photo_url":"https://lh6.googleusercontent.com/-fcO5QJ06ALs/AAAAAAAAAAI/AAAAAAAAAGg/KbaRF_FcbyI/s128-c0x00000000-cc-rp-mo/photo.jpg","rating":3,"relative_time_description":"una settimana fa","text":"Ottima la posizione, sicuramente strategica ed ? il motivo delle mie visite. Una cosa che non sopporto invece ? che il personale: si prende troppe confidenze con chi ha di fronte peccando di poca professionalit?. Almeno per mia esperienza","time":1518379737},{"author_name":"Giovanni Serafini","author_url":"https://www.google.com/maps/contrib/105184335359052362530/reviews","language":"it","profile_photo_url":"https://lh3.googleusercontent.com/-MpwdCwPnl4U/AAAAAAAAAAI/AAAAAAAAL1k/9oT2H9bsm30/s128-c0x00000000-cc-rp-mo-ba4/photo.jpg","rating":4,"relative_time_description":"un mese fa","text":"Non ho provato l''hotel in s?. ? da sempre un nodo importante nella mobilit? aquilana, essendo fermata di tantissimi autobus TUA, FlixBux, Gaspari e cos? via. Ha un classico bar al piano terra, dove si vendono anche biglietti urbani e interurbani dell''AMA.","time":1515691928},{"author_name":"luca agostino","author_url":"https://www.google.com/maps/contrib/112342999102530410345/reviews","language":"it","profile_photo_url":"https://lh5.googleusercontent.com/-pUFRJJvAkTQ/AAAAAAAAAAI/AAAAAAAAMMw/C3f_e19ACjM/s128-c0x00000000-cc-rp-mo-ba3/photo.jpg","rating":3,"relative_time_description":"una settimana fa","text":"Situato vicino l''uscita autostradale, con di fronte una pompa di benzina e una delle fermate per autobus principali di l''aquila offre servizo bar frequentatissimo da studenti e persone in attesa di autobus, ricco di servizi telematici e possibilit? di acquistare biglietti per autobus. L''hotel ? ottimo per i meeting o per chi deve trascorrere qualche giorno nel capoluogo abruzzese.","time":1518422617},{"author_name":"Alessandra Cionni","author_url":"https://www.google.com/maps/contrib/116041652442255266538/reviews","language":"it","profile_photo_url":"https://lh5.googleusercontent.com/-SULo8C5Jyg4/AAAAAAAAAAI/AAAAAAAAAAA/ACSILjUjgtAuzWSAADA451fmGjyjtRO23w/s128-c0x00000000-cc-rp-mo/photo.jpg","rating":2,"relative_time_description":"3 mesi fa","text":"Non posso giudicare le camere, perch? ho preso solo un aperitivo al bar. La mia quindi sar? una recensione necessariamente parziale. L''hotel si trova in una posizione cruciale per la citt?, perch? ? posto all''incrocio delle SS 17 e 80 che entrano ed escono da L''Aquila; ricopre un ruolo importante soprattutto per i passeggeri delle numerose compagnie di pullman che transitano di l?. La struttura appare leggermente triste, ha un''aria malinconica da vecchio motel. (Ripeto, ? un''impressione esterna). Il bar appare datato e piuttosto trascurato, con poca scelta per la colazione. In compenso il personale da me incontrato si ? comportato in maniera corretta.","time":1510938272}],"scope":"GOOGLE","types":["bar","lodging","point_of_interest","establishment"],"url":"https://maps.google.com/?cid=7378564187396784685","utc_offset":60,"vicinity":"Strada Statale 17 Est, L''Aquila","website":"http://www.hotelamiternum.it/","html_attributions":[],"$$hashKey":"object:2344"}'),
('6204acaa-1954-40c4-8688-b21d561d5f08', 'Universit? degli Studi dell''Aquila - Dipartimento di Ingegneria e Scienze dell''Informazione e Matematica', 42.3676166, 13.35044419999997, '{"address_components":[{"long_name":"Via Vetoio","short_name":"Via Vetoio","types":["route"]},{"long_name":"Coppito","short_name":"Coppito","types":["locality","political"]},{"long_name":"L''Aquila","short_name":"L''Aquila","types":["administrative_area_level_3","political"]},{"long_name":"Provincia dell''Aquila","short_name":"AQ","types":["administrative_area_level_2","political"]},{"long_name":"Abruzzo","short_name":"Abruzzo","types":["administrative_area_level_1","political"]},{"long_name":"Italia","short_name":"IT","types":["country","political"]},{"long_name":"67100","short_name":"67100","types":["postal_code"]}],"adr_address":"<span class=\\"street-address\\">Via Vetoio</span>, <span class=\\"postal-code\\">67100</span> <span class=\\"locality\\">Coppito</span> <span class=\\"region\\">AQ</span>, <span class=\\"country-name\\">Italia</span>","formatted_address":"Via Vetoio, 67100 Coppito AQ, Italia","geometry":{"location":{"lat":42.3676166,"lng":13.35044419999997},"viewport":{"south":42.3662676197085,"west":13.349095219708488,"north":42.36896558029149,"east":13.351793180291452}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/geocode-71.png","id":"a080e0eaea1f6605e5c9f64ad1862694bedbde39","name":"Via Vetoio","place_id":"EiRWaWEgVmV0b2lvLCA2NzEwMCBDb3BwaXRvIEFRLCBJdGFsaWE","reference":"CpQBgQAAAJDjniL49Gn3NEmad0G-p-uyZu8XyfmLvRIlyqKCrx4JLCuTMrnCqbOpFgHBudPZM3T_Fj2p8MN9fQsxD9al6R1buwl0D--vzOPhM7fhLjV8Wt2tl720R1VX9KLfLtx18YBe0xbLR2L2NxjibALb6pA0DgECLLJNbK8JzlHf3ER9mLJ5t2wXVPuSYGxasTcOBxIQ4sMJRX-pzdM6PvVazNI8XBoUKkJ5XuIcwl8uufFSzvaVgG7bFj0","scope":"GOOGLE","types":["route"],"url":"https://maps.google.com/?q=Via+Vetoio,+67100+Coppito+AQ,+Italia&ftid=0x132fcd66aec68ee1:0x980e7fe3023e6e6a","utc_offset":60,"vicinity":"Coppito","html_attributions":[],"numero":2}');

-- --------------------------------------------------------

--
-- Struttura della tabella `posizione_autobus`
--

CREATE TABLE `posizione_autobus` (
  `id` int(11) NOT NULL,
  `nome` varchar(256) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `premise` varchar(256) DEFAULT NULL,
  `locality` varchar(256) DEFAULT NULL,
  `aal1` varchar(256) DEFAULT NULL,
  `aal2` varchar(256) DEFAULT NULL,
  `aal3` varchar(256) DEFAULT NULL,
  `country` varchar(256) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lon` double DEFAULT NULL,
  `formatted_address` varchar(256) DEFAULT NULL,
  `place_id` varchar(256) DEFAULT NULL,
  `data` datetime DEFAULT '1999-12-31 02:00:00',
  `error_type` varchar(256) NOT NULL DEFAULT 'OK',
  `nome_fermata` varchar(256) DEFAULT NULL,
  `storico_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `posizione_autobus`
--

INSERT INTO `posizione_autobus` (`id`, `nome`, `route`, `premise`, `locality`, `aal1`, `aal2`, `aal3`, `country`, `lat`, `lon`, `formatted_address`, `place_id`, `data`, `error_type`, `nome_fermata`, `storico_fk`) VALUES
(1701, 'via della Comunit? Europea', 'Via della Comunit? Europea', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3683017, 13.3634003, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(2780, 'via Cencioni', 'Via Amleto Cencioni', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3497492, 13.4112062, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(3792, 'via Volta', 'Via Alessandro Volta', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3599081, 13.4101257, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(6772, 'via Saragat', 'Via Onorevole Giuseppe Saragat', NULL, 'Nucleo Industriale Pile', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3511561, 13.3443113, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(10119, 'via strinella', 'Via Strinella', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3507231, 13.4064267, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(10991, 'viale Corrado IV', 'Viale Corrado IV', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.35786710000001, 13.3846977, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(12375, 'bazzano', NULL, NULL, 'Bazzano', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.33685730000001, 13.4535251, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(13032, 'Roio Colle', NULL, NULL, 'Colle di Roio', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.34195649999999, 13.3489823, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(13046, 'S.S. 17 est bivio Onna', NULL, NULL, 'L%27Aquila', NULL, 'Provincia dell%27Aquila', NULL, 'Italy', 42.331591, 13.477729, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(15353, 'Hotel Amiternum', 'Strada Statale 17', NULL, 'L%27Aquila', NULL, 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.36054499999999, 13.377571, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(18782, 'Universit? Reis', 'Via Giovanni di Vincenzo', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.356751, 13.382894, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(19793, 'Terminalbus', 'Via Giacomo Caldora', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3444635, 13.4012983, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(30949, 'viale Croce Rossa', 'Viale Croce Rossa', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3565723, 13.3964517, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(30960, 'Preturo', NULL, NULL, 'Preturo', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3780379, 13.2963207, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(31159, 'S.S.80', 'SS80', NULL, NULL, 'Abruzzo', NULL, NULL, 'Italy', 42.577848, 13.6249543, NULL, NULL, '1999-12-31 02:00:00', '3', NULL, 854953),
(32714, 'via Beato Cesidio', 'Via del Beato Cesidio', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.35943839999999, 13.3865591, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(34130, 'Roio Piano', NULL, NULL, 'Roio Piano', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.327887, 13.3580068, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(36073, 'via Oberdan', 'Via Oberdan', NULL, 'Paganica', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.36097849999999, 13.4716933, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(36136, 'via%20alexander%20fleming', 'Via Alexander Fleming', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3843696, 13.3429775, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(41991, 'Paganica piazza', 'Via L%27Aquila', NULL, 'Paganica', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.365497, 13.4563489, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(44152, 'via della crocetta', 'Via della Crocetta', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3457543, 13.4104778, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(44991, 'S.S. 17 est', 'Viadotto San S.N.17', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3589284, 13.3619839, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(51887, 'Cimitero', 'Via del Cimitero', NULL, 'Aragno', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3949019, 13.4576734, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(53386, 'Pagliare di Sassa', NULL, NULL, 'Pagliare', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3524412, 13.3121316, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(54715, 'contrada Bernardi', 'Via Bernardo da Pescocostanzo', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3622767, 13.4050119, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(56974, 'via Tancredi da Pentima', 'Via Tancredi da Pentima', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3508219, 13.3874868, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(57385, 'Camarda', NULL, NULL, 'Camarda', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3957899, 13.4993623, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(57421, 'viale Crispi', 'Viale Francesco Crispi', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3439458, 13.3963527, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(58283, 'Fontegrossa', 'Via Fontegrossa', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3736661, 13.4254837, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(59144, 'via%20girolamo%20da%20vicenza', 'Viale Girolamo da Vicenza', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3424701, 13.4071173, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(59835, 'Pianola Bagno Grande', 'Via L%27Aquila-Pianola', NULL, 'Pianola', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3321539, 13.4023898, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(61461, 'Palombaia', NULL, NULL, 'Palombaia', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3580605, 13.3147804, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(65007, 'Pianola', NULL, NULL, 'Pianola', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3240117, 13.4031437, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(65436, 'via Vetoio', 'Via Vetoio', NULL, 'Coppito', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.367563, 13.35124, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(66661, 'Fossa Paese', NULL, NULL, 'Fossa', 'Abruzzo', 'Provincia dell%27Aquila', 'Fossa', 'Italy', 42.2951534, 13.4875592, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(66860, 'Cese', NULL, NULL, 'Cese', 'Abruzzo', 'Provincia dell%27Aquila', 'Avezzano', 'Italy', 42.0293441, 13.3865316, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(66885, 'L?Aquilone', 'Loc. Campo Di Pile', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3485856, 13.3490324, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(74510, 'Coppito', NULL, NULL, 'Coppito', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3667592, 13.3358703, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(75408, 'C.A.S.E. Bazzano', NULL, NULL, 'Bazzano', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.33685730000001, 13.4535251, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(77364, 'Monticchio', NULL, NULL, 'Monticchio', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.320275, 13.4653074, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(79057, 'via Ponte Rasarolo', 'Via Ponte Rasarolo', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3394082, 13.3982294, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(81662, 'via tre vasche', 'Via Tre Vasche', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.35245279999999, 13.4234313, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(83238, 'Collefracido', NULL, NULL, 'Collefracido', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3256687, 13.3229953, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(85597, 'bv.Bagno', 'Via di Bagno', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3147415, 13.4155262, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(85756, 'Universit? Reiss Romoli', 'Via Enrico Berlinguer', NULL, 'L''Aquila', 'Abruzzo', 'Provincia dell''Aquila', 'L''Aquila', 'Italy', 42.3530348, 13.3420828, NULL, NULL, '1999-12-31 02:00:00', '0', 'Universit? Reiss Romoli', 854953),
(92656, 'Arischia', NULL, NULL, 'Arischia', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.4181678, 13.3408023, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(94221, 'via%20della%20liberazione', 'Via della Liberazione', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.337034, 13.3599777, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(95662, 'viale De Gaperi', 'Viale Alcide De Gasperi', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3577463, 13.4083045, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(96821, 'S.S. 17 est San Gregorio', 'Strada Statale 17 Est', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3362163, 13.4508263, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(100227, 'viale Collemaggio', 'Viale Collemaggio', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3438074, 13.3980496, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(101014, 'Guardia di Finanza', 'Via Raffaele Paolucci', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3619448, 13.3854355, NULL, NULL, '1999-12-31 02:00:00', '0', 'via Paolucci', 854953),
(103388, 'Genzano paese', NULL, NULL, 'Genzano', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3525394, 13.3233562, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(103805, 'via grotta di navarra', 'Via Grotta di Navarra', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3499189, 13.4252864, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(109097, 'stazione F.S.', 'Piazzale della Stazione', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.35112669999999, 13.385264, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(115776, 'genzano', NULL, NULL, 'Genzano', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3525394, 13.3233562, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(116357, 'S. Vittorino paese', NULL, NULL, 'San Vittorino', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3970865, 13.3142384, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(118931, 'via I. Silone', 'Via Ignazio Silone', NULL, 'L''Aquila', 'Abruzzo', 'Provincia dell''Aquila', 'L''Aquila', 'Italy', 42.358442511100414, 13.413593843579292, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(118993, 'via%20capo%20croce', 'Via Capo Croce', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3639258, 13.4061013, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(120155, 'CASE Sant%27Elia2', 'Progetto C.A.S.E. Paganica 2', NULL, 'Paganica', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3509321, 13.469104, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(122102, 'cermone', NULL, NULL, 'Cermone', 'Abruzzo', 'Provincia dell%27Aquila', 'Pizzoli', 'Italy', 42.406872, 13.305885, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(131324, 'Cansatessa', 'Piazza Cansatessa', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3835731, 13.3437243, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(135642, 'via Leonardo da Vinci', 'Via Leonardo da Vinci', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3661156, 13.3716601, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(136138, 'S.S.17ter', 'Strada Statale 17ter', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3513254, 13.42901, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(136212, 'via Ponte San Giovanni', 'Via Ponte San Giovanni', NULL, 'Sassa', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3533319, 13.2888919, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(139483, 'Pescomaggiore', NULL, NULL, 'Pescomaggiore', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3561222, 13.5091729, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(143096, 'via Panella', 'Viale Antonio Panella', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3534164, 13.410284, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(143899, 'Roio Poggio piazza Santuario', 'Piazza del Santuario', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3320655, 13.3798842, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(146504, 'Paganica', NULL, NULL, 'Paganica', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3595833, 13.4711051, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(146515, 'S.S.17 ovest', 'Strada Statale 17 Ovest', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3596132, 13.3742897, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(148879, 'S.S.17 bis', 'S.s. Ovest', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.35915, 13.36858, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(155780, 'via San Giacomo', 'Via San Giacomo', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3662899, 13.41421, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(161091, 'via dell%27Industria', 'via dell%27 industria', NULL, 'Nucleo Industriale di Bazzano', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3417924, 13.4664217, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(163822, 'via della polveriera', 'Via della Polveriera', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3445504, 13.4184046, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(170862, 'via Iovenitti', NULL, NULL, NULL, NULL, NULL, NULL, 'Italy', 42.35283, 13.47437, NULL, NULL, '1999-12-31 02:00:00', '2', NULL, 854953),
(172156, 'via Falcone', 'Via Giovanni Falcone', NULL, 'Coppito', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.363171, 13.3503481, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(174700, 'via Sant%27Emidio', 'Via Sant%27Emidio', NULL, 'Paganica', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3557804, 13.4729147, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(181155, 'Base funivia', NULL, NULL, 'Fonte Cerreto', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.4258302, 13.5285195, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(182060, 'via Mausonia', 'Via Mausonia', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3238565, 13.4163528, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(185543, 'via%20oliviero%20evangelista', 'Via Oliviero Evangelista', NULL, 'Paganica', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3537046, 13.4736199, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(186381, 'aaa', 'Via Appia Nuova', NULL, 'Roma', 'Lazio', 'Citt? Metropolitana di Roma', 'Roma', 'Italia', 41.8366149, 12.551582300000064, NULL, NULL, '1999-12-31 02:00:00', 'OK', NULL, 854953),
(189309, 'gignano piazza', 'Via Gignano', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3541253, 13.3982462, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(191564, 'Fontana Luminosa', 'Piazza Battaglione degli Alpini', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3538387, 13.4013294, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(193269, 'via Borsellino', 'Via Paolo Borsellino', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3691113, 13.346525, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(194561, 'Porta Napoli', 'Via Porta Napoli', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.34025400000001, 13.4011173, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(200800, 'via De%27 Medici', 'Via dei Medici', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3611933, 13.3642253, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(202130, 'via Francesco Paolo Tosti', 'Via Francesco Paolo Tosti', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3777795, 13.4112484, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(204448, 'Peschiolo', NULL, NULL, 'Peschiolo', 'Abruzzo', 'Provincia dell%27Aquila', 'Lucoli', 'Italy', 42.2960276, 13.328048, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(207433, 'via dell%27Aringo', 'Via dell%27Aringo', NULL, 'Preturo', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3758187, 13.3017131, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(208214, 'palazzo%20di%20giustizia', 'Via Salaria Antica Est', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3563677, 13.3748847, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(212576, 'viale%20di%20collemaggio', 'Viale di Collemaggio', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.34385, 13.3990853, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(217260, 'via Del Rio', 'Via del Rio', NULL, 'Paganica', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3572216, 13.4721668, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(218467, 'San Marco', NULL, NULL, 'San Marco', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3952096, 13.2813854, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(219693, 'via Onna', 'Via Onna', NULL, 'Paganica', NULL, 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3422979, 13.4744097, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(223542, 's.s. 5 bis', 'Via SS. Demetrio e Nicandro', NULL, 'San Nicandro', 'Abruzzo', 'Provincia dell%27Aquila', 'Prata D%27ansidonia', 'Italy', 42.2819233, 13.5918116, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(225109, 'via del torcituro', 'Via del Torcituro', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3452999, 13.4160399, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(231611, 'MAP Fossa Necropoli Vestina', 'Via San Massimo d%27Aveja', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'Fossa', 'Italy', 42.3109262, 13.5049894, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(232962, 'Cese di Preturo', 'Via di Preturo', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3709109, 13.3134069, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(233760, 'viale duca abruzzi', 'Viale Duca degli Abruzzi', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3553508, 13.3977986, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(234981, 'Roio Poggio', NULL, NULL, 'Poggio di Roio', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3320787, 13.375332, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(236333, 'Collevernesco CASE', 'Vicolo Picenze', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.34581, 13.399807, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(240136, 'case%20sassa', 'Case Sanofi Via Comunale Scoppito', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'Tornimparte', 'Italy', 42.3596705, 13.2556031, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(243020, 'Aragno', NULL, NULL, 'Aragno', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.39704589999999, 13.4576796, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(243310, 'via matteo da leonessa', 'Via Matteo da Leonessa', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3445027, 13.4130394, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(244242, 'via Scarfoglio', 'Via Edoardo Scarfoglio', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3618894, 13.4162816, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(244813, 'viale Gran Sasso', 'Viale Gran Sasso D%27Italia', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3553243, 13.4035614, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(251914, 'viale XXV aprile', 'Viale XXV Aprile', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3542004, 13.3862926, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(258435, 'Pozza', NULL, NULL, 'Pozza-San Marco', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3946022, 13.2843857, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(262533, 'via Piccinini', 'Via Ugo Piccinini', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.363271, 13.3834532, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(272032, 'INFN', 'Via G. Acitelli', NULL, 'Assergi, L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.4198187, 13.5172445, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(277802, 's.%20elia%20collevernesco', 'Via Collevernesco', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3370325, 13.4265911, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(278229, 'via abruzzo', 'Via Abruzzo', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.34574749999999, 13.4151889, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(280665, 'Sassa Scalo', NULL, NULL, 'Sassa Scalo', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3609461, 13.2930448, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(281359, 'case%20pagliare', NULL, NULL, 'Pagliare', NULL, 'Provincia dell%27Aquila', NULL, 'Italy', 42.35160279999999, 13.3130261, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(284275, 'bazzanese', 'Via Bazzanese', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3469774, 13.4322696, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(290428, 'San Martino', NULL, NULL, 'San Martino', 'Abruzzo', 'Provincia dell%27Aquila', 'Barisciano', 'Italy', 42.3309199, 13.5357383, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(291804, 'via%20enrico%20fermi', 'Via Enrico Fermi', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3751997, 13.3513327, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(292099, 'via Celano', 'Via Celano', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3433679, 13.4096409, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(292405, 'via di Valle (Monticchio)', 'Via di Valle', NULL, 'Monticchio', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3188193, 13.4639652, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(301406, 'bivio Pagliare', 'Via Madonna delle Pagliare', NULL, 'Pagliare', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.35130400000001, 13.3121036, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(303620, 'Petogna', NULL, NULL, 'Petogna', 'Abruzzo', 'Provincia dell%27Aquila', 'Barisciano', 'Italy', 42.3320466, 13.5238096, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(306710, 'rome', 'Via Roma', NULL, 'Macerata', 'Marche', 'Provincia di Macerata', 'Macerata', 'Italia', 43.2922058, 13.437248400000044, NULL, NULL, '1999-12-31 02:00:00', 'OK', NULL, 854953),
(307858, 'viale Aldo Moro', 'Viale Aldo Moro', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3600538, 13.3971898, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(311177, 'via%20cardinale%20mazzarino', 'Via Cardinale Mazzarino', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3597517, 13.4080781, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(313037, 'Assergi', NULL, NULL, 'Assergi', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.41351239999999, 13.5053538, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(319722, 'MAP Bagno', NULL, NULL, 'Bagno', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3108984, 13.4197282, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(353570, 'Menzano', NULL, NULL, 'Menzano', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.4056046, 13.2274982, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(354986, 'corte dei conti', 'Via Carceri', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3520119, 13.3937102, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(355396, 'via Amiternina', 'Via Amiternina', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3974558, 13.3051689, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(369365, 'MAP S.Gregorio', NULL, NULL, 'San Gregorio', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.32695400000001, 13.4981486, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(369414, 'aaa', 'Via Appia Nuova', NULL, 'Roma', 'Lazio', 'Citt? Metropolitana di Roma', 'Roma', 'Italia', 41.8366149, 12.551582300000064, NULL, NULL, '1999-12-31 02:00:00', 'OK', NULL, 854953),
(384211, 'via XX Settembre', 'Via XX Settembre', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.350184, 13.3924338, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(390267, 'Colle Sassa', NULL, NULL, 'Colle di Sassa', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3466494, 13.2918502, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(394550, 'via Fioretta', 'Via Fioretta', NULL, 'Paganica', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3539787, 13.4689135, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(400227, 'Fossa (Fossa Cerro)', 'Via Cerro', NULL, 'Cerro', 'Abruzzo', 'Provincia dell%27Aquila', 'Fossa', 'Italy', 42.2974324, 13.4958468, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(408663, 'autostrada', 'A24', NULL, NULL, NULL, NULL, NULL, 'Italy', 42.3638899, 13.4034055, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(415660, 'Tempera', NULL, NULL, 'Tempera', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3659772, 13.4547895, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(433335, 'Vallesindola', NULL, NULL, 'Vallesindola di Bagno', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3026902, 13.4314919, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(438771, 'croce rossa', 'Viale della Croce Rossa', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3565638, 13.3964846, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(448246, 'Santa Croce', NULL, NULL, 'Santa Croce', 'Abruzzo', 'Provincia dell%27Aquila', 'Lucoli', 'Italy', 42.3041069, 13.3182339, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(458627, 'Casaline', NULL, NULL, 'Casaline', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.4102851, 13.2356895, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(467563, 'via De Gasperi', 'Via Alcide de Gasperi', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3582625, 13.4095166, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(469750, 'via%20piemonte', 'Via Piemonte', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3418157, 13.4193078, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(483490, 'Ingegneria monteluco di Roio', 'Piazzale E. Pontieri', NULL, 'Monteluco di Roio, L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3367644, 13.3768416, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(487315, 'via Ettore Moschino', 'Via Ettore Moschino', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3612876, 13.41208, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(489359, 'Cavalletto D%27Ocre', NULL, NULL, 'Valle-cavalletto D%27ocre', 'Abruzzo', 'Provincia dell%27Aquila', 'Ocre', 'Italy', 42.3063806, 13.4576796, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(489893, 'case%20di%20preturo', 'Strada Statale 80', NULL, 'Preturo', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3762612, 13.2954515, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(490769, 'San Gregorio paese', NULL, NULL, 'San Gregorio', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.32695400000001, 13.4981486, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(510208, 'via Confalonieri', 'Via Carlo Confalonieri', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3643973, 13.3870084, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(511504, 'via Puccini (Cavalletto)', 'Via Giacomo Puccini', NULL, 'Valle-cavalletto D%27ocre', 'Abruzzo', 'Provincia dell%27Aquila', 'Ocre', 'Italy', 42.3082035, 13.4587905, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(513785, 'CASE Coppito3', 'Via Capo le Case', NULL, 'Coppito', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3685236, 13.3388043, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(514508, 'Via Marsicana', 'Via Marsicana', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3109445, 13.4398393, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(517389, 'via Savini', 'Via Francesco Savini', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3538984, 13.4168251, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(520522, 'via Federici', 'Via Ing. Federici Fortunato', NULL, 'Barete', 'Abruzzo', 'Provincia dell%27Aquila', 'Barete', 'Italy', 42.4514937, 13.2795065, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(533308, 'Filetto', NULL, NULL, 'Filetto', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3767077, 13.5186689, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(538157, 'via%20pescara', 'Via Pescara', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3532535, 13.406766, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(547270, 'MAP Onna', NULL, NULL, 'Onna', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.327815, 13.4757446, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(576221, 'via Urbani', 'Via Giuseppe Urbani', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3576759, 13.4084166, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(577934, '\n ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1999-12-31 02:00:00', '5', NULL, 854953),
(590197, 'Villa di Mezzo', 'Via di Mezzo', NULL, 'Villa San Sebastiano', 'Abruzzo', 'Provincia dell%27Aquila', 'Tagliacozzo', 'Italy', 42.0309235, 13.3104481, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(590944, 'via scuola della torretta', 'Via Scuola della Torretta', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3471996, 13.4146202, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(594834, 'via Colagrande', 'Via Angelo Colagrande', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3612626, 13.4058745, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(595275, 'Cavalletto', NULL, NULL, 'Ocre', 'Abruzzo', 'Provincia dell%27Aquila', 'Ocre', 'Italy', 42.303038, 13.452726, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(596255, 'piazza%20tommaso%20da%20celano', 'Piazza Tommaso da Celano', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3623772, 13.405208, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(599565, 'Coppito 3', 'Via Coppito', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3532515, 13.3949519, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(624811, 'CASE Assergi2', 'Localit? Fonte Cerreto', NULL, 'Assergi', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.4250724, 13.5341802, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(655949, 'via Antica Arischia', 'Via Antica Arischia', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3749111, 13.358526, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(657733, 'via San Sisto', 'Via San Sisto', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3608839, 13.3896475, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(660393, 'via Pellegrini', 'Via Angelo Pellegrini', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3637254, 13.3869308, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(662493, 'Fonte cerreto', NULL, NULL, 'Assergi', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.41351239999999, 13.5053538, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(667076, 'Sassa', NULL, NULL, 'Sassa', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3522942, 13.2979373, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(682262, 'via%20pile', 'Via Pile', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.35314510000001, 13.3808846, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(683767, 'Poggio S.Maria', NULL, NULL, 'Poggio Santa Maria', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3308937, 13.2991787, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(710904, 'Ripa', NULL, NULL, 'Ripa', 'Abruzzo', 'Province of L%27Aquila', 'Fagnano Alto', 'Italy', 42.2723138, 13.5790804, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(713057, 'via%20titta%20rossa', 'Via Giovanni Titta Rossa', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3608027, 13.4135243, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(729291, 'via Amiternum', 'Via Amiternum', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3649829, 13.3798218, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(733641, 'Cavalletto D%27Ocre piazzale Dante Alighieri', 'Piazza Dante Alighieri', NULL, 'Valle-cavalletto D%27ocre', 'Abruzzo', 'Provincia dell%27Aquila', 'Ocre', 'Italy', 42.306566, 13.4577114, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(738682, 'via Manzoni', 'Via Alessandro Manzoni', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3705918, 13.3597054, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(741587, 'san%20vittorino', NULL, NULL, 'San Vittorino', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3970865, 13.3142384, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(747466, 'via Vinciali', 'Via Vinciali', NULL, 'Nucleo Industriale di Bazzano', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.33313649999999, 13.4767291, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(751238, 'MAP Paganica2', NULL, NULL, 'Paganica', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3595833, 13.4711051, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(752728, 'via%20piagge', 'Via Piagge', NULL, 'Foce', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3105433, 13.2992574, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(758529, 'piazza San Giacomo', 'Galleria San Giacomo', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3645231, 13.4199798, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(773873, 'via%20costarella', 'Via Costarella', NULL, 'San Pio', 'Abruzzo', 'Provincia dell%27Aquila', 'Fontecchio', 'Italy', 42.2369688, 13.6106069, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(781516, 'CASE Arischia', 'Via Rocco Carabba', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.354602, 13.38427, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(791064, 'Torretta', NULL, NULL, 'Sant%27Elia', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3443648, 13.4128895, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(829446, 'aaa', 'Via Appia Nuova', NULL, 'Roma', 'Lazio', 'Citt? Metropolitana di Roma', 'Roma', 'Italia', 41.8366149, 12.551582300000064, NULL, NULL, '1999-12-31 02:00:00', 'OK', NULL, 854953),
(842813, 'Valle Pretara', 'Via Pretara', NULL, 'Civita di Bagno', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3096544, 13.4459792, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(847571, 'Civita di Bagno', NULL, NULL, 'Bagno', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3108984, 13.4197282, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(849435, 'S. Elia', NULL, NULL, 'Sant%27Elia', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3421494, 13.4165725, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(861921, 'via%20trecco', 'Via Federico Trecco', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3587728, 13.4060164, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(870156, 'via Marconi', 'Via Guglielmo Marconi', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.36313, 13.3967555, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(871117, 'via%20monte%20omo', 'Via Monte Omo', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'Pizzoli', 'Italy', 42.438752, 13.2988877, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(912590, 'Bagno', NULL, NULL, 'Bagno', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3108984, 13.4197282, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(918607, 'Prata/Peschiolo', NULL, NULL, 'Peschiolo', 'Abruzzo', 'Provincia dell%27Aquila', 'Lucoli', 'Italy', 42.29577219999999, 13.3302134, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(921150, 'Picenze', NULL, NULL, 'Poggio Picenze', 'Abruzzo', 'Provincia dell%27Aquila', 'Poggio Picenze', 'Italy', 42.3221785, 13.5420779, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(962982, 'Colle Pretara', 'Via Colle Pretara', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.36061249999999, 13.3929933, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(965795, 'via marche', 'Via Marche', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3485355, 13.4246532, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(997815, 'Collebrincioni', NULL, NULL, 'Collebrincioni', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.4008376, 13.4153461, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(1701, 'via della Comunit? Europea', 'Via della Comunit? Europea', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3683017, 13.3634003, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(2780, 'via Cencioni', 'Via Amleto Cencioni', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3497492, 13.4112062, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(3792, 'via Volta', 'Via Alessandro Volta', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3599081, 13.4101257, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(6772, 'via Saragat', 'Via Onorevole Giuseppe Saragat', NULL, 'Nucleo Industriale Pile', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3511561, 13.3443113, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(10119, 'via strinella', 'Via Strinella', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3507231, 13.4064267, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(10991, 'viale Corrado IV', 'Viale Corrado IV', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.35786710000001, 13.3846977, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(12375, 'bazzano', NULL, NULL, 'Bazzano', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.33685730000001, 13.4535251, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(13032, 'Roio Colle', NULL, NULL, 'Colle di Roio', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.34195649999999, 13.3489823, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(13046, 'S.S. 17 est bivio Onna', NULL, NULL, 'L%27Aquila', NULL, 'Provincia dell%27Aquila', NULL, 'Italy', 42.331591, 13.477729, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(15353, 'Hotel Amiternum', 'Strada Statale 17', NULL, 'L%27Aquila', NULL, 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.36054499999999, 13.377571, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(18782, 'Universit? Reis', 'Via Giovanni di Vincenzo', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.356751, 13.382894, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(19793, 'Terminalbus', 'Via Giacomo Caldora', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3444635, 13.4012983, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(30949, 'viale Croce Rossa', 'Viale Croce Rossa', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3565723, 13.3964517, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(30960, 'Preturo', NULL, NULL, 'Preturo', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3780379, 13.2963207, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(31159, 'S.S.80', 'SS80', NULL, NULL, 'Abruzzo', NULL, NULL, 'Italy', 42.577848, 13.6249543, NULL, NULL, '1999-12-31 02:00:00', '3', NULL, 854953),
(32714, 'via Beato Cesidio', 'Via del Beato Cesidio', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.35943839999999, 13.3865591, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(34130, 'Roio Piano', NULL, NULL, 'Roio Piano', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.327887, 13.3580068, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(36073, 'via Oberdan', 'Via Oberdan', NULL, 'Paganica', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.36097849999999, 13.4716933, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(36136, 'via%20alexander%20fleming', 'Via Alexander Fleming', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3843696, 13.3429775, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(41991, 'Paganica piazza', 'Via L%27Aquila', NULL, 'Paganica', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.365497, 13.4563489, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(44152, 'via della crocetta', 'Via della Crocetta', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3457543, 13.4104778, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(44991, 'S.S. 17 est', 'Viadotto San S.N.17', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3589284, 13.3619839, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(51887, 'Cimitero', 'Via del Cimitero', NULL, 'Aragno', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3949019, 13.4576734, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(53386, 'Pagliare di Sassa', NULL, NULL, 'Pagliare', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3524412, 13.3121316, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(54715, 'contrada Bernardi', 'Via Bernardo da Pescocostanzo', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3622767, 13.4050119, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(56974, 'via Tancredi da Pentima', 'Via Tancredi da Pentima', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3508219, 13.3874868, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(57385, 'Camarda', NULL, NULL, 'Camarda', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3957899, 13.4993623, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(57421, 'viale Crispi', 'Viale Francesco Crispi', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3439458, 13.3963527, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(58283, 'Fontegrossa', 'Via Fontegrossa', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3736661, 13.4254837, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(59144, 'via%20girolamo%20da%20vicenza', 'Viale Girolamo da Vicenza', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3424701, 13.4071173, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(59835, 'Pianola Bagno Grande', 'Via L%27Aquila-Pianola', NULL, 'Pianola', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3321539, 13.4023898, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(61461, 'Palombaia', NULL, NULL, 'Palombaia', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3580605, 13.3147804, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(65007, 'Pianola', NULL, NULL, 'Pianola', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3240117, 13.4031437, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(65436, 'via Vetoio', 'Via Vetoio', NULL, 'Coppito', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.367563, 13.35124, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(66661, 'Fossa Paese', NULL, NULL, 'Fossa', 'Abruzzo', 'Provincia dell%27Aquila', 'Fossa', 'Italy', 42.2951534, 13.4875592, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(66860, 'Cese', NULL, NULL, 'Cese', 'Abruzzo', 'Provincia dell%27Aquila', 'Avezzano', 'Italy', 42.0293441, 13.3865316, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(66885, 'L?Aquilone', 'Loc. Campo Di Pile', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3485856, 13.3490324, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(74510, 'Coppito', NULL, NULL, 'Coppito', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3667592, 13.3358703, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(75408, 'C.A.S.E. Bazzano', NULL, NULL, 'Bazzano', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.33685730000001, 13.4535251, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(77364, 'Monticchio', NULL, NULL, 'Monticchio', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.320275, 13.4653074, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(79057, 'via Ponte Rasarolo', 'Via Ponte Rasarolo', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3394082, 13.3982294, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(81662, 'via tre vasche', 'Via Tre Vasche', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.35245279999999, 13.4234313, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(83238, 'Collefracido', NULL, NULL, 'Collefracido', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3256687, 13.3229953, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(85597, 'bv.Bagno', 'Via di Bagno', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3147415, 13.4155262, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(85756, 'Universit? Reiss Romoli', 'Via Enrico Berlinguer', NULL, 'L''Aquila', 'Abruzzo', 'Provincia dell''Aquila', 'L''Aquila', 'Italy', 42.3530348, 13.3420828, NULL, NULL, '1999-12-31 02:00:00', '0', 'Universit? Reiss Romoli', 854953),
(92656, 'Arischia', NULL, NULL, 'Arischia', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.4181678, 13.3408023, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(94221, 'via%20della%20liberazione', 'Via della Liberazione', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.337034, 13.3599777, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(95662, 'viale De Gaperi', 'Viale Alcide De Gasperi', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3577463, 13.4083045, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(96821, 'S.S. 17 est San Gregorio', 'Strada Statale 17 Est', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3362163, 13.4508263, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(100227, 'viale Collemaggio', 'Viale Collemaggio', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3438074, 13.3980496, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953);
INSERT INTO `posizione_autobus` (`id`, `nome`, `route`, `premise`, `locality`, `aal1`, `aal2`, `aal3`, `country`, `lat`, `lon`, `formatted_address`, `place_id`, `data`, `error_type`, `nome_fermata`, `storico_fk`) VALUES
(101014, 'Guardia di Finanza', 'Via Raffaele Paolucci', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3619448, 13.3854355, NULL, NULL, '1999-12-31 02:00:00', '0', 'via Paolucci', 854953),
(103388, 'Genzano paese', NULL, NULL, 'Genzano', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3525394, 13.3233562, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(103805, 'via grotta di navarra', 'Via Grotta di Navarra', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3499189, 13.4252864, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(109097, 'stazione F.S.', 'Piazzale della Stazione', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.35112669999999, 13.385264, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(115776, 'genzano', NULL, NULL, 'Genzano', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3525394, 13.3233562, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(116357, 'S. Vittorino paese', NULL, NULL, 'San Vittorino', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3970865, 13.3142384, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(118931, 'via I. Silone', 'Via Ignazio Silone', NULL, 'L''Aquila', 'Abruzzo', 'Provincia dell''Aquila', 'L''Aquila', 'Italy', 42.358442511100414, 13.413593843579292, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(118993, 'via%20capo%20croce', 'Via Capo Croce', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3639258, 13.4061013, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(120155, 'CASE Sant%27Elia2', 'Progetto C.A.S.E. Paganica 2', NULL, 'Paganica', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3509321, 13.469104, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(122102, 'cermone', NULL, NULL, 'Cermone', 'Abruzzo', 'Provincia dell%27Aquila', 'Pizzoli', 'Italy', 42.406872, 13.305885, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(131324, 'Cansatessa', 'Piazza Cansatessa', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3835731, 13.3437243, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(135642, 'via Leonardo da Vinci', 'Via Leonardo da Vinci', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3661156, 13.3716601, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(136138, 'S.S.17ter', 'Strada Statale 17ter', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3513254, 13.42901, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(136212, 'via Ponte San Giovanni', 'Via Ponte San Giovanni', NULL, 'Sassa', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3533319, 13.2888919, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(139483, 'Pescomaggiore', NULL, NULL, 'Pescomaggiore', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3561222, 13.5091729, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(143096, 'via Panella', 'Viale Antonio Panella', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3534164, 13.410284, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(143899, 'Roio Poggio piazza Santuario', 'Piazza del Santuario', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3320655, 13.3798842, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(146504, 'Paganica', NULL, NULL, 'Paganica', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3595833, 13.4711051, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(146515, 'S.S.17 ovest', 'Strada Statale 17 Ovest', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3596132, 13.3742897, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(148879, 'S.S.17 bis', 'S.s. Ovest', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.35915, 13.36858, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(155780, 'via San Giacomo', 'Via San Giacomo', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3662899, 13.41421, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(161091, 'via dell%27Industria', 'via dell%27 industria', NULL, 'Nucleo Industriale di Bazzano', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3417924, 13.4664217, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(163822, 'via della polveriera', 'Via della Polveriera', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3445504, 13.4184046, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(170862, 'via Iovenitti', NULL, NULL, NULL, NULL, NULL, NULL, 'Italy', 42.35283, 13.47437, NULL, NULL, '1999-12-31 02:00:00', '2', NULL, 854953),
(172156, 'via Falcone', 'Via Giovanni Falcone', NULL, 'Coppito', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.363171, 13.3503481, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(174700, 'via Sant%27Emidio', 'Via Sant%27Emidio', NULL, 'Paganica', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3557804, 13.4729147, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(181155, 'Base funivia', NULL, NULL, 'Fonte Cerreto', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.4258302, 13.5285195, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(182060, 'via Mausonia', 'Via Mausonia', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3238565, 13.4163528, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(185543, 'via%20oliviero%20evangelista', 'Via Oliviero Evangelista', NULL, 'Paganica', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3537046, 13.4736199, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(186381, 'aaa', 'Via Appia Nuova', NULL, 'Roma', 'Lazio', 'Citt? Metropolitana di Roma', 'Roma', 'Italia', 41.8366149, 12.551582300000064, NULL, NULL, '1999-12-31 02:00:00', 'OK', NULL, 854953),
(189309, 'gignano piazza', 'Via Gignano', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3541253, 13.3982462, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(191564, 'Fontana Luminosa', 'Piazza Battaglione degli Alpini', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3538387, 13.4013294, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(193269, 'via Borsellino', 'Via Paolo Borsellino', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3691113, 13.346525, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(194561, 'Porta Napoli', 'Via Porta Napoli', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.34025400000001, 13.4011173, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(200800, 'via De%27 Medici', 'Via dei Medici', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3611933, 13.3642253, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(202130, 'via Francesco Paolo Tosti', 'Via Francesco Paolo Tosti', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3777795, 13.4112484, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(204448, 'Peschiolo', NULL, NULL, 'Peschiolo', 'Abruzzo', 'Provincia dell%27Aquila', 'Lucoli', 'Italy', 42.2960276, 13.328048, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(207433, 'via dell%27Aringo', 'Via dell%27Aringo', NULL, 'Preturo', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3758187, 13.3017131, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(208214, 'palazzo%20di%20giustizia', 'Via Salaria Antica Est', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3563677, 13.3748847, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(212576, 'viale%20di%20collemaggio', 'Viale di Collemaggio', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.34385, 13.3990853, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(217260, 'via Del Rio', 'Via del Rio', NULL, 'Paganica', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3572216, 13.4721668, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(218467, 'San Marco', NULL, NULL, 'San Marco', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3952096, 13.2813854, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(219693, 'via Onna', 'Via Onna', NULL, 'Paganica', NULL, 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3422979, 13.4744097, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(223542, 's.s. 5 bis', 'Via SS. Demetrio e Nicandro', NULL, 'San Nicandro', 'Abruzzo', 'Provincia dell%27Aquila', 'Prata D%27ansidonia', 'Italy', 42.2819233, 13.5918116, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(225109, 'via del torcituro', 'Via del Torcituro', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3452999, 13.4160399, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(231611, 'MAP Fossa Necropoli Vestina', 'Via San Massimo d%27Aveja', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'Fossa', 'Italy', 42.3109262, 13.5049894, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(232962, 'Cese di Preturo', 'Via di Preturo', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3709109, 13.3134069, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(233760, 'viale duca abruzzi', 'Viale Duca degli Abruzzi', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3553508, 13.3977986, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(234981, 'Roio Poggio', NULL, NULL, 'Poggio di Roio', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3320787, 13.375332, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(236333, 'Collevernesco CASE', 'Vicolo Picenze', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.34581, 13.399807, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(240136, 'case%20sassa', 'Case Sanofi Via Comunale Scoppito', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'Tornimparte', 'Italy', 42.3596705, 13.2556031, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(243020, 'Aragno', NULL, NULL, 'Aragno', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.39704589999999, 13.4576796, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(243310, 'via matteo da leonessa', 'Via Matteo da Leonessa', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3445027, 13.4130394, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(244242, 'via Scarfoglio', 'Via Edoardo Scarfoglio', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3618894, 13.4162816, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(244813, 'viale Gran Sasso', 'Viale Gran Sasso D%27Italia', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3553243, 13.4035614, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(251914, 'viale XXV aprile', 'Viale XXV Aprile', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3542004, 13.3862926, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(258435, 'Pozza', NULL, NULL, 'Pozza-San Marco', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3946022, 13.2843857, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(262533, 'via Piccinini', 'Via Ugo Piccinini', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.363271, 13.3834532, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(272032, 'INFN', 'Via G. Acitelli', NULL, 'Assergi, L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.4198187, 13.5172445, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(277802, 's.%20elia%20collevernesco', 'Via Collevernesco', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3370325, 13.4265911, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(278229, 'via abruzzo', 'Via Abruzzo', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.34574749999999, 13.4151889, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(280665, 'Sassa Scalo', NULL, NULL, 'Sassa Scalo', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3609461, 13.2930448, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(281359, 'case%20pagliare', NULL, NULL, 'Pagliare', NULL, 'Provincia dell%27Aquila', NULL, 'Italy', 42.35160279999999, 13.3130261, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(284275, 'bazzanese', 'Via Bazzanese', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3469774, 13.4322696, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(290428, 'San Martino', NULL, NULL, 'San Martino', 'Abruzzo', 'Provincia dell%27Aquila', 'Barisciano', 'Italy', 42.3309199, 13.5357383, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(291804, 'via%20enrico%20fermi', 'Via Enrico Fermi', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3751997, 13.3513327, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(292099, 'via Celano', 'Via Celano', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3433679, 13.4096409, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(292405, 'via di Valle (Monticchio)', 'Via di Valle', NULL, 'Monticchio', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3188193, 13.4639652, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(301406, 'bivio Pagliare', 'Via Madonna delle Pagliare', NULL, 'Pagliare', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.35130400000001, 13.3121036, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(303620, 'Petogna', NULL, NULL, 'Petogna', 'Abruzzo', 'Provincia dell%27Aquila', 'Barisciano', 'Italy', 42.3320466, 13.5238096, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(306710, 'rome', 'Via Roma', NULL, 'Macerata', 'Marche', 'Provincia di Macerata', 'Macerata', 'Italia', 43.2922058, 13.437248400000044, NULL, NULL, '1999-12-31 02:00:00', 'OK', NULL, 854953),
(307858, 'viale Aldo Moro', 'Viale Aldo Moro', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3600538, 13.3971898, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(311177, 'via%20cardinale%20mazzarino', 'Via Cardinale Mazzarino', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3597517, 13.4080781, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(313037, 'Assergi', NULL, NULL, 'Assergi', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.41351239999999, 13.5053538, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(319722, 'MAP Bagno', NULL, NULL, 'Bagno', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3108984, 13.4197282, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(353570, 'Menzano', NULL, NULL, 'Menzano', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.4056046, 13.2274982, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(354986, 'corte dei conti', 'Via Carceri', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3520119, 13.3937102, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(355396, 'via Amiternina', 'Via Amiternina', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3974558, 13.3051689, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(369365, 'MAP S.Gregorio', NULL, NULL, 'San Gregorio', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.32695400000001, 13.4981486, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(369414, 'aaa', 'Via Appia Nuova', NULL, 'Roma', 'Lazio', 'Citt? Metropolitana di Roma', 'Roma', 'Italia', 41.8366149, 12.551582300000064, NULL, NULL, '1999-12-31 02:00:00', 'OK', NULL, 854953),
(384211, 'via XX Settembre', 'Via XX Settembre', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.350184, 13.3924338, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(390267, 'Colle Sassa', NULL, NULL, 'Colle di Sassa', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3466494, 13.2918502, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(394550, 'via Fioretta', 'Via Fioretta', NULL, 'Paganica', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3539787, 13.4689135, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(400227, 'Fossa (Fossa Cerro)', 'Via Cerro', NULL, 'Cerro', 'Abruzzo', 'Provincia dell%27Aquila', 'Fossa', 'Italy', 42.2974324, 13.4958468, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(408663, 'autostrada', 'A24', NULL, NULL, NULL, NULL, NULL, 'Italy', 42.3638899, 13.4034055, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(415660, 'Tempera', NULL, NULL, 'Tempera', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3659772, 13.4547895, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(433335, 'Vallesindola', NULL, NULL, 'Vallesindola di Bagno', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3026902, 13.4314919, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(438771, 'croce rossa', 'Viale della Croce Rossa', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3565638, 13.3964846, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(448246, 'Santa Croce', NULL, NULL, 'Santa Croce', 'Abruzzo', 'Provincia dell%27Aquila', 'Lucoli', 'Italy', 42.3041069, 13.3182339, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(458627, 'Casaline', NULL, NULL, 'Casaline', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.4102851, 13.2356895, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(467563, 'via De Gasperi', 'Via Alcide de Gasperi', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3582625, 13.4095166, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(469750, 'via%20piemonte', 'Via Piemonte', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3418157, 13.4193078, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(483490, 'Ingegneria monteluco di Roio', 'Piazzale E. Pontieri', NULL, 'Monteluco di Roio, L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3367644, 13.3768416, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(487315, 'via Ettore Moschino', 'Via Ettore Moschino', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3612876, 13.41208, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(489359, 'Cavalletto D%27Ocre', NULL, NULL, 'Valle-cavalletto D%27ocre', 'Abruzzo', 'Provincia dell%27Aquila', 'Ocre', 'Italy', 42.3063806, 13.4576796, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(489893, 'case%20di%20preturo', 'Strada Statale 80', NULL, 'Preturo', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3762612, 13.2954515, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(490769, 'San Gregorio paese', NULL, NULL, 'San Gregorio', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.32695400000001, 13.4981486, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(510208, 'via Confalonieri', 'Via Carlo Confalonieri', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3643973, 13.3870084, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(511504, 'via Puccini (Cavalletto)', 'Via Giacomo Puccini', NULL, 'Valle-cavalletto D%27ocre', 'Abruzzo', 'Provincia dell%27Aquila', 'Ocre', 'Italy', 42.3082035, 13.4587905, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(513785, 'CASE Coppito3', 'Via Capo le Case', NULL, 'Coppito', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3685236, 13.3388043, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(514508, 'Via Marsicana', 'Via Marsicana', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3109445, 13.4398393, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(517389, 'via Savini', 'Via Francesco Savini', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3538984, 13.4168251, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(520522, 'via Federici', 'Via Ing. Federici Fortunato', NULL, 'Barete', 'Abruzzo', 'Provincia dell%27Aquila', 'Barete', 'Italy', 42.4514937, 13.2795065, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(533308, 'Filetto', NULL, NULL, 'Filetto', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3767077, 13.5186689, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(538157, 'via%20pescara', 'Via Pescara', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3532535, 13.406766, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(547270, 'MAP Onna', NULL, NULL, 'Onna', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.327815, 13.4757446, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(576221, 'via Urbani', 'Via Giuseppe Urbani', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3576759, 13.4084166, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(577934, '\n ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '1999-12-31 02:00:00', '5', NULL, 854953),
(590197, 'Villa di Mezzo', 'Via di Mezzo', NULL, 'Villa San Sebastiano', 'Abruzzo', 'Provincia dell%27Aquila', 'Tagliacozzo', 'Italy', 42.0309235, 13.3104481, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(590944, 'via scuola della torretta', 'Via Scuola della Torretta', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3471996, 13.4146202, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(594834, 'via Colagrande', 'Via Angelo Colagrande', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3612626, 13.4058745, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(595275, 'Cavalletto', NULL, NULL, 'Ocre', 'Abruzzo', 'Provincia dell%27Aquila', 'Ocre', 'Italy', 42.303038, 13.452726, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(596255, 'piazza%20tommaso%20da%20celano', 'Piazza Tommaso da Celano', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3623772, 13.405208, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(599565, 'Coppito 3', 'Via Coppito', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3532515, 13.3949519, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(624811, 'CASE Assergi2', 'Localit? Fonte Cerreto', NULL, 'Assergi', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.4250724, 13.5341802, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(655949, 'via Antica Arischia', 'Via Antica Arischia', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3749111, 13.358526, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(657733, 'via San Sisto', 'Via San Sisto', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3608839, 13.3896475, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(660393, 'via Pellegrini', 'Via Angelo Pellegrini', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3637254, 13.3869308, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(662493, 'Fonte cerreto', NULL, NULL, 'Assergi', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.41351239999999, 13.5053538, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(667076, 'Sassa', NULL, NULL, 'Sassa', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3522942, 13.2979373, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(682262, 'via%20pile', 'Via Pile', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.35314510000001, 13.3808846, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(683767, 'Poggio S.Maria', NULL, NULL, 'Poggio Santa Maria', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3308937, 13.2991787, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(710904, 'Ripa', NULL, NULL, 'Ripa', 'Abruzzo', 'Province of L%27Aquila', 'Fagnano Alto', 'Italy', 42.2723138, 13.5790804, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(713057, 'via%20titta%20rossa', 'Via Giovanni Titta Rossa', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3608027, 13.4135243, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(729291, 'via Amiternum', 'Via Amiternum', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3649829, 13.3798218, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(733641, 'Cavalletto D%27Ocre piazzale Dante Alighieri', 'Piazza Dante Alighieri', NULL, 'Valle-cavalletto D%27ocre', 'Abruzzo', 'Provincia dell%27Aquila', 'Ocre', 'Italy', 42.306566, 13.4577114, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(738682, 'via Manzoni', 'Via Alessandro Manzoni', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3705918, 13.3597054, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(741587, 'san%20vittorino', NULL, NULL, 'San Vittorino', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3970865, 13.3142384, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(747466, 'via Vinciali', 'Via Vinciali', NULL, 'Nucleo Industriale di Bazzano', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.33313649999999, 13.4767291, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(751238, 'MAP Paganica2', NULL, NULL, 'Paganica', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3595833, 13.4711051, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(752728, 'via%20piagge', 'Via Piagge', NULL, 'Foce', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3105433, 13.2992574, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(758529, 'piazza San Giacomo', 'Galleria San Giacomo', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3645231, 13.4199798, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(773873, 'via%20costarella', 'Via Costarella', NULL, 'San Pio', 'Abruzzo', 'Provincia dell%27Aquila', 'Fontecchio', 'Italy', 42.2369688, 13.6106069, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(781516, 'CASE Arischia', 'Via Rocco Carabba', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.354602, 13.38427, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(791064, 'Torretta', NULL, NULL, 'Sant%27Elia', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3443648, 13.4128895, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(829446, 'aaa', 'Via Appia Nuova', NULL, 'Roma', 'Lazio', 'Citt? Metropolitana di Roma', 'Roma', 'Italia', 41.8366149, 12.551582300000064, NULL, NULL, '1999-12-31 02:00:00', 'OK', NULL, 854953),
(842813, 'Valle Pretara', 'Via Pretara', NULL, 'Civita di Bagno', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3096544, 13.4459792, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(847571, 'Civita di Bagno', NULL, NULL, 'Bagno', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3108984, 13.4197282, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(849435, 'S. Elia', NULL, NULL, 'Sant%27Elia', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3421494, 13.4165725, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(861921, 'via%20trecco', 'Via Federico Trecco', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3587728, 13.4060164, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(870156, 'via Marconi', 'Via Guglielmo Marconi', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.36313, 13.3967555, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(871117, 'via%20monte%20omo', 'Via Monte Omo', NULL, NULL, 'Abruzzo', 'Provincia dell%27Aquila', 'Pizzoli', 'Italy', 42.438752, 13.2988877, NULL, NULL, '1999-12-31 02:00:00', '1', NULL, 854953),
(912590, 'Bagno', NULL, NULL, 'Bagno', 'Abruzzo', 'Province of L%27Aquila', 'L%27Aquila', 'Italy', 42.3108984, 13.4197282, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(918607, 'Prata/Peschiolo', NULL, NULL, 'Peschiolo', 'Abruzzo', 'Provincia dell%27Aquila', 'Lucoli', 'Italy', 42.29577219999999, 13.3302134, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(921150, 'Picenze', NULL, NULL, 'Poggio Picenze', 'Abruzzo', 'Provincia dell%27Aquila', 'Poggio Picenze', 'Italy', 42.3221785, 13.5420779, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(962982, 'Colle Pretara', 'Via Colle Pretara', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.36061249999999, 13.3929933, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(965795, 'via marche', 'Via Marche', NULL, 'L%27Aquila', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.3485355, 13.4246532, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953),
(997815, 'Collebrincioni', NULL, NULL, 'Collebrincioni', 'Abruzzo', 'Provincia dell%27Aquila', 'L%27Aquila', 'Italy', 42.4008376, 13.4153461, NULL, NULL, '1999-12-31 02:00:00', '0', NULL, 854953);

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazione`
--

CREATE TABLE `prenotazione` (
  `id` varchar(256) NOT NULL,
  `passeggero` varchar(256) NOT NULL,
  `autista` varchar(256) NOT NULL,
  `id_partenza` varchar(256) NOT NULL,
  `id_arrivo` varchar(256) NOT NULL,
  `posti` int(11) DEFAULT NULL,
  `prezzo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `relazione`
--

CREATE TABLE `relazione` (
  `utente_1` varchar(256) NOT NULL,
  `utente_2` varchar(256) NOT NULL,
  `approvato` int(11) NOT NULL DEFAULT '0',
  `raccomandato` int(11) NOT NULL DEFAULT '0',
  `da_valutare` int(11) NOT NULL DEFAULT '0',
  `da_valutare_data` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `relazione_approvato`
--

CREATE TABLE `relazione_approvato` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `relazione_approvato`
--

INSERT INTO `relazione_approvato` (`id`, `descrizione`) VALUES
(0, 'Non approvato'),
(1, 'In attesa'),
(2, 'Approvato'),
(4, 'Bloccato');

-- --------------------------------------------------------

--
-- Struttura della tabella `relazione_da_valutare`
--

CREATE TABLE `relazione_da_valutare` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `relazione_da_valutare`
--

INSERT INTO `relazione_da_valutare` (`id`, `descrizione`) VALUES
(0, 'L''utente non pu? scambiare feedback'),
(1, 'L''utente effettuer? un viaggio e in futuro potr? aggiungere un feedback'),
(2, 'L''utente pu? inserire un feedback'),
(3, 'L''utente ha gi? inserito un feedback');

-- --------------------------------------------------------

--
-- Struttura della tabella `ricerca`
--

CREATE TABLE `ricerca` (
  `id` varchar(256) NOT NULL,
  `lat_p` double NOT NULL,
  `lat_a` double NOT NULL,
  `lng_p` double NOT NULL,
  `lng_a` double NOT NULL,
  `cambio` int(11) NOT NULL,
  `date_search` varchar(256) DEFAULT NULL,
  `distanza` int(11) NOT NULL,
  `distanza_tra` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `utente_fk` varchar(256) NOT NULL,
  `date` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `societa`
--

CREATE TABLE `societa` (
  `id` int(11) NOT NULL,
  `nome` varchar(256) DEFAULT NULL,
  `citta` varchar(256) DEFAULT NULL,
  `tipologia` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `societa`
--

INSERT INTO `societa` (`id`, `nome`, `citta`, `tipologia`) VALUES
(880092, 'ama', NULL, 0),
(880092, 'ama', NULL, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `storico`
--

CREATE TABLE `storico` (
  `id` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descrizione` varchar(256) NOT NULL,
  `societa_fk` int(11) NOT NULL,
  `usato` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `storico`
--

INSERT INTO `storico` (`id`, `data`, `descrizione`, `societa_fk`, `usato`) VALUES
(21212, '2017-04-05 17:43:04', 'farlocco', 880092, 0),
(854953, '2017-01-23 19:33:38', 'Storico base', 880092, 1),
(21212, '2017-04-05 17:43:04', 'farlocco', 880092, 0),
(854953, '2017-01-23 19:33:38', 'Storico base', 880092, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `tratta_auto`
--

CREATE TABLE `tratta_auto` (
  `id` varchar(256) NOT NULL,
  `orario_partenza` varchar(256) NOT NULL,
  `enumerazione` int(11) NOT NULL,
  `data` varchar(256) NOT NULL,
  `viaggio_fk` varchar(256) NOT NULL,
  `prezzo` int(11) DEFAULT '0',
  `distanza` int(11) DEFAULT '0',
  `posti` int(11) DEFAULT '-1',
  `lat_partenza` double NOT NULL,
  `lng_partenza` double NOT NULL,
  `lat_arrivo` double NOT NULL,
  `lng_arrivo` double NOT NULL,
  `denominazione_partenza` varchar(256) NOT NULL,
  `denominazione_arrivo` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `tratta_autobus`
--

CREATE TABLE `tratta_autobus` (
  `id` int(11) NOT NULL,
  `fermata_precedente` int(11) NOT NULL DEFAULT '0',
  `fermata_successiva` int(11) NOT NULL,
  `autobus_fk` int(11) NOT NULL,
  `prossima_tratta` int(11) DEFAULT '0',
  `enumerazione` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='La tabella rappresenta le tratte degli autobus ord';

--
-- Dump dei dati per la tabella `tratta_autobus`
--

INSERT INTO `tratta_autobus` (`id`, `fermata_precedente`, `fermata_successiva`, `autobus_fk`, `prossima_tratta`, `enumerazione`) VALUES
(5694, 148879, 36073, 606401, 366388, 0),
(8952, 174700, 217260, 16694, 953238, 0),
(9509, 234981, 143899, 686265, 123967, 0),
(12972, 6772, 115776, 621718, 174863, 0),
(13510, 0, 66885, 418191, 390883, 0),
(13910, 219693, 120155, 418191, 441669, 0),
(14870, 2894, 2894, 818527, 682899, 0),
(14938, 44152, 2780, 891064, 253471, 0),
(16221, 243310, 278229, 370221, 328376, 0),
(16487, 0, 19793, 621718, 332166, 0),
(18578, 65436, 85756, 910082, 636729, 2),
(19197, 576221, 244242, 775317, 315626, 0),
(19467, 2780, 44152, 536992, 954949, 0),
(22738, 758529, 58283, 775317, 747665, 0),
(23261, 182060, 223542, 191580, 164823, 0),
(23268, 30960, 30960, 495609, 309187, 0),
(23699, 2894, 2894, 854037, 371147, 0),
(28615, 85756, 66885, 704129, 546157, 0),
(30562, 66885, 6772, 826234, 333022, 0),
(31409, 15353, 146515, 621718, 566665, 0),
(32876, 2894, 2894, 495609, 936907, 0),
(32949, 10119, 30949, 995372, 44035, 0),
(33436, 547270, 44991, 546451, 928633, 0),
(33673, 0, 65436, 910082, 18578, 1),
(36031, 143096, 30949, 44272, 482754, 0),
(36634, 85756, 2894, 932836, 270297, 0),
(40380, 2894, 2894, 854037, 400040, 0),
(40396, 65436, 85756, 932836, 293040, 0),
(42700, 394550, 44991, 826234, 884383, 0),
(44035, 30949, 251914, 995372, 332206, 0),
(45421, 44152, 2780, 44272, 154990, 0),
(45909, 2894, 2894, 932836, 462459, 0),
(46454, 2894, 2894, 932836, 910209, 0),
(46534, 85756, 172156, 826234, 333785, 0),
(47174, 19793, 100227, 288173, 668696, 0),
(47779, 32714, 101014, 891064, 73250, 0),
(48857, 2894, 2894, 495609, 625046, 0),
(49979, 10119, 143096, 775317, 523480, 0),
(50392, 10119, 19793, 45279, 241377, 0),
(53898, 146504, 12375, 144676, 701005, 0),
(54114, 15353, 31159, 826234, 559106, 0),
(59778, 120155, 44991, 144676, 655258, 0),
(60948, 243310, 292099, 205852, 399423, 0),
(63738, 0, 19793, 191580, 435612, 0),
(64895, 667076, 136212, 621718, 706061, 0),
(65719, 2894, 2894, 191580, 149986, 0),
(69065, 2894, 2894, 854037, 252254, 0),
(69533, 31159, 85756, 901186, 146263, 0),
(70908, 2894, 2894, 854037, 686722, 0),
(73250, 101014, 262533, 891064, 416089, 0),
(74643, 2894, 2894, 854037, 343247, 0),
(78806, 30949, 10119, 901186, 285858, 0),
(79021, 729291, 135642, 364152, 612202, 17),
(79655, 59835, 182060, 191580, 23261, 0),
(82783, 303620, 590197, 144676, 252832, 0),
(82794, 599565, 513785, 704129, 225020, 0),
(82926, 115776, 115776, 234663, 217188, 0),
(84612, 15353, 10991, 901186, 810617, 0),
(84722, 19793, 100227, 901186, 101876, 0),
(86211, 291804, 193269, 704129, 552342, 0),
(87537, 148879, 36073, 923670, 425841, 0),
(89539, 194561, 44991, 901186, 120582, 0),
(89865, 59835, 319722, 443955, 552492, 0),
(90271, 146515, 15353, 621718, 171288, 0),
(91532, 682262, 2894, 995372, 791831, 0),
(93493, 120155, 148879, 418191, 942661, 0),
(93808, 0, 19793, 891064, 520930, 0),
(98692, 0, 19793, 288173, 47174, 0),
(100125, 1701, 135642, 418191, 338383, 0),
(100144, 2894, 2894, 854037, 526376, 0),
(101876, 100227, 57421, 901186, 335295, 0),
(101883, 131324, 65436, 687288, 194879, 0),
(102076, 194561, 79057, 623073, 757136, 0),
(102323, 277802, 120155, 144676, 210333, 0),
(107232, 2894, 2894, 932836, 675626, 0),
(107575, 262533, 15353, 621718, 31409, 0),
(109266, 148879, 200800, 932836, 724835, 0),
(112418, 262533, 10991, 418191, 257891, 0),
(115831, 2894, 2894, 854037, 863684, 0),
(116260, 115776, 66885, 443955, 133928, 0),
(117016, 219693, 747466, 16694, 147557, 0),
(119768, 143096, 30949, 234663, 507655, 0),
(119937, 19793, 415660, 15131, 326836, 9),
(120582, 44991, 277802, 901186, 807186, 0),
(120615, 2894, 2894, 854037, 74643, 0),
(120901, 262533, 15353, 901186, 821823, 0),
(122402, 2894, 2894, 995372, 187541, 0),
(122788, 207433, 30960, 704129, 175851, 0),
(122992, 2894, 2894, 818527, 458987, 0),
(123967, 143899, 34130, 686265, 790823, 0),
(124728, 2780, 143096, 364152, 368226, 11),
(127023, 34130, 143899, 686265, 526262, 0),
(128309, 181155, 272032, 536992, 633832, 0),
(128440, 2894, 2894, 818527, 392814, 0),
(129603, 751238, 219693, 16694, 117016, 0),
(130222, 408663, 65436, 239110, 0, 3),
(133250, 146504, 219693, 546451, 170088, 0),
(133456, 244813, 10119, 45279, 50392, 0),
(134103, 57421, 194561, 910082, 481320, 0),
(136530, 57421, 194561, 144676, 616811, 0),
(141040, 234981, 34130, 443955, 949506, 0),
(142057, 182060, 54715, 623073, 845873, 0),
(143976, 146515, 15353, 234663, 535818, 0),
(146263, 85756, 65436, 901186, 535602, 0),
(147080, 0, 489893, 704129, 190649, 0),
(147557, 747466, 12375, 16694, 338534, 0),
(149986, 2894, 2894, 191580, 180618, 0),
(150248, 94221, 13032, 686265, 828532, 0),
(150381, 2894, 2894, 854037, 633117, 0),
(154389, 51887, 148879, 826234, 812828, 0),
(154668, 2894, 2894, 854037, 120615, 0),
(154990, 2780, 143096, 44272, 36031, 0),
(155472, 741587, 36136, 44272, 290002, 0),
(155695, 65436, 65436, 704129, 854144, 0),
(156473, 673090, 0, 15131, 0, 0),
(156522, 10119, 19793, 826234, 889084, 0),
(163852, 146515, 146515, 234663, 143976, 0),
(164823, 223542, 85597, 191580, 261803, 0),
(167421, 44991, 59144, 826234, 199142, 0),
(168892, 751238, 219693, 16694, 244244, 0),
(168952, 262533, 15353, 826234, 54114, 0),
(170088, 219693, 547270, 546451, 33436, 0),
(171288, 15353, 10991, 621718, 835925, 0),
(172172, 2894, 2894, 854037, 961802, 0),
(172281, 30949, 143096, 44272, 674463, 0),
(174863, 115776, 281359, 621718, 636761, 0),
(175734, 292099, 212576, 370221, 822992, 0),
(175851, 30960, 30960, 704129, 246919, 0),
(175992, 65436, 31159, 901186, 946461, 0),
(177177, 19793, 292099, 205852, 202001, 0),
(177223, 219693, 41991, 901186, 702906, 0),
(177415, 19793, 44152, 611022, 648841, 0),
(178903, 236333, 120155, 418191, 93493, 0),
(180618, 2894, 2894, 191580, 440759, 0),
(181641, 0, 66885, 15131, 770290, 1),
(182273, 148879, 163822, 370221, 733090, 0),
(184895, 2894, 2894, 495609, 672660, 0),
(184974, 15353, 148879, 932836, 109266, 0),
(186265, 193269, 172156, 364152, 673017, 23),
(187541, 2894, 2894, 995372, 863870, 0),
(187621, 301406, 667076, 234663, 491894, 0),
(189839, 791064, 189309, 205852, 483929, 0),
(190649, 489893, 355396, 704129, 805185, 0),
(194879, 65436, 85756, 687288, 247772, 0),
(195331, 415660, 148879, 901186, 544207, 0),
(197972, 290428, 390267, 234663, 947772, 0),
(198275, 172156, 85756, 495609, 323257, 0),
(199142, 59144, 19793, 826234, 646720, 0),
(199305, 172156, 85756, 901186, 713600, 0),
(200180, 85756, 66885, 364152, 397965, 25),
(201166, 146515, 85756, 234663, 528399, 0),
(201280, 85756, 6772, 621718, 12972, 0),
(202001, 292099, 243310, 205852, 459558, 0),
(202707, 77364, 182060, 443955, 554454, 0),
(203704, 15353, 10991, 44272, 868894, 0),
(203827, 0, 66885, 225142, 210310, 0),
(206846, 143096, 2780, 225142, 551462, 0),
(207788, 19793, 10119, 901186, 551940, 0),
(209923, 41991, 219693, 606401, 284008, 0),
(210310, 66885, 6772, 225142, 406434, 0),
(210333, 120155, 12375, 144676, 970870, 0),
(210389, 115776, 6772, 686265, 734863, 0),
(210906, 595275, 77364, 443955, 202707, 0),
(211892, 41991, 577934, 826234, 430783, 0),
(212576, 66661, 77364, 288173, 897701, 0),
(213611, 101014, 262533, 44272, 518520, 0),
(214777, 143096, 2780, 234663, 695830, 0),
(214907, 10991, 251914, 471147, 800038, 0),
(215199, 65436, 65436, 495609, 856834, 0),
(217188, 115776, 301406, 234663, 187621, 0),
(218539, 65436, 85756, 45279, 317768, 0),
(221066, 44152, 19793, 621718, 330172, 0),
(221183, 66885, 85756, 471147, 749227, 0),
(221750, 0, 143096, 63346, 605733, 0),
(222259, 85756, 148879, 225142, 919960, 0),
(224851, 713057, 520522, 775317, 624357, 0),
(225020, 513785, 207433, 704129, 122788, 0),
(229504, 2894, 2894, 995372, 928200, 0),
(231578, 118993, 118931, 15131, 300126, 7),
(232026, 511504, 292405, 288173, 234838, 0),
(232607, 57421, 194561, 288173, 518183, 0),
(234827, 15353, 31159, 891064, 769682, 0),
(234838, 292405, 77364, 288173, 501269, 0),
(235238, 85756, 31159, 826234, 318434, 0),
(235632, 44152, 2780, 923670, 342872, 0),
(237589, 2894, 2894, 818527, 633165, 0),
(239083, 193269, 172156, 495609, 198275, 0),
(241294, 10119, 30949, 826234, 635536, 0),
(242919, 103805, 189309, 370221, 456699, 0),
(242953, 74510, 65436, 653481, 601581, 0),
(244014, 57385, 41991, 536992, 922039, 0),
(244244, 219693, 174700, 16694, 8952, 0),
(246919, 30960, 232962, 704129, 382012, 0),
(247772, 85756, 85756, 687288, 547025, 0),
(248578, 185543, 170862, 923670, 281833, 0),
(248684, 30949, 143096, 471147, 739557, 0),
(250547, 354986, 233760, 63346, 342973, 0),
(252254, 2894, 2894, 854037, 471517, 0),
(252832, 590197, 921150, 144676, 971199, 0),
(253471, 2780, 143096, 891064, 955551, 0),
(254461, 752728, 136212, 621718, 860032, 0),
(257891, 10991, 32714, 418191, 547331, 0),
(261734, 19793, 10119, 995372, 32949, 0),
(261803, 85597, 319722, 191580, 580475, 0),
(262265, 57385, 624811, 15131, 673090, 12),
(262325, 41991, 997815, 836632, 392570, 0),
(263008, 533308, 148879, 923670, 87537, 0),
(263920, 118931, 517389, 910082, 775774, 0),
(265082, 13032, 94221, 686265, 994918, 0),
(266755, 219693, 120155, 901186, 280055, 0),
(267049, 0, 66885, 687288, 591270, 0),
(269202, 32714, 101014, 44272, 213611, 0),
(270297, 2894, 2894, 932836, 636882, 0),
(270998, 6772, 85756, 621718, 369860, 0),
(272275, 10991, 30949, 826234, 496665, 0),
(272287, 143096, 2780, 621718, 865975, 0),
(274733, 120155, 219693, 826234, 507940, 0),
(276634, 738682, 655949, 15131, 677678, 4),
(278914, 139483, 533308, 923670, 263008, 0),
(279713, 57421, 233760, 63346, 629049, 0),
(280042, 172156, 85756, 826234, 351359, 0),
(280055, 120155, 219693, 901186, 160069, 0),
(280382, 599565, 193269, 495609, 323861, 0),
(281770, 65436, 85756, 471147, 676921, 0),
(281833, 170862, 139483, 923670, 278914, 0),
(282319, 44152, 2780, 826234, 292167, 0),
(284008, 219693, 185543, 606401, 957996, 0),
(284779, 65436, 85756, 826234, 235238, 0),
(285858, 10119, 19793, 901186, 84722, 0),
(287290, 172156, 193269, 901186, 701805, 0),
(287717, 44991, 161091, 901186, 917390, 0),
(287720, 120155, 44991, 901186, 287717, 0),
(288577, 918607, 83238, 234663, 419250, 0),
(290002, 36136, 65436, 44272, 559321, 0),
(292167, 2780, 51887, 826234, 154389, 0),
(293040, 85756, 65436, 932836, 793686, 0),
(293689, 244242, 118931, 910082, 263920, 0),
(293908, 146515, 146515, 234663, 201166, 0),
(294145, 2894, 2894, 818527, 237589, 0),
(296125, 2894, 2894, 495609, 680883, 0),
(296748, 2894, 2894, 932836, 724578, 0),
(297236, 34130, 234981, 443955, 757618, 0),
(297316, 51887, 2780, 901186, 601981, 0),
(299007, 2780, 44152, 923670, 223094, 0),
(300126, 118931, 19793, 15131, 119937, 8),
(300335, 30960, 218467, 263455, 752057, 0),
(300455, 92656, 131324, 687288, 101883, 0),
(302167, 6772, 66885, 56165, 771569, 0),
(302487, 2780, 44152, 44272, 697954, 0),
(303165, 10119, 538157, 63346, 196148, 0),
(308735, 2894, 2894, 932836, 403033, 0),
(309187, 30960, 207433, 495609, 780522, 0),
(309676, 193269, 65436, 418191, 536953, 0),
(310980, 85756, 66885, 653481, 365649, 0),
(311653, 85756, 85756, 826234, 46534, 0),
(312595, 193269, 65436, 704129, 155695, 0),
(313100, 146504, 13046, 144676, 638884, 0),
(314213, 30960, 66860, 263455, 93713, 0),
(315626, 244242, 713057, 775317, 366077, 0),
(315666, 394550, 219693, 418191, 13910, 0),
(317768, 85756, 65436, 45279, 783363, 0),
(318434, 31159, 15353, 826234, 834059, 0),
(319253, 2894, 2894, 854037, 172172, 0),
(320549, 0, 41991, 826234, 391485, 0),
(321153, 2894, 2894, 854037, 344933, 0),
(323257, 85756, 2894, 495609, 648308, 0),
(323861, 193269, 65436, 495609, 215199, 0),
(324727, 0, 19793, 836632, 545953, 0),
(325340, 85756, 66885, 901186, 519593, 0),
(326836, 415660, 146504, 15131, 484222, 10),
(328376, 278229, 590944, 370221, 777113, 0),
(328864, 773873, 18782, 653481, 857793, 0),
(330037, 284275, 148879, 370221, 182273, 0),
(330354, 85756, 172156, 56165, 465607, 0),
(330564, 3792, 155780, 775317, 333635, 0),
(330805, 0, 19793, 923670, 623231, 0),
(332166, 19793, 44152, 621718, 769502, 0),
(332206, 251914, 109097, 995372, 511496, 0),
(333022, 6772, 6772, 826234, 556249, 0),
(333635, 155780, 758529, 775317, 22738, 0),
(333785, 172156, 193269, 826234, 796830, 0),
(334325, 483490, 143899, 686265, 337680, 0),
(335192, 15353, 10991, 471147, 214907, 0),
(335295, 57421, 194561, 901186, 89539, 0),
(335673, 96821, 369365, 418191, 509070, 0),
(336045, 2894, 2894, 854037, 69065, 0),
(337614, 467563, 10119, 775317, 897535, 0),
(337680, 143899, 234981, 686265, 9509, 0),
(338383, 135642, 729291, 418191, 782148, 0),
(338458, 143096, 30949, 621718, 573434, 0),
(338534, 12375, 161091, 16694, 771901, 0),
(338595, 912590, 710904, 191580, 365153, 0),
(340031, 30949, 143096, 621718, 272287, 0),
(341210, 41991, 394550, 16694, 905660, 0),
(342872, 2780, 51887, 923670, 375190, 0),
(342973, 233760, 57421, 63346, 647663, 0),
(343247, 2894, 2894, 854037, 442519, 0),
(344933, 2894, 2894, 854037, 903435, 0),
(347750, 514508, 223542, 288173, 713946, 0),
(349731, 596255, 594834, 910082, 932357, 0),
(351359, 85756, 18782, 826234, 777103, 0),
(354138, 116357, 92656, 687288, 300455, 0),
(354183, 10119, 19793, 418191, 487722, 0),
(357301, 2894, 2894, 854037, 599090, 0),
(359004, 85756, 85756, 704129, 770638, 0),
(359825, 65007, 79057, 364152, 573081, 4),
(360217, 2894, 2894, 818527, 122992, 0),
(362834, 85756, 172156, 901186, 287290, 0),
(365153, 710904, 433335, 191580, 598213, 0),
(366077, 713057, 3792, 775317, 330564, 0),
(366388, 36073, 41991, 606401, 995421, 0),
(366440, 61461, 281359, 621718, 432825, 0),
(368226, 143096, 244813, 364152, 652354, 12),
(369860, 85756, 146515, 621718, 602656, 0),
(371147, 2894, 2894, 854037, 442274, 0),
(375190, 51887, 148879, 923670, 676263, 0),
(376730, 738682, 65436, 364152, 851521, 20),
(377788, 66860, 30960, 263455, 503712, 0),
(378337, 394550, 120155, 16694, 807161, 0),
(379394, 0, 146504, 546451, 133250, 0),
(381594, 66661, 231611, 288173, 827138, 0),
(382894, 2894, 2894, 995372, 602773, 0),
(382989, 2894, 2894, 995372, 478076, 0),
(386898, 19793, 100227, 144676, 535837, 0),
(387485, 384211, 251914, 686265, 871613, 0),
(387690, 85756, 85756, 932836, 36634, 0),
(389996, 15353, 146515, 234663, 293908, 0),
(390883, 66885, 483490, 418191, 626581, 0),
(390969, 57421, 849435, 418191, 593952, 0),
(391485, 41991, 219693, 826234, 416986, 0),
(392570, 997815, 41991, 836632, 690843, 0),
(392814, 2894, 2894, 818527, 756286, 0),
(397965, 66885, 66885, 364152, 482619, 26),
(399423, 292099, 19793, 205852, 412909, 0),
(400040, 2894, 2894, 854037, 881066, 0),
(400318, 0, 65436, 45279, 218539, 0),
(401250, 2780, 143096, 621718, 338458, 0),
(401956, 965795, 103805, 370221, 242919, 0),
(403033, 2894, 2894, 932836, 682168, 0),
(404338, 54715, 13032, 686265, 265082, 0),
(405854, 30960, 599565, 653481, 678108, 0),
(406434, 6772, 6772, 225142, 598657, 0),
(407889, 85756, 172156, 471147, 753262, 0),
(409399, 871117, 655949, 44272, 467224, 0),
(410801, 280665, 240136, 653481, 797271, 0),
(410864, 2894, 2894, 495609, 48857, 0),
(412909, 19793, 10119, 205852, 498323, 0),
(413928, 83238, 6772, 56165, 302167, 0),
(415351, 2894, 2894, 932836, 107232, 0),
(416089, 262533, 15353, 891064, 234827, 0),
(416189, 6772, 85756, 901186, 525530, 0),
(416571, 19793, 2894, 471147, 581158, 0),
(416717, 155780, 3792, 775317, 611898, 0),
(416986, 219693, 120155, 826234, 274733, 0),
(417388, 510208, 657733, 45279, 855614, 0),
(419250, 83238, 204448, 234663, 819173, 0),
(419288, 66885, 115776, 443955, 586308, 0),
(419877, 193269, 65436, 471147, 281770, 0),
(419959, 32714, 101014, 826234, 861280, 0),
(421598, 2780, 143096, 234663, 119768, 0),
(423301, 32714, 660393, 45279, 440795, 0),
(424858, 79057, 65007, 910082, 506693, 0),
(425841, 36073, 41991, 923670, 463804, 0),
(429582, 262533, 15353, 234663, 389996, 0),
(430908, 139483, 533308, 606401, 620994, 0),
(431351, 258435, 353570, 263455, 688940, 0),
(431648, 120155, 120155, 901186, 287720, 0),
(432157, 57385, 57385, 536992, 244014, 0),
(432825, 281359, 115776, 621718, 581712, 0),
(435612, 19793, 57421, 191580, 925218, 0),
(435639, 415660, 41991, 923670, 877505, 0),
(436655, 2894, 2894, 995372, 938559, 0),
(437367, 51887, 2780, 536992, 19467, 0),
(437985, 2894, 2894, 56165, 781112, 0),
(438546, 146515, 85756, 621718, 201280, 0),
(440033, 19793, 10119, 775317, 49979, 0),
(440759, 2894, 2894, 191580, 787779, 0),
(440795, 660393, 510208, 45279, 417388, 0),
(440834, 0, 66885, 471147, 221183, 0),
(441669, 120155, 219693, 418191, 730632, 0),
(442123, 1701, 738682, 364152, 376730, 19),
(442274, 2894, 2894, 854037, 988328, 0),
(442519, 2894, 2894, 854037, 115831, 0),
(444219, 12375, 120155, 144676, 59778, 0),
(447688, 662493, 0, 15131, 40056, 14),
(449597, 244813, 30949, 611022, 514666, 0),
(450676, 65436, 193269, 891064, 835460, 0),
(452984, 143899, 65007, 364152, 359825, 3),
(456699, 189309, 284275, 370221, 330037, 0),
(456707, 415660, 148879, 923670, 737403, 0),
(457235, 19793, 30949, 932836, 795854, 0),
(458987, 2894, 2894, 818527, 128440, 0),
(459558, 243310, 791064, 205852, 189839, 0),
(460174, 313037, 57385, 536992, 432157, 0),
(462459, 2894, 2894, 932836, 415351, 0),
(463804, 41991, 415660, 923670, 456707, 0),
(464838, 44152, 19793, 901186, 207788, 0),
(465607, 172156, 193269, 56165, 982287, 0),
(467224, 655949, 122102, 44272, 956040, 0),
(469069, 415660, 41991, 826234, 211892, 0),
(471284, 101014, 729291, 364152, 79021, 16),
(471517, 2894, 2894, 854037, 558468, 0),
(474399, 2894, 2894, 932836, 737629, 0),
(474986, 85756, 172156, 418191, 710492, 0),
(475526, 292099, 243310, 370221, 16221, 0),
(476739, 0, 19793, 686265, 963544, 0),
(476889, 594834, 118993, 15131, 231578, 6),
(478076, 2894, 2894, 995372, 900549, 0),
(481320, 194561, 79057, 910082, 424858, 0),
(482619, 66885, 2894, 364152, 275014, 27),
(482754, 30949, 32714, 44272, 269202, 0),
(483929, 189309, 136138, 205852, 919656, 0),
(484222, 146504, 57385, 15131, 262265, 11),
(485448, 75408, 277802, 826234, 936640, 0),
(487722, 19793, 100227, 418191, 859606, 0),
(491115, 514508, 847571, 288173, 842059, 0),
(491316, 280665, 240136, 704129, 505628, 0),
(491894, 667076, 390267, 234663, 840105, 0),
(493134, 0, 181155, 536992, 128309, 0),
(493968, 962982, 842813, 418191, 525169, 0),
(494901, 2894, 2894, 818527, 360217, 0),
(495755, 2780, 44152, 910082, 957513, 0),
(496665, 30949, 10119, 826234, 156522, 0),
(498323, 10119, 191564, 205852, 911898, 0),
(501269, 77364, 77364, 288173, 895844, 0),
(502219, 193269, 172156, 932836, 672266, 0),
(503712, 30960, 30960, 263455, 300335, 0),
(505628, 240136, 146515, 704129, 755800, 0),
(506170, 161091, 394550, 826234, 42700, 0),
(506693, 65007, 143899, 910082, 714340, 0),
(507655, 30949, 32714, 234663, 722316, 0),
(507940, 219693, 12375, 826234, 647514, 0),
(509070, 369365, 231611, 418191, 956979, 0),
(509467, 0, 19793, 932836, 457235, 0),
(511496, 109097, 682262, 995372, 91532, 0),
(511998, 0, 19793, 995372, 261734, 0),
(514666, 30949, 251914, 611022, 421070, 0),
(514917, 0, 191564, 205852, 856388, 0),
(518183, 194561, 223542, 288173, 652468, 0),
(518520, 262533, 15353, 44272, 574670, 0),
(519593, 66885, 6772, 901186, 583220, 0),
(520930, 19793, 44152, 891064, 14938, 0),
(521393, 2894, 2894, 495609, 184895, 0),
(522829, 10991, 32714, 45279, 423301, 0),
(523480, 143096, 467563, 775317, 712250, 0),
(524884, 311177, 311177, 45279, 554335, 0),
(525169, 842813, 10119, 418191, 354183, 0),
(525530, 85756, 85756, 901186, 362834, 0),
(526262, 143899, 234981, 686265, 653864, 0),
(526376, 2894, 2894, 854037, 978491, 0),
(527956, 120155, 751238, 16694, 129603, 0),
(528399, 85756, 6772, 234663, 817962, 0),
(529473, 85597, 85597, 191580, 849187, 0),
(535602, 65436, 193269, 901186, 939755, 0),
(535818, 15353, 10991, 234663, 897759, 0),
(535837, 100227, 57421, 144676, 136530, 0),
(535972, 2894, 2894, 995372, 436655, 0),
(536953, 65436, 65436, 418191, 978695, 0),
(537124, 109097, 56974, 686265, 582037, 0),
(540111, 448246, 918607, 234663, 288577, 0),
(541512, 31159, 781516, 44272, 706203, 0),
(544207, 148879, 51887, 901186, 297316, 0),
(544586, 103388, 115776, 686265, 210389, 0),
(545953, 19793, 44152, 836632, 687555, 0),
(546157, 66885, 6772, 704129, 790146, 0),
(547025, 85756, 66885, 687288, 367608, 0),
(547331, 32714, 962982, 418191, 493968, 0),
(548402, 32714, 101014, 621718, 978778, 0),
(550855, 2894, 2894, 854037, 70908, 0),
(551462, 2780, 44152, 225142, 704569, 0),
(551940, 10119, 30949, 901186, 636636, 0),
(552342, 193269, 599565, 704129, 82794, 0),
(552492, 319722, 847571, 443955, 760463, 0),
(552712, 2780, 143096, 611022, 902194, 0),
(554335, 311177, 244813, 45279, 133456, 0),
(554454, 182060, 65007, 443955, 952319, 0),
(554982, 19793, 100227, 910082, 611207, 0),
(556249, 6772, 85756, 826234, 311653, 0),
(558463, 667076, 61461, 621718, 366440, 0),
(558468, 2894, 2894, 854037, 591346, 0),
(559106, 31159, 85756, 826234, 742888, 0),
(559321, 65436, 31159, 44272, 827416, 0),
(561973, 3792, 594834, 836632, 718473, 0),
(564559, 44152, 2780, 234663, 421598, 0),
(566665, 146515, 146515, 621718, 438546, 0),
(568003, 513785, 599565, 495609, 280382, 0),
(569655, 243310, 292099, 370221, 175734, 0),
(573081, 79057, 194561, 364152, 925349, 5),
(573434, 30949, 32714, 621718, 548402, 0),
(574670, 15353, 31159, 44272, 890660, 0),
(578027, 0, 19793, 818527, 691482, 0),
(578459, 291804, 31159, 910082, 771215, 5),
(580475, 319722, 433335, 191580, 624553, 0),
(581712, 115776, 6772, 621718, 270998, 0),
(582037, 56974, 54715, 686265, 404338, 0),
(582550, 172156, 193269, 704129, 312595, 0),
(583220, 6772, 6772, 901186, 416189, 0),
(585960, 2894, 2894, 932836, 848854, 0),
(586308, 115776, 13032, 443955, 607340, 0),
(587971, 15353, 10991, 225142, 940830, 0),
(588066, 13032, 115776, 443955, 116260, 0),
(591270, 66885, 101014, 687288, 638387, 0),
(591346, 2894, 2894, 854037, 23699, 0),
(592192, 2894, 2894, 854037, 150381, 0),
(592324, 0, 19793, 611022, 177415, 0),
(593952, 849435, 236333, 418191, 178903, 0),
(598213, 433335, 85597, 191580, 529473, 0),
(598657, 6772, 18782, 225142, 222259, 0),
(599090, 2894, 2894, 854037, 712328, 0),
(601581, 65436, 85756, 653481, 310980, 0),
(601981, 2780, 44152, 901186, 464838, 0),
(602656, 146515, 146515, 621718, 90271, 0),
(602773, 2894, 2894, 995372, 382989, 0),
(605399, 79057, 59835, 191580, 79655, 0),
(605733, 143096, 57421, 63346, 279713, 0),
(605761, 61461, 667076, 621718, 64895, 0),
(606045, 65436, 291804, 910082, 578459, 4),
(607340, 13032, 34130, 443955, 297236, 0),
(609893, 148879, 51887, 536992, 437367, 0),
(611207, 100227, 57421, 910082, 134103, 0),
(611898, 3792, 713057, 775317, 224851, 0),
(612202, 135642, 1701, 364152, 442123, 18),
(612888, 2894, 2894, 191580, 852162, 0),
(616811, 194561, 44991, 144676, 713657, 0),
(616969, 30949, 32714, 891064, 47779, 0),
(620994, 533308, 148879, 606401, 5694, 0),
(623231, 19793, 44152, 923670, 235632, 0),
(623674, 31159, 871117, 44272, 409399, 0),
(623705, 225109, 590944, 370221, 776781, 0),
(624357, 520522, 467563, 775317, 337614, 0),
(624553, 433335, 710904, 191580, 758669, 0),
(624832, 218467, 30960, 263455, 938806, 0),
(625046, 2894, 2894, 495609, 32876, 0),
(626325, 0, 483490, 364152, 805017, 1),
(626581, 483490, 85756, 418191, 474986, 0),
(627734, 791064, 243310, 205852, 60948, 0),
(628747, 0, 19793, 263455, 657608, 0),
(629049, 233760, 354986, 63346, 250547, 0),
(631079, 18782, 65436, 56165, 934499, 0),
(633117, 2894, 2894, 854037, 154668, 0),
(633165, 2894, 2894, 818527, 494901, 0),
(633832, 272032, 624811, 536992, 896777, 0),
(633851, 2894, 2894, 854037, 850232, 0),
(635536, 30949, 32714, 826234, 419959, 0),
(636209, 120155, 148879, 536992, 609893, 0),
(636636, 30949, 32714, 901186, 818723, 0),
(636729, 18782, 65436, 910082, 606045, 3),
(636761, 281359, 61461, 621718, 605761, 0),
(636882, 2894, 2894, 932836, 308735, 0),
(638387, 101014, 31159, 687288, 930658, 0),
(638884, 13046, 96821, 144676, 737168, 0),
(644135, 57421, 194561, 623073, 102076, 0),
(646720, 19793, 10119, 826234, 241294, 0),
(646986, 59144, 19793, 288173, 619251, 0),
(647514, 12375, 161091, 826234, 506170, 0),
(647663, 57421, 10119, 63346, 303165, 0),
(648308, 2894, 2894, 495609, 521393, 0),
(648841, 44152, 2780, 611022, 552712, 0),
(649689, 44152, 2780, 364152, 124728, 10),
(652313, 489359, 847571, 288173, 915702, 0),
(652354, 244813, 30949, 364152, 917055, 13),
(652411, 36136, 655949, 910082, 949118, 0),
(652468, 223542, 514508, 288173, 491115, 0),
(652786, 2894, 2894, 932836, 46454, 0),
(653263, 870156, 596255, 910082, 349731, 0),
(653864, 234981, 143899, 686265, 727869, 0),
(655258, 44991, 59144, 144676, 562008, 0),
(657608, 19793, 66860, 263455, 377788, 0),
(659285, 291804, 193269, 495609, 239083, 0),
(659863, 65436, 2894, 854037, 633851, 0),
(664328, 65436, 2894, 239110, 903864, 0),
(665530, 733641, 511504, 288173, 232026, 0),
(668696, 100227, 57421, 288173, 232607, 0),
(669297, 163822, 225109, 370221, 623705, 0),
(671094, 103805, 965795, 370221, 401956, 0),
(672266, 172156, 85756, 932836, 387690, 0),
(672660, 2894, 2894, 495609, 410864, 0),
(673017, 172156, 85756, 364152, 200180, 24),
(673090, 624811, 662493, 15131, 447688, 13),
(673811, 31159, 15353, 45279, 925042, 0),
(674463, 143096, 2780, 44272, 302487, 0),
(675626, 2894, 2894, 932836, 296748, 0),
(676263, 148879, 415660, 923670, 435639, 0),
(676921, 18782, 31159, 471147, 934908, 0),
(677678, 655949, 594834, 15131, 476889, 5),
(678108, 599565, 74510, 653481, 242953, 0),
(679893, 458627, 218467, 263455, 624832, 0),
(682168, 2894, 2894, 932836, 585960, 0),
(682385, 101014, 262533, 234663, 429582, 0),
(682899, 2894, 2894, 818527, 294145, 0),
(684682, 0, 19793, 370221, 825772, 0),
(686722, 2894, 2894, 854037, 592192, 0),
(687555, 44152, 2780, 836632, 725237, 0),
(688940, 353570, 458627, 263455, 679893, 0),
(690843, 41991, 243020, 836632, 529787, 0),
(691482, 19793, 2894, 818527, 14870, 0),
(694122, 758529, 155780, 775317, 416717, 0),
(695244, 31159, 291804, 704129, 86211, 0),
(695535, 51887, 2780, 910082, 495755, 0),
(695830, 2780, 44152, 234663, 945704, 0),
(696171, 44152, 19793, 471147, 416571, 0),
(697954, 44152, 19793, 44272, 701363, 0),
(699956, 0, 41991, 16694, 341210, 0),
(701005, 12375, 12375, 144676, 444219, 0),
(701639, 101014, 262533, 901186, 120901, 0),
(701805, 193269, 65436, 901186, 175992, 0),
(702906, 41991, 415660, 901186, 195331, 0),
(706061, 136212, 752728, 621718, 254461, 0),
(706203, 781516, 31159, 44272, 623674, 0),
(710247, 189309, 103805, 370221, 671094, 0),
(710492, 172156, 193269, 418191, 309676, 0),
(712250, 467563, 576221, 775317, 19197, 0),
(712328, 2894, 2894, 854037, 868845, 0),
(713449, 96821, 13046, 144676, 726946, 0),
(713600, 85756, 18782, 901186, 325340, 0),
(713605, 0, 66885, 653481, 819521, 0),
(713657, 44991, 277802, 144676, 102323, 0),
(713946, 223542, 59144, 288173, 646986, 0),
(714340, 143899, 483490, 910082, 832124, 0),
(714986, 109097, 30949, 471147, 248684, 0),
(718473, 594834, 202130, 836632, 867148, 0),
(722316, 32714, 101014, 234663, 682385, 0),
(722649, 51887, 2780, 923670, 299007, 0),
(724578, 2894, 2894, 932836, 882595, 0),
(724835, 200800, 65436, 932836, 40396, 0),
(725094, 0, 19793, 234663, 896109, 0),
(725237, 2780, 143096, 836632, 822398, 0),
(726946, 13046, 146504, 144676, 53898, 0),
(727869, 143899, 483490, 686265, 334325, 0),
(729695, 861921, 311177, 45279, 524884, 0),
(730632, 219693, 96821, 418191, 335673, 0),
(733090, 163822, 469750, 370221, 879674, 0),
(733110, 30949, 143096, 234663, 214777, 0),
(734863, 6772, 66885, 686265, 923103, 0),
(737168, 96821, 303620, 144676, 82783, 0),
(737335, 148731, 2894, 191580, 851503, 0),
(737403, 148879, 51887, 923670, 722649, 0),
(737629, 2894, 2894, 932836, 652786, 0),
(739557, 143096, 2780, 471147, 758722, 0),
(742888, 18782, 65436, 826234, 899135, 0),
(742899, 163822, 791064, 205852, 627734, 0),
(744052, 57421, 100227, 364152, 776182, 7),
(747665, 58283, 758529, 775317, 694122, 0),
(749227, 18782, 85756, 471147, 407889, 0),
(752057, 218467, 258435, 263455, 431351, 0),
(753262, 172156, 193269, 471147, 419877, 0),
(755800, 146515, 18782, 704129, 28615, 0),
(756200, 208214, 280665, 704129, 491316, 0),
(756286, 2894, 2894, 818527, 321364, 0),
(757136, 79057, 182060, 623073, 142057, 0),
(757618, 234981, 59835, 443955, 89865, 0),
(758669, 710904, 912590, 191580, 338595, 0),
(758722, 2780, 44152, 471147, 696171, 0),
(760463, 847571, 595275, 443955, 210906, 0),
(760689, 65436, 36136, 44272, 878252, 0),
(766670, 0, 19793, 775317, 440033, 0),
(766779, 148879, 81662, 370221, 960434, 0),
(769502, 44152, 2780, 621718, 401250, 0),
(769682, 31159, 18782, 891064, 899470, 0),
(770290, 66885, 65436, 15131, 883390, 2),
(770638, 85756, 172156, 704129, 582550, 0),
(771215, 31159, 36136, 910082, 652411, 0),
(771569, 66885, 18782, 56165, 330354, 0),
(771901, 161091, 394550, 16694, 378337, 0),
(775507, 18782, 146515, 234663, 163852, 0),
(775774, 517389, 51887, 910082, 695535, 0),
(775924, 3792, 487315, 910082, 779693, 0),
(776182, 100227, 19793, 364152, 794556, 8),
(776781, 590944, 278229, 370221, 980214, 0),
(777103, 18782, 66885, 826234, 30562, 0),
(777113, 590944, 225109, 370221, 957536, 0),
(778709, 120155, 44991, 826234, 167421, 0),
(779693, 487315, 118993, 910082, 955941, 0),
(780522, 207433, 513785, 495609, 568003, 0),
(782148, 729291, 262533, 418191, 112418, 0),
(783363, 65436, 291804, 45279, 974064, 0),
(783553, 115776, 6772, 234663, 870528, 0),
(786223, 31159, 291804, 495609, 659285, 0),
(787779, 2894, 2894, 191580, 593729, 0),
(787853, 290428, 448246, 234663, 540111, 0),
(790146, 6772, 18782, 704129, 359004, 0),
(790823, 34130, 94221, 686265, 150248, 0),
(791831, 2894, 2894, 995372, 951632, 0),
(793686, 65436, 193269, 932836, 502219, 0),
(794556, 19793, 44152, 364152, 649689, 9),
(795467, 667076, 115776, 234663, 783553, 0),
(795854, 30949, 32714, 932836, 967938, 0),
(796073, 400227, 66661, 288173, 212576, 0),
(796830, 193269, 65436, 826234, 284779, 0),
(797271, 240136, 773873, 653481, 328864, 0),
(800038, 251914, 109097, 471147, 714986, 0),
(801468, 2894, 2894, 854037, 336045, 0),
(802376, 65436, 18782, 56165, 631079, 0),
(805017, 483490, 143899, 364152, 452984, 2),
(805185, 355396, 208214, 704129, 756200, 0),
(807161, 120155, 751238, 16694, 168892, 0),
(807186, 277802, 120155, 901186, 431648, 0),
(807731, 0, 489893, 495609, 922259, 0),
(810116, 13032, 94221, 623073, 876461, 0),
(810617, 10991, 30949, 901186, 78806, 0),
(810773, 100227, 57421, 623073, 644135, 0),
(812828, 148879, 415660, 826234, 469069, 0),
(817619, 219693, 185543, 923670, 248578, 0),
(817962, 6772, 115776, 234663, 82926, 0),
(818723, 32714, 101014, 901186, 701639, 0),
(819173, 204448, 290428, 234663, 197972, 0),
(819521, 66885, 53386, 653481, 950056, 0),
(821823, 15353, 31159, 901186, 69533, 0),
(822398, 143096, 95662, 836632, 987774, 0),
(822818, 307858, 861921, 45279, 729695, 0),
(822856, 683767, 290428, 234663, 787853, 0),
(822992, 212576, 19793, 370221, 951126, 0),
(825772, 19793, 212576, 370221, 984262, 0),
(827138, 231611, 400227, 288173, 796073, 0),
(827416, 31159, 15353, 44272, 203704, 0),
(828532, 13032, 103388, 686265, 544586, 0),
(830251, 2894, 2894, 932836, 464327, 0),
(834059, 15353, 10991, 826234, 272275, 0),
(835460, 193269, 172156, 891064, 994928, 0),
(835925, 10991, 30949, 621718, 340031, 0),
(837339, 10119, 19793, 205852, 177177, 0),
(840105, 390267, 683767, 234663, 822856, 0),
(842059, 847571, 733641, 288173, 665530, 0),
(843268, 65436, 193269, 364152, 186265, 22),
(845873, 54715, 13032, 623073, 810116, 0),
(848854, 2894, 2894, 932836, 474399, 0),
(849187, 85597, 148731, 191580, 737335, 0),
(850232, 2894, 2894, 854037, 319253, 0),
(851503, 2894, 2894, 191580, 612888, 0),
(851521, 65436, 65436, 364152, 843268, 21),
(851587, 0, 83238, 56165, 413928, 0),
(852162, 2894, 2894, 191580, 65719, 0),
(853343, 193269, 172156, 826234, 280042, 0),
(853987, 57421, 384211, 686265, 387485, 0),
(854144, 65436, 31159, 704129, 695244, 0),
(855614, 657733, 307858, 45279, 822818, 0),
(856170, 438771, 143096, 225142, 206846, 0),
(856277, 85756, 18782, 891064, 199757, 0),
(856388, 191564, 10119, 205852, 837339, 0),
(856834, 65436, 31159, 495609, 786223, 0),
(857793, 18782, 30960, 653481, 405854, 0),
(859191, 0, 146504, 239110, 868800, 1),
(859606, 100227, 57421, 418191, 390969, 0),
(859917, 2894, 2894, 854037, 897666, 0),
(860032, 136212, 667076, 621718, 558463, 0),
(861280, 101014, 262533, 826234, 168952, 0),
(863684, 2894, 2894, 854037, 357301, 0),
(863870, 2894, 2894, 995372, 229504, 0),
(865975, 2780, 44152, 621718, 221066, 0),
(867148, 202130, 41991, 836632, 262325, 0),
(868800, 146504, 408663, 239110, 130222, 2),
(868845, 2894, 2894, 854037, 859917, 0),
(868894, 10991, 30949, 44272, 172281, 0),
(869403, 0, 41991, 606401, 209923, 0),
(870528, 6772, 18782, 234663, 775507, 0),
(871613, 251914, 109097, 686265, 537124, 0),
(876461, 94221, 34130, 623073, 830740, 0),
(877505, 41991, 219693, 923670, 817619, 0),
(878252, 36136, 741587, 44272, 966787, 0),
(879610, 19793, 44152, 44272, 45421, 0),
(879674, 469750, 163822, 370221, 669297, 0),
(881066, 2894, 2894, 854037, 801468, 0),
(882595, 2894, 2894, 932836, 830251, 0),
(883390, 65436, 738682, 15131, 276634, 3),
(884383, 44991, 75408, 826234, 485448, 0),
(889084, 19793, 44152, 826234, 282319, 0),
(890660, 31159, 65436, 44272, 760689, 0),
(892711, 12375, 219693, 901186, 266755, 0),
(895844, 77364, 66661, 288173, 381594, 0),
(896109, 19793, 44152, 234663, 564559, 0),
(896777, 624811, 313037, 536992, 460174, 0),
(897535, 10119, 19793, 775317, 605853, 0),
(897666, 2894, 2894, 854037, 321153, 0),
(897701, 77364, 489359, 288173, 652313, 0),
(897759, 10991, 30949, 234663, 733110, 0),
(899135, 65436, 193269, 826234, 853343, 0),
(899470, 18782, 65436, 891064, 450676, 0),
(900549, 2894, 2894, 995372, 141076, 0),
(901230, 32714, 101014, 364152, 471284, 15),
(902194, 143096, 244813, 611022, 449597, 0),
(903435, 2894, 2894, 854037, 40380, 0),
(905660, 394550, 120155, 16694, 527956, 0),
(910209, 2894, 2894, 932836, 45909, 0),
(914683, 262533, 15353, 932836, 184974, 0),
(915702, 847571, 514508, 288173, 347750, 0),
(917055, 30949, 32714, 364152, 901230, 14),
(917125, 0, 19793, 144676, 386898, 0),
(917390, 161091, 12375, 901186, 892711, 0),
(919656, 136138, 163822, 205852, 742899, 0),
(919960, 148879, 146515, 225142, 946331, 0),
(921859, 194561, 79057, 191580, 605399, 0),
(922039, 41991, 120155, 536992, 636209, 0),
(922259, 489893, 30960, 495609, 23268, 0),
(923103, 66885, 18782, 686265, 968037, 0),
(925042, 15353, 10991, 45279, 522829, 0),
(925218, 57421, 194561, 191580, 921859, 0),
(925349, 194561, 57421, 364152, 744052, 6),
(928200, 2894, 2894, 995372, 382894, 0),
(928633, 44991, 490769, 546451, 457070, 0),
(929451, 19793, 100227, 623073, 810773, 0),
(930658, 31159, 116357, 687288, 354138, 0),
(932357, 594834, 3792, 910082, 775924, 0),
(934499, 65436, 2894, 56165, 437985, 0),
(934908, 31159, 15353, 471147, 335192, 0),
(936542, 0, 66885, 443955, 419288, 0),
(936587, 0, 19793, 623073, 929451, 0),
(936640, 277802, 120155, 826234, 778709, 0),
(936907, 2894, 2894, 495609, 296125, 0),
(938559, 2894, 2894, 995372, 122402, 0),
(938806, 30960, 30960, 263455, 314213, 0),
(938890, 170862, 139483, 606401, 430908, 0),
(939755, 193269, 172156, 901186, 199305, 0),
(940830, 10991, 438771, 225142, 856170, 0),
(942661, 148879, 394550, 418191, 315666, 0),
(945704, 44152, 19793, 234663, 651380, 0),
(946331, 146515, 15353, 225142, 587971, 0),
(946461, 31159, 15353, 901186, 84612, 0),
(947727, 0, 19793, 44272, 879610, 0),
(947772, 390267, 667076, 234663, 795467, 0),
(949118, 655949, 510208, 910082, 987779, 0),
(949506, 34130, 13032, 443955, 588066, 0),
(950056, 53386, 280665, 653481, 410801, 0),
(951632, 2894, 2894, 995372, 535972, 0),
(952319, 65007, 234981, 443955, 141040, 0),
(953238, 217260, 41991, 16694, 456385, 0),
(953789, 122102, 31159, 44272, 541512, 0),
(955551, 143096, 30949, 891064, 616969, 0),
(955941, 118993, 244242, 910082, 293689, 0),
(956040, 122102, 741587, 44272, 155472, 0),
(957513, 44152, 19793, 910082, 554982, 0),
(957536, 225109, 148879, 370221, 766779, 0),
(957996, 185543, 170862, 606401, 938890, 0),
(958264, 100227, 57421, 686265, 853987, 0),
(960434, 81662, 189309, 370221, 710247, 0),
(961802, 2894, 2894, 854037, 100144, 0),
(963544, 19793, 100227, 686265, 958264, 0),
(964955, 0, 65436, 854037, 659863, 0),
(966787, 741587, 122102, 44272, 953789, 0),
(967938, 32714, 262533, 932836, 914683, 0),
(968037, 18782, 2894, 686265, 119016, 0),
(970870, 12375, 146504, 144676, 313100, 0),
(971199, 921150, 96821, 144676, 713449, 0),
(974064, 291804, 31159, 45279, 673811, 0),
(978491, 2894, 2894, 854037, 550855, 0),
(978695, 65436, 1701, 418191, 100125, 0),
(978778, 101014, 262533, 621718, 107575, 0),
(980214, 278229, 243310, 370221, 569655, 0),
(982287, 193269, 65436, 56165, 802376, 0),
(984262, 212576, 292099, 370221, 475526, 0),
(987774, 95662, 3792, 836632, 561973, 0),
(987779, 510208, 870156, 910082, 653263, 0),
(994918, 94221, 34130, 686265, 127023, 0),
(994928, 172156, 85756, 891064, 856277, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `id` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `nome` varchar(256) NOT NULL,
  `cognome` varchar(256) DEFAULT NULL,
  `psw` varchar(256) NOT NULL,
  `professione` varchar(256) DEFAULT NULL,
  `anno_nascita` varchar(256) DEFAULT NULL,
  `telefono1` varchar(20) DEFAULT NULL,
  `telefono2` varchar(20) DEFAULT NULL,
  `biografia` varchar(256) NOT NULL DEFAULT 'L''utente non ha ancora inserito una biografia',
  `foto_utente` varchar(256) DEFAULT 'https://www.dropbox.com/s/ht1ik2uygkjea3u/profile?raw=1',
  `image_path` varchar(256) DEFAULT '/immagine-profilo/profile',
  `sesso` varchar(7) DEFAULT NULL,
  `fumare` int(11) DEFAULT NULL,
  `animali` int(11) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `media_feedback` double DEFAULT '0',
  `data` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`id`, `email`, `nome`, `cognome`, `psw`, `professione`, `anno_nascita`, `telefono1`, `telefono2`, `biografia`, `foto_utente`, `image_path`, `sesso`, `fumare`, `animali`, `tipo`, `media_feedback`, `data`) VALUES
('a87c3400-14ef-48b0-b198-1782d2ee2eb9', 'master_94@virgilio.it', 'Leonardo', 'Ruggeri', 'D73AzyBnRpR5b2VClNCr8w==', 'asdf', '1994-01-25 00:00:00', '3332057204', NULL, 'L''utente non ha ancora inserito una biografia', 'https://www.dropbox.com/s/ht1ik2uygkjea3u/profile?raw=1', '/immagine-profilo/profile', 'male', NULL, NULL, 2, 0, '2018-02-07 15:43:12');

-- --------------------------------------------------------

--
-- Struttura della tabella `utente_tipologia`
--

CREATE TABLE `utente_tipologia` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `utente_tipologia`
--

INSERT INTO `utente_tipologia` (`id`, `descrizione`) VALUES
(0, 'Utente ospite'),
(1, 'Utente registrato'),
(2, 'Utente amministratore'),
(3, 'Utente non confermato');

-- --------------------------------------------------------

--
-- Struttura della tabella `viaggio_auto`
--

CREATE TABLE `viaggio_auto` (
  `id` varchar(256) NOT NULL,
  `auto` varchar(256) DEFAULT NULL,
  `descrizione` varchar(256) DEFAULT NULL,
  `ritardo_max` varchar(256) DEFAULT NULL,
  `bagaglio_max` varchar(256) DEFAULT NULL,
  `disponibilita_deviazioni` varchar(256) DEFAULT NULL,
  `ripetitivo` int(11) DEFAULT '0',
  `utente_fk` varchar(256) NOT NULL,
  `data` varchar(256) NOT NULL,
  `tipologia` int(11) NOT NULL DEFAULT '0',
  `visibile` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `viaggio_autobus`
--

CREATE TABLE `viaggio_autobus` (
  `id` int(11) NOT NULL,
  `nome` varchar(256) DEFAULT NULL,
  `inverso` int(11) DEFAULT NULL,
  `data` datetime DEFAULT '1999-12-31 02:00:00',
  `storico_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `viaggio_autobus`
--

INSERT INTO `viaggio_autobus` (`id`, `nome`, `inverso`, `data`, `storico_fk`) VALUES
(15131, 'M6F', NULL, '1999-12-31 02:00:00', 854953),
(16694, 'M6B', NULL, '1999-12-31 02:00:00', 854953),
(44272, '15', NULL, '1999-12-31 02:00:00', 854953),
(45279, '4', NULL, '1999-12-31 02:00:00', 854953),
(56165, 'M12X', NULL, '1999-12-31 02:00:00', 854953),
(63346, 'M17', NULL, '1999-12-31 02:00:00', 854953),
(144676, '16A', NULL, '1999-12-31 02:00:00', 854953),
(191580, '10', NULL, '1999-12-31 02:00:00', 854953),
(205852, '5F', NULL, '1999-12-31 02:00:00', 854953),
(225142, '2', NULL, '1999-12-31 02:00:00', 854953),
(234663, '12', NULL, '1999-12-31 02:00:00', 854953),
(239110, 'M6H', NULL, '1999-12-31 02:00:00', 854953),
(263455, '13', NULL, '1999-12-31 02:00:00', 854953),
(288173, '1', NULL, '1999-12-31 02:00:00', 854953),
(364152, '1R', NULL, '1999-12-31 02:00:00', 854953),
(370221, '5', NULL, '1999-12-31 02:00:00', 854953),
(418191, 'M16F', NULL, '1999-12-31 02:00:00', 854953),
(443955, 'M11F', NULL, '1999-12-31 02:00:00', 854953),
(471147, '2UT', NULL, '1999-12-31 02:00:00', 854953),
(495609, '14D', NULL, '1999-12-31 02:00:00', 854953),
(536992, 'M6', NULL, '1999-12-31 02:00:00', 854953),
(546451, 'M16B', NULL, '1999-12-31 02:00:00', 854953),
(606401, 'M7A', NULL, '1999-12-31 02:00:00', 854953),
(611022, '11T', NULL, '1999-12-31 02:00:00', 854953),
(621718, '12A', NULL, '1999-12-31 02:00:00', 854953),
(623073, '11', NULL, '1999-12-31 02:00:00', 854953),
(653481, 'M14F', NULL, '1999-12-31 02:00:00', 854953),
(686265, 'M11R', NULL, '1999-12-31 02:00:00', 854953),
(687288, 'M15F', NULL, '1999-12-31 02:00:00', 854953),
(704129, '14S', NULL, '1999-12-31 02:00:00', 854953),
(775317, '8', NULL, '1999-12-31 02:00:00', 854953),
(818527, 'M18', NULL, '1999-12-31 02:00:00', 854953),
(826234, '6D', NULL, '1999-12-31 02:00:00', 854953),
(836632, '9', NULL, '1999-12-31 02:00:00', 854953),
(854037, 'M13A', NULL, '1999-12-31 02:00:00', 854953),
(891064, '2U', NULL, '1999-12-31 02:00:00', 854953),
(901186, '6S', NULL, '1999-12-31 02:00:00', 854953),
(910082, '3R', NULL, '1999-12-31 02:00:00', 854953),
(923670, '7', NULL, '1999-12-31 02:00:00', 854953),
(932836, '2F', NULL, '1999-12-31 02:00:00', 854953),
(995372, '19', NULL, '1999-12-31 02:00:00', 854953);

-- --------------------------------------------------------

--
-- Struttura della tabella `viaggio_auto_tipologia`
--

CREATE TABLE `viaggio_auto_tipologia` (
  `id` int(11) NOT NULL,
  `valore` varchar(256) NOT NULL,
  `descrizione` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `viaggio_auto_tipologia`
--

INSERT INTO `viaggio_auto_tipologia` (`id`, `valore`, `descrizione`) VALUES
(0, 'Viaggio corto', 'Viaggio di una distanza inferiore a 30km'),
(1, 'Viaggio lungo', 'Viaggio di una distanza superiorea 30km');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UTENTE1FEEDB` (`utente_recensore`),
  ADD KEY `UTENTE2FEEDB` (`utente_recensito`);

--
-- Indici per le tabelle `messaggio`
--
ALTER TABLE `messaggio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `VIAGGIMESSAG` (`viaggio`),
  ADD KEY `UTENTEMESSAG` (`utente`);

--
-- Indici per le tabelle `notifica`
--
ALTER TABLE `notifica`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `notifica_stato`
--
ALTER TABLE `notifica_stato`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `notifica_tipologia`
--
ALTER TABLE `notifica_tipologia`
  ADD PRIMARY KEY (`id_tipologia`);

--
-- Indici per le tabelle `posizione`
--
ALTER TABLE `posizione`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `relazione`
--
ALTER TABLE `relazione`
  ADD PRIMARY KEY (`utente_1`,`utente_2`),
  ADD KEY `UTENTE1RELAZ` (`utente_1`),
  ADD KEY `UTENTE2RELAZ` (`utente_2`);

--
-- Indici per le tabelle `relazione_approvato`
--
ALTER TABLE `relazione_approvato`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `relazione_da_valutare`
--
ALTER TABLE `relazione_da_valutare`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ricerca`
--
ALTER TABLE `ricerca`
  ADD PRIMARY KEY (`id`);


--
-- Indici per le tabelle `tratta_auto`
--
ALTER TABLE `tratta_auto`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tratta_autobus`
--
ALTER TABLE `tratta_autobus`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indici per le tabelle `utente_tipologia`
--
ALTER TABLE `utente_tipologia`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `viaggio_auto`
--
ALTER TABLE `viaggio_auto`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `viaggio_autobus`
--
ALTER TABLE `viaggio_autobus`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `viaggio_auto_tipologia`
--
ALTER TABLE `viaggio_auto_tipologia`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `messaggio`
--
ALTER TABLE `messaggio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `viaggio_autobus`
--
ALTER TABLE `viaggio_autobus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=995373;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
