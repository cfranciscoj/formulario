<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Formulario extends Model
{
    //
    public function TraeTitulo()
    {
        $qry = <<<EOT
                      SELECT cab.titulo      AS titulo,
                             cab.id_pla_cab  AS ide_titulo
                        FROM frm_plantilla_cab cab;
EOT;
        return DB::select($qry);


    }


    public function TraeAgrupacion($ide_titulo)
    {
        $qry = <<<EOT
                      SELECT det.id_pla_det  AS ide_agrupacion,
                             det.id_pla_cab  AS ide_titulo,
                             det.etiqueta    AS agrupacion,
                             val.cod_tpo_val AS tpo_val_agrupacion
                        FROM frm_plantilla_det det
                       INNER
                        JOIN frm_tipo_valor val
                          ON det.id_tpo_val = val.id_tpo_val
                       WHERE det.id_pla_det_pdr = 0
                         AND det.id_pla_cab = ${ide_titulo};
EOT;
        return DB::select($qry);


    }

    public function TraeEtiqueta($ide_agrupacion)
    {
        $qry = <<<EOT
                      SELECT det.id_pla_det     AS ide_etiqueta,
                             det.id_pla_det_pdr AS ide_agrupacion,
                             det.etiqueta       AS etiqueta,
                             val.cod_tpo_val    AS tpo_val_etiqueta
                        FROM frm_plantilla_det det
                       INNER
                        JOIN frm_tipo_valor val
                          ON det.id_tpo_val = val.id_tpo_val
                       WHERE det.id_pla_det_pdr = ${ide_agrupacion};
EOT;
        return DB::select($qry);


    }
}
