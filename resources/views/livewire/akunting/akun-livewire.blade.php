@push('title')
    Akun
@endpush
<div class="panel">
    {{-- data akun --}}
    <div class="panel-body">
        <div class="d-flex justify-content-end p-3 ">
            <div>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#tambah">Tambah</button>
            </div>
        </div>
        <table class="table table-hover table-striped w-full">
            <div class="row mb-2">
                <div class="col-md-2 col-lg-2">
                    <label class="form-control-label">Data</label>
                    <select class="form-control" wire:model.live="cek_limit" required>
                        <option>10</option>
                        <option>50</option>
                        <option>100</option>
                        <option>250</option>
                        <option>500</option>
                    </select>
                </div>
                <div class="col-md-2 col-lg-2">
                    <label class="form-control-label">Order</label>
                    <select class="form-control" wire:model.live="cek_urutan" required>
                        <option value="ASC">A-Z</option>
                        <option value="DESC">Z-A</option>
                    </select>
                </div>
                <div class="col-md-2 col-lg-2">
                    <label class="form-control-label">BY</label>
                    <select class="form-control" wire:model.live="cek_order_by" required>
                        <option value="nama_akun">Nama Akun</option>
                        <option value="kode_akun">Kode Akun</option>
                        <option value="created_at">Created At</option>
                    </select>
                </div>
            </div>
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Akun</th>
                    <th>Kode Akun</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>No</th>
                    <th>Nama Akun</th>
                    <th>Kode Akun</th>
                    <th>Action</th>
                </tr>
            </tfoot>
            <tbody>
                @foreach ($data as $datas)
                    <tr wire:key="{{ $datas->id }}">
                        <td>{{ $loop->index + 1 }}</td>
                        <td>{{ $datas->nama_akun }}</td>
                        <td>{{ $datas->kode_akun }}</td>
                        <td>
                            <button type="button" class="btn btn-danger"
                                wire:click.prevent="destroy({{ $datas->id }})">
                                <i class="icon md-delete" aria-hidden="true"></i>
                            </button>
                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#edit" wire:click.prevent="show({{ $datas->id }})">
                                <i class="icon md-edit" aria-hidden="true"></i>
                            </button>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        {{ $data->links() }}
    </div>
    {{-- end data akun --}}


    {{-- modal tambah --}}
    <div wire:ignore.self class="modal fade" id="tambah" tabindex="-1" aria-labelledby="ModalTambah" aria-hidden="true">
        <form wire:submit="store" enctype="multipart/form-data">
            <div class="modal-dialog modal-simple modal-content modal-lg">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="exampleFormModalLabel">Form Akun</h4>
                </div>
                <div class="modal-body">
                    @if(session()->has('message'))
                        <div class="alert alert-success mb-2">
                            {{ session('message') }}
                        </div>
                    @endif
                    <div class="row">
                        <div class="form-group form-material col-md-12 ">
                            <label class="form-control-label">Nama Akun</label>
                            <input type="text" name="nama_akun" wire:model.live="nama_akun" placeholder="Nama Akun"
                                class="form-control" autocomplete="off" required>
                        </div>
                        <div class="form-group form-material col-md-12 ">
                            <label class="form-control-label">Kode Akun</label>
                            <input type="text" name="kode_akun" wire:model.live="kode_akun" placeholder="Koda Akun"
                                class="form-control" autocomplete="off" required>
                        </div>
                        <hr>
                        <div class="d-flex" style="width: 100%">
                            <div class="col-md-6 float-right">
                                <button wire:loading.attr="disabled" type="submit"
                                    class="btn btn-primary btn-block">Save</button>
                            </div>

                            <div class="col-md-6 float-left">
                                <button type="button" wire:click="ClearForm" data-dismiss="modal" aria-label="Close"
                                    class="btn btn-primary btn-block">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    {{-- End Modal Tambah --}}

    {{-- Modal Edit --}}
        <div wire:ignore.self class="modal fade" id="edit" tabindex="-1" aria-labelledby="ModalTambah" aria-hidden="true">
        <form wire:submit="update({{ $id_akun }})" enctype="multipart/form-data">
            <div class="modal-dialog modal-simple modal-content modal-lg">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="exampleFormModalLabel">Form Akun</h4>
                </div>
                <div class="modal-body">
                    @if(session()->has('message'))
                        <div class="alert alert-success mb-2">
                            {{ session('message') }}
                        </div>
                    @endif
                    <div class="row">
                        <div class="form-group form-material col-md-12 ">
                            <label class="form-control-label">Nama Akun</label>
                            <input type="text" name="nama_akun" wire:model.live="nama_akun" placeholder="Nama Akun"
                                class="form-control" autocomplete="off" required>
                        </div>
                        <div class="form-group form-material col-md-12 ">
                            <label class="form-control-label">Kode Akun</label>
                            <input type="text" name="kode_akun" wire:model.live="kode_akun" placeholder="Koda Akun"
                                class="form-control" autocomplete="off" required>
                        </div>
                        <hr>
                        <div class="d-flex" style="width: 100%">
                            <div class="col-md-6 float-right">
                                <button wire:loading.attr="disabled" type="submit"
                                    class="btn btn-primary btn-block">Edit</button>
                            </div>

                            <div class="col-md-6 float-left">
                                <button type="button" wire:click="ClearForm" data-dismiss="modal" aria-label="Close"
                                    class="btn btn-primary btn-block">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
