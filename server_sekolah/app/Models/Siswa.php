<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Siswa extends Model
{
    protected $table = 'siswa';
    protected $fillable = ['Nama_Siswa', 'Kelas_ID'];

    public function kelas()
    {
        return $this->belongsTo(Kelas::class, 'Kelas_ID');
    }
}
