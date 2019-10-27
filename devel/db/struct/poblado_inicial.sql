


INSERT INTO frmdb.frm_tipo_valor (cod_tpo_val, nom_largo           , nom_corto, fch_crea           , usr_crea, fch_mod, usr_mod) 
                           VALUES('TXT'      , 'Respuesta de texto', 'texto'  , current_timestamp(), 10    , NULL   , NULL);
INSERT INTO frmdb.frm_tipo_valor (cod_tpo_val, nom_largo           , nom_corto, fch_crea           , usr_crea, fch_mod, usr_mod) 
                           VALUES('CHK'      , 'Respuesta de CheckBox', 'check'  , current_timestamp(), 10    , NULL   , NULL);
INSERT INTO frmdb.frm_tipo_valor (cod_tpo_val, nom_largo           , nom_corto, fch_crea           , usr_crea, fch_mod, usr_mod) 
                           VALUES('RAD'      , 'Respuesta de RadioButton', 'radio'  , current_timestamp(), 10    , NULL   , NULL);
INSERT INTO frmdb.frm_tipo_valor (cod_tpo_val, nom_largo           , nom_corto, fch_crea           , usr_crea, fch_mod, usr_mod) 
                           VALUES('GLO'      , 'Respuesta de Glosa', 'glosa'  , current_timestamp(), 10    , NULL   , NULL);

                          
                          
INSERT INTO frmdb.frm_plantilla_cab (titulo, descripicion, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES('Formulario', 'Formulario de requerimiento de datos', current_timestamp(), 10, NULL, NULL);

                             
INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta, nom_corto, id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'Nombre', 'Nombre' , 1         , 0             , current_timestamp(), 10, NULL, NULL);

INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta, nom_corto, id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'Módulo', 'Módulo' , 1         , 0             , current_timestamp(), 10, NULL, NULL);
                             
INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta, nom_corto, id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'Cargo', 'Cargo'   , 1         , 0             , current_timestamp(), 10, NULL, NULL);
                             
INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta             , nom_corto  , id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'Ejecutivo comercial', 'Ejecutivo', 2         , 0             , current_timestamp(), 10, NULL, NULL);
                             
INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta             , nom_corto  , id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'Asistente comercial', 'Asistente', 2         , 0             , current_timestamp(), 10, NULL, NULL);
                             
INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta     , nom_corto    , id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'Operaciones', 'Operaciones', 2         , 0             , current_timestamp(), 10, NULL, NULL);
                             
INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta, nom_corto, id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'SACS'  , 'SACS'   , 2         , 0             , current_timestamp(), 10, NULL, NULL);
                             
INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta, nom_corto, id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'UPR'   , 'UPR'    , 2         , 0             , current_timestamp(), 10, NULL, NULL);
                             
INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta      , nom_corto     , id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'Cumplimiento', 'Cumplimiento', 2         , 0             , current_timestamp(), 10, NULL, NULL);

                             
INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta , nom_corto, id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'Persona', 'Persona', 2         , 11            , current_timestamp(), 10, NULL, NULL);
                             
INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta , nom_corto, id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'Empresa', 'Empresa', 2         , 11            , current_timestamp(), 10, NULL, NULL);                             
                             
INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta , nom_corto, id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'Grupo', 'Grupo', 2         , 11            , current_timestamp(), 10, NULL, NULL);                             

                             
INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta , nom_corto, id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'Persona', 'Persona', 2         , 12            , current_timestamp(), 10, NULL, NULL);
                             
INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta , nom_corto, id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'Empresa', 'Empresa', 2         , 12            , current_timestamp(), 10, NULL, NULL);
                             
INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta          , nom_corto, id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'Cuenta Corriente', 'CtaCte' , 2         , 13            , current_timestamp(), 10, NULL, NULL);
                             
INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta     , nom_corto     , id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'Hipotecario', 'Hipotecario' , 2         , 13            , current_timestamp(), 10, NULL, NULL);

INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta , nom_corto, id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'Tarjeta', 'Tarjeta', 2         , 13            , current_timestamp(), 10, NULL, NULL);
                             
INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta  , nom_corto , id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'Custodia', 'Custodia', 2         , 13            , current_timestamp(), 10, NULL, NULL);
                             
                             
INSERT INTO frmdb.frm_plantilla_det (id_pla_cab, etiqueta, nom_corto, id_tpo_val, id_pla_det_pdr, fch_crea, usr_crea, fch_mod, usr_mod) 
                              VALUES(8         , 'Comentario', 'Comentario' , 4         , 0             , current_timestamp(), 10, NULL, NULL);
                             
                             