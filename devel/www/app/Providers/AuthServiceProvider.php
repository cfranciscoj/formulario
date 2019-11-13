<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        //  Para Adminstrador
        Gate::define('Admin', function($user) {
            return $user->hasAnyRole('admin');
        });
        //  Para Adminstrador y Supervisor
        Gate::define('AdminSupervisor', function($user) {
            return $user->hasAnyRole(['admin','super']);
        });
        //  Para Supervisor
        Gate::define('Supervisor', function($user) {
            return $user->hasAnyRole('super');
        });
        // Para Usuarios
        Gate::define('Usuario', function($user) {
            return $user->hasAnyRole('user');
        });
        //  Para Todos los perfiles, menos el vacio
        Gate::define('Todos', function($user) {
            return $user->hasAnyRole(['admin','super','user']);
        });
    }
}
