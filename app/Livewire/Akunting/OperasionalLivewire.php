<?php

namespace App\Livewire\Akunting;

use App\Models\Akunting\Akun;
use App\Models\Akunting\Operasional;
use Livewire\Attributes\Layout;
use Livewire\Component;

use function PHPUnit\Framework\isEmpty;

class OperasionalLivewire extends Component
{
    public $id, $tanggal, $id_akun, $tujuan, $jumlah, $tipe, $kas_masuk, $kas_keluar, $saldo, $saldo_terakhir;
    public $cek_limit, $cek_urutan, $cek_order_by;

    public function mount()
    {
        $this->cek_limit = 10;
        $this->cek_urutan = 'ASC';
        $this->cek_order_by = 'acc_operasional.created_at';
    }
    #[Layout('template')]
    public function render()
    {
        $akun = Akun::all();
        $data = Operasional::select('acc_operasional.id', 'acc_akun.id', 'acc_akun.nama_akun', 'acc_operasional.tujuan', 'acc_operasional.tanggal', 'acc_operasional.jumlah', 'acc_operasional.tipe', 'acc_operasional.kas_masuk', 'acc_operasional.kas_keluar', 'acc_operasional.saldo')
            ->join('acc_akun', 'acc_operasional.id_akun', '=', 'acc_akun.id')
            ->orderBY($this->cek_order_by, $this->cek_urutan)
            ->offset($this->cek_limit)
            ->limit($this->cek_limit)
            ->paginate($this->cek_limit);
        $get_saldo = Operasional::select('saldo')->orderBY('tanggal', 'DESC')->first();
        if ($get_saldo) {
            $this->saldo_terakhir = $get_saldo['saldo'];
        } else {
            $this->saldo_terakhir = 0;
        }
        return view('livewire.akunting.operasional-livewire', [
            'data' => $data,
            'akun' => $akun,
        ]);
    }

    public function store()
    {
        if ($this->tipe == 'debit') {
            $total_kas = $this->jumlah * $this->saldo;
            $total_saldo = $this->saldo_terakhir - $total_kas;

            $data = [
                'id_akun' => $this->id_akun,
                'tujuan' => $this->tujuan,
                'jumlah' => $this->jumlah,
                'tipe' => $this->tipe,
                'kas_keluar' => $total_kas,
                'saldo' => $total_saldo,
            ];

            Operasional::create($data);
            session()->flash('message', 'Berhasil Menyimpan Data');
            $this->ClearForm();
            $this->saldo_terakhir = $total_saldo;
        } else {
            $total_kas = $this->jumlah * $this->saldo;
            $total_saldo = $this->saldo_terakhir + $total_kas;

            $data = [
                'id_akun' => $this->id_akun,
                'tujuan' => $this->tujuan,
                'jumlah' => $this->jumlah,
                'tipe' => $this->tipe,
                'kas_masuk' => $total_kas,
                'saldo' => $total_saldo,
            ];

            Operasional::create($data);
            session()->flash('message', 'Berhasil Menyimpan Data');
            $this->ClearForm();
            $this->saldo_terakhir = $total_saldo;
        }
    }

    public function ClearForm()
    {
        $this->id_akun = null;
        $this->tujuan = null;
        $this->jumlah = null;
        $this->tipe = null;
        $this->saldo = null;
    }
}
