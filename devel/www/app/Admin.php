<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Admin extends Model
{
  public function TraePlanResp($ide_titulo)
  {
      $qry = <<<EOT
                  SELECT det.etiqueta    AS agrupacion,
                         val.nom_corto   AS tpo_nom_agrupacion,
                         usr.username    AS username_crea,
                         det.fch_crea    AS fch_crea,
                         usm.username    AS username_mod,
                         det.fch_mod     AS fch_mod
                    FROM frm_plantilla_det det
                   INNER
                    JOIN frm_tipo_valor val
                      ON det.id_tpo_val = val.id_tpo_val
                    JOIN users usr
                      ON det.usr_crea = usr.id
                    LEFT
                    JOIN users usm
                      ON det.usr_mod = usm.id
                   WHERE det.id_pla_det_pdr = 0
                     AND det.id_pla_cab = ${ide_titulo};
EOT;
      return DB::select($qry);


  }
}
