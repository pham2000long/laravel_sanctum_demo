<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    private $user;

    public function __construct(User $user)
    {
        $this->user = $user;
    }

    public function index()
    {
        // dd("hello");
        $users = $this->user->all();
        return response()->json([
            'code' => 200,
            'data' => $users
        ], 200);
    }
}
