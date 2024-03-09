<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function index(){
        return view('auth.login');
    }

    public function login(Request $request){
        $data = [
            'email' => $request->email,
            'password' => $request->password
        ];

        $login = Auth::guard('admin')->attempt($data);

        if($login){
            return redirect('/dashboard')->with('login_success', 'Selamat Datang '. Auth::guard('admin')->user()->user_name);
        }else{
            return back()->with('login_error', 'Login Gagal');
        }
    }

    public function logout(){
        Auth::guard('admin')->logout();
        return redirect('/');
    }
}
