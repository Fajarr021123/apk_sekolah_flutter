<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProfilGuru extends Model
{
    protected $table = 'profil_guru';
    protected $fillable = ['Guru_ID', 'Kelas_ID', 'Pelajaran_ID'];

    public function guru()
    {
        return $this->belongsTo(User::class, 'Guru_ID');
    }

    public function kelas()
    {
        return $this->belongsTo(Kelas::class, 'Kelas_ID');
    }

    public function pelajaran()
    {
        return $this->belongsTo(Pelajaran::class, 'Pelajaran_ID');
    }
}
