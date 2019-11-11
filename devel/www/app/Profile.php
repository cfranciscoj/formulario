<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Profile extends Model
{
  public function TraeDatosPersonales($id_user)
  {
      $qry = <<<EOT
                   SELECT usr.name      AS nombre,
                          usr.last_name AS apellido,
                          usr.email     AS email,
                          usr.username  AS username
                     FROM users usr
                    WHERE usr.id = ${id_user};
EOT;
      return DB::select($qry);
  }
}
