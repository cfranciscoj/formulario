# Respuesta por día
SELECT count(1), 
       DATE_FORMAT(res.fch_crea, '%d-%m-%Y') as fecha
  FROM frm_resultado_det res
 GROUP
    BY DATE_FORMAT(res.fch_crea, '%d-%m-%Y')
       
SELECT SUM(t1.formulario) as tot_form,
       DATE_FORMAT(t1.fecha, '%d-%m-%Y') as fecha
  FROM (SELECT 1 as formulario, 
		       res.fch_crea as fecha
		  FROM frm_resultado_det res
		 GROUP
		    BY res.fch_crea) as t1
 GROUP
    BY DATE_FORMAT(t1.fecha, '%d-%m-%Y')



#Busca la Cabecera
SELECT cab.titulo      AS titulo,
       cab.id_pla_cab  AS id_cabecera
  FROM frm_plantilla_cab cab

#Busca las agrupaciones
SELECT det.id_pla_det  AS ide_agrupacion,
       det.id_pla_cab  AS ide_cabecera,
       det.etiqueta    AS agrupacion,
       val.cod_tpo_val AS tpo_val_agrupacion
  FROM frm_plantilla_det det
 INNER
  JOIN frm_tipo_valor val
    ON det.id_tpo_val = val.id_tpo_val    
 WHERE det.id_pla_det_pdr = 0
   AND det.id_pla_cab = 8

#Busca las etiquetas
SELECT det.id_pla_det     AS ide_etiqueta,
       det.id_pla_det_pdr AS ide_padre,
       det.etiqueta       AS etiqueta,
       val.cod_tpo_val    AS tpo_val_etiqueta
  FROM frm_plantilla_det det
 INNER
  JOIN frm_tipo_valor val
    ON det.id_tpo_val = val.id_tpo_val    
 WHERE det.id_pla_det_pdr = 11
   