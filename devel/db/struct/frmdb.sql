CREATE TABLE `frm_tipo_valor` (
  `id_tpo_val` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_tpo_val` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_largo` varchar(200) COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nom_corto` varchar(100) COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fch_crea` datetime DEFAULT current_timestamp(),
  `usr_crea` int(10) unsigned,
  `fch_mod` timestamp NULL DEFAULT NULL,
  `usr_mod` int(10) unsigned,
  PRIMARY KEY (`id_tpo_val`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `frm_plantilla_cab` (
  `id_pla_cab` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripicion` text COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fch_crea` datetime DEFAULT current_timestamp(),
  `usr_crea` int(10) unsigned,
  `fch_mod` timestamp NULL DEFAULT NULL,
  `usr_mod` int(10) unsigned,
  PRIMARY KEY (`id_pla_cab`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `frm_plantilla_det` (
  `id_pla_det` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pla_cab` int(10) unsigned NOT NULL,
  `etiqueta` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_corto` varchar(200) COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_tpo_val` int(10) unsigned NOT NULL,
  `id_pla_det_pdr` int(10) unsigned NOT NULL,
  `fch_crea` datetime DEFAULT current_timestamp(),
  `usr_crea` int(10) unsigned,
  `fch_mod` timestamp NULL DEFAULT NULL,
  `usr_mod` int(10) unsigned,
  PRIMARY KEY (`id_pla_det`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `frm_resultado_det` (
  `id_res_det` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pla_det` int(10) unsigned NOT NULL,
  `res_valor` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `res_nro_valor` int(10) unsigned NULL DEFAULT NULL,
  `fch_crea` datetime DEFAULT current_timestamp(),
  `usr_crea` int(10) unsigned,
  `fch_mod` timestamp NULL DEFAULT NULL,
  `usr_mod` int(10) unsigned,
  PRIMARY KEY (`id_res_det`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



