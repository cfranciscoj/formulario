/* Resumen por formulario */
SELECT t1.res_formulario     AS nro_formulario,
       t1.formulario         AS nom_formulario,
       t1.cant_resp          AS cant_resp,
       t2.cant_resp_por_form AS resp_posibles_form_individual,
       SUM(t1.cant_resp) OVER (partition by t1.formulario) AS tot_resp_por_form,
       COUNT(1)  OVER (partition by t1.formulario) AS tot_form_con_resp,
	   (SUM(t1.cant_resp) over (partition by t1.formulario))/(COUNT(1)  OVER (partition by t1.formulario)) as prom_resp_por_form,
	   (t1.cant_resp * 100)/(t2.cant_resp_por_form) AS porcentaje_fila,
	   (t1.cant_resp * 100)/(SUM(t1.cant_resp) OVER (partition by t1.formulario)) AS porcentaje_total
  FROM (SELECT count(1) as cant_resp, 
               resdet.res_formulario,
               placab.titulo as formulario,
               placab.id_pla_cab as id_pla_cab
          FROM frm_resultado_det resdet
         INNER
          JOIN frm_plantilla_det pladet
            ON resdet.id_pla_det = pladet.id_pla_det
         INNER
          JOIN frm_plantilla_cab placab
            ON pladet.id_pla_cab = placab.id_pla_cab
         GROUP 
            BY resdet.res_formulario,
               placab.titulo) t1
 INNER
  JOIN (SELECT count(1) as cant_resp_por_form, 
               placab.titulo as formulario,
               placab.id_pla_cab		   
          FROM frm_plantilla_det pladet
         INNER
          JOIN frm_plantilla_cab placab
            ON pladet.id_pla_cab = placab.id_pla_cab
         INNER
          JOIN frm_tipo_valor tipfrm
            ON tipfrm.id_tpo_val = pladet.id_tpo_val
         WHERE cod_tpo_val != 'ETQ'			
         GROUP 
            BY placab.titulo,
               placab.id_pla_cab) as t2
    ON t1.id_pla_cab = t2.id_pla_cab               
 ORDER
    BY t1.cant_resp DESC
 LIMIT 4;
              
              
select t1.formulario,
       sum(t1.cant_resp) as tot_resp_por_form, 
       t2.cant_resp_por_form * count(1) tot_resp_posibles,
       t2.cant_resp_por_form as pregunstas_por_formularios,
	   count(1) as tot_form_con_resp,
	   sum(t1.cant_resp)/count(1) as prom_resp_por_form,
	   (sum(t1.cant_resp) * 100)/(t2.cant_resp_por_form * count(1)) as porcentaje
  from (select count(1) as cant_resp, 
               resdet.res_formulario,
               placab.titulo as formulario,
			   placab.id_pla_cab as id_pla_cab
          from frm_resultado_det resdet
         inner
          join frm_plantilla_det pladet
            on resdet.id_pla_det = pladet.id_pla_det
         inner
          join frm_plantilla_cab placab
            on pladet.id_pla_cab = placab.id_pla_cab
         group 
            by resdet.res_formulario,
               placab.titulo,
               placab.id_pla_cab) as t1
 inner
  join (select count(1) as cant_resp_por_form, 
               placab.titulo as formulario,
               placab.id_pla_cab		   
          from frm_plantilla_det pladet
         inner
          join frm_plantilla_cab placab
            on pladet.id_pla_cab = placab.id_pla_cab
         inner
          join frm_tipo_valor tipfrm
            on tipfrm.id_tpo_val = pladet.id_tpo_val
         where cod_tpo_val != 'ETQ'			
         group 
            by placab.titulo,
               placab.id_pla_cab) as t2
    on t1.id_pla_cab = t2.id_pla_cab
 group
    by t1.formulario
 ORDER
    BY 7 DESC
 LIMIT 4;    
              