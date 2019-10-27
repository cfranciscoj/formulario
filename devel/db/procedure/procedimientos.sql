# Titulo
DROP PROCEDURE IF EXISTS buscar_titulo;

DELIMITER $$

CREATE PROCEDURE buscar_titulo()
BEGIN

	SELECT cab.titulo      AS titulo,
	       cab.id_pla_cab  AS id_titulo
	  FROM frm_plantilla_cab cab;

END

DELIMITER $$

#Agrupación
DROP PROCEDURE IF EXISTS buscar_agrupacion;

DELIMITER $$

CREATE PROCEDURE buscar_agrupacion(par_ide_titulo INT)
BEGIN

	SELECT det.id_pla_det  AS ide_agrupacion,
	       det.id_pla_cab  AS ide_titulo,
	       det.etiqueta    AS agrupacion,
	       val.cod_tpo_val AS tpo_val_agrupacion
	  FROM frm_plantilla_det det
	 INNER
	  JOIN frm_tipo_valor val
	    ON det.id_tpo_val = val.id_tpo_val    
	 WHERE det.id_pla_det_pdr = 0
	   AND det.id_pla_cab = par_ide_titulo;

END

DELIMITER $$

#Etiqueta
DROP PROCEDURE IF EXISTS buscar_etiqueta;

DELIMITER $$

CREATE PROCEDURE buscar_etiqueta(par_ide_agrupacion INT)
BEGIN

	SELECT det.id_pla_det     AS ide_etiqueta,
	       det.id_pla_det_pdr AS ide_agrupacion,
	       det.etiqueta       AS etiqueta,
	       val.cod_tpo_val    AS tpo_val_etiqueta
	  FROM frm_plantilla_det det
	 INNER
	  JOIN frm_tipo_valor val
	    ON det.id_tpo_val = val.id_tpo_val    
	 WHERE det.id_pla_det_pdr = par_ide_agrupacion;

END

DELIMITER $$

